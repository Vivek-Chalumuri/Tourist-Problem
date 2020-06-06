# Author: Francesco Nuzzo
from docplex.mp.model import Model
from docplex.mp.model_reader import ModelReader
import numpy as np
import sys
from src.utilities import powerset


class LpModelInterface:

    def __init__(self, outer_model_interface):

        self.outer_model_interface = outer_model_interface
        self.docplex_model = None
        self.graph = outer_model_interface.graph
        self.n = outer_model_interface.n
        self.node_rewards = outer_model_interface.node_rewards
        self.node_costs = outer_model_interface.node_costs
        self.starting_node = None
        self.ending_node = None
        self.budget = None
        self.null_node = None
        self.seed = outer_model_interface.seed

    def insert_null_node(self):
        """
        Insert a null node which will be the starting and ending point of any path.

        It's a fake node with cost 0, reward 0 and edges with costs 0. It's only purpose is to
        be a able to generate path with different options, such as:

        starting_node = ending_node = None

        starting_node = a node,
        ending_node = None

        starting_node = None,
        ending_node = a node

        starting_node = a node,
        ending_node = another node


        ATTENTION: if starting_node = ending_node and it's not None, then the null_node it's NOT created.

        """

        # Insert reward of null node
        self.node_rewards.append(0)

        self.null_node = self.n
        self.n += 1

        for i in range(self.n):
            if i == self.null_node:
                continue
            self.graph[i][self.null_node]['weight'] = 0
            self.graph[self.null_node][i]['weight'] = 0

    # Constraints generators
    def generate_general_constraints(self, path, filename):
        """
        Generates the constraints that can be reused for a problem of the same size (n).

        Returns a problem with these constraints.
        """

        m = Model()

        ###############
        # EQUATION (1)
        # Creating decision variables x[i][j]
        x = self.init_decision_variables(m)

        ###############
        # EQUATION (4)
        # Starting node condition
        self.generate_constraint_four(m, x)

        ###############
        # EQUATION (5)
        # Every node is visited maximum once
        self.generate_constraint_five(m, x)

        ###############
        # EQUATION (6)
        # For each node: incoming edges equal to outgoing edges
        self.generate_constraint_six(m, x)

        ###############
        # EQUATION (7)
        # Subtour elimination constraints
        self.generate_constraint_seven(m, x)

        m.export_as_lp(path=path, basename=filename)

        return m

    def init_decision_variables(self, model):
        x = np.zeros((self.n, self.n), dtype=object)
        ###############
        # EQUATION (1)
        # Creating decision variables x[i][j]
        for i in range(self.n):
            for j in range(self.n):
                # Taking the indexes of the two nodes
                str_decision_variable = 'x_{0}_{1}'.format(i, j)
                x[i, j] = model.binary_var(name=str_decision_variable)
        return x

    def generate_constraint_four(self, m, x):
        """
        Starting node condition.

        If start != end, then this real starting node is the null node, because any
        path will start from the null node, and also end in the null node.
        """
        expression = m.linear_expr()
        real_starting_node = self.get_real_starting_node()

        for j in range(self.n):
            if j == real_starting_node:
                continue

            expression = expression.plus(x[real_starting_node, j])
        constraint = m.eq_constraint(expression, 1)
        m.add_constraint(constraint)

    def generate_constraint_five(self, m, x):
        """
        Every node is visited maximum once
        """
        for i in range(self.n):
            expression = m.linear_expr()
            for j in range(self.n):
                expression = expression.plus(x[i, j])
            constraint = m.le_constraint(expression, 1)
            m.add_constraint(constraint)

    def generate_constraint_six(self, m, x):
        """
        For each node: incoming edges equal to outgoing edges
        """
        for i in range(self.n):
            expression = m.linear_expr()
            for j in range(self.n):
                expression = expression.plus(x[i, j]).minus(x[j, i])
            constraint = m.eq_constraint(expression, 0)
            m.add_constraint(constraint)

    def generate_constraint_seven(self, m, x):
        """
        Subtour elimination constraints.

        The only loop admitted is the one containing the starting node (either it is the null_node or not).
        So, if the subtour contains the starting node, a loop is admitted.

        Note: Given a connected graph with n nodes, there is no loop only if the number of edges is n-1.
        """
        all_subtours = powerset(range(self.n))
        count = 0
        len_all_subtours = len(all_subtours)

        real_starting_node = self.get_real_starting_node()

        for subtour in all_subtours:
            if real_starting_node in subtour:
                continue
            expression = m.linear_expr()
            s_cardinality = len(subtour)
            for i in subtour:
                for j in subtour:
                    if i == j:
                        continue

                    expression = expression.plus(x[i, j])

            constraint = m.le_constraint(expression, s_cardinality - 1)
            m.add_constraint(constraint)

            # Printing the progress
            if count % 1000 == 0:
                sys.stdout.write(
                    '\rSubtours completed: {}/{} = {:.4}%'.format(count, len_all_subtours,
                                                                  100 * count / len_all_subtours))
                sys.stdout.flush()
            count += 1

    def create_model(self):
        """
        Creates a docplex model.

        It first tries to get the majority of the constraints
        (those that are independent from the problem instance) from a directory.

        If none is found, they are generated, exported in a file and saved in the current model.
        """

        self.try_load_model()

        self.set_correct_problem_instance_name()

        self.add_objective_and_budget_constraints()
        self.add_starting_ending_nodes_constraints()

        self.docplex_model.print_information()

        # DEBUG
        # for constraint in self.docplex_model.iter_constraints():
        #     print(constraint)

    def add_objective_and_budget_constraints(self):
        """
        Add the problem-instance-dependent constraints.
        """
        ###############
        # EQUATION (2)
        # Objective: maximize sum of values of visited nodes
        expression = self.docplex_model.linear_expr()
        for i in range(self.n):
            v_i = self.node_rewards[i]
            for j in range(self.n):
                if i == j:
                    continue
                x_j_i = self.docplex_model.get_var_by_name('x_{0}_{1}'.format(j, i))
                expression = expression.plus(v_i * x_j_i)
        self.docplex_model.maximize(expression)

        ###############
        # EQUATION (3)
        # Constraints for total cost <= total_resources
        edges_data = self.graph.edges(data=True)
        expression = self.docplex_model.linear_expr()
        for edge in edges_data:
            i, j, cost = edge
            cost_i_j = list(cost.values())[0]
            x_i_j = self.docplex_model.get_var_by_name('x_{0}_{1}'.format(i, j))
            expression = expression.plus(cost_i_j * x_i_j)
        constraint = self.docplex_model.le_constraint(expression, self.budget)
        self.docplex_model.add_constraint(constraint)

    def add_starting_ending_nodes_constraints(self):
        """
        These constraints connect the null node to the starting node and to the ending node, if they are specified.

        If the solution is a loop (start=end), then no constraints are generated from this function.
        """
        if self.sol_is_loop():
            return
        ###############
        # EQUATIONS (8) and (9)
        # Starting and ending conditions, if specified
        if self.starting_node is not None:
            x_null_start = self.docplex_model.get_var_by_name('x_{0}_{1}'.format(self.null_node, self.starting_node))
            self.docplex_model.add_constraint(x_null_start == 1)

        if self.ending_node is not None:
            x_end_null = self.docplex_model.get_var_by_name('x_{0}_{1}'.format(self.ending_node, self.null_node))
            self.docplex_model.add_constraint(x_end_null == 1)

    def compute_solution(self):
        """
        Run the cplex solver.
        """
        return self.docplex_model.solve()

    def sol_is_loop(self):
        """
        Check if starting_node = ending_node and they are not None.

        If they are not, then we will need a null node.
        """
        return self.starting_node is not None and self.starting_node == self.ending_node

    def try_load_model(self):
        """
        Tries to load a file containing the constraints. If it is not found, it will be generated.

        If the starting and ending point are the same, and not None, the null node is not used,
        so a different file is generated/loaded.
        """
        filename = 'constraints_problem_size_{0}'.format(self.get_real_n())
        path = '../cache_constraints/'

        solution_is_loop = self.sol_is_loop()

        if solution_is_loop:
            filename += '_loop'
        path_filename = path + filename + '.lp'

        model_reader = ModelReader()

        self.outer_model_interface.check_dir(path)

        try:
            # Load the constraints
            self.docplex_model = model_reader.read_model(path_filename)
        except:
            # If they are not cached, create them
            print("\nFile {} not found :(\nI'm gonna create it! :D".format(path_filename))
            self.docplex_model = self.generate_general_constraints(path, filename)

    def delete_null_node(self):
        null_node = self.n

        self.graph.remove_node(null_node)

    # Getters

    def get_problem_instance_name(self):
        return self.docplex_model.name

    def get_real_n(self):
        """
        Returns

        n+1, if we use the null node

        n, otherwise
        """
        return self.n if self.sol_is_loop() else self.n - 1

    def get_real_starting_node(self):
        """
        If starting_node = ending_node and they are not none, then it returns starting_node.

        Otherwise, null_node is returned.
        """
        return self.starting_node if self.sol_is_loop() else self.null_node

    # Setters

    def set_starting_ending_nodes(self, starting_node=None, ending_node=None):
        self.starting_node = starting_node
        self.ending_node = ending_node

        if self.starting_node is not None:
            self.node_rewards[self.starting_node] = 0

        if not self.sol_is_loop():
            self.insert_null_node()
        else:
            self.delete_null_node()

    def set_budget(self, budget):
        self.budget = budget

    def set_correct_problem_instance_name(self):
        # don't count the null node, if there is any

        problem_instance_name = 'problem_n_{0}_from_{1}_to_{2}_budget_{3}_seed_{4}'.format(self.get_real_n(),
                                                                                           self.starting_node,
                                                                                           self.ending_node,
                                                                                           self.budget,
                                                                                           self.seed)
        self.docplex_model.name = problem_instance_name
