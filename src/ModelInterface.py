# Author: Francesco Nuzzo
from src.utilities import generate_graph
from src.pddl_generator import export_ppdl_file
from src.LpModelInterface import LpModelInterface
import os
import time


class ModelInterface:

    def __init__(self):
        self.solver_type = None

        self.n = None
        self.starting_node = None
        self.ending_node = None
        self.adj_matrix_costs = None
        self.node_costs = None
        self.node_rewards = None
        self.budget = None

        self.seed = None

        self.graph = None
        self.docplex_model_interface = None

        self.solution_lp = None

        # Flags for correct program flow
        self.problem_generated = False
        self.lp_formulated = False
        self.lp_solved = False

    def generate_problem_instance(self, n, random_seed):
        """
        Generates a complete directed graph with n nodes.
        The weights of the edges and the costs and rewards of the nodes
        depend on the seed.
        For a given seed and n, the problem instance will be the same.
        """
        self.n = n
        self.seed = random_seed
        self.graph, self.node_rewards, self.node_costs, self.adj_matrix_costs = generate_graph(n,
                                                                                               random_seed=random_seed)
        self.problem_generated = True

    def export_in_pddl(self):
        assert self.problem_generated, "Generate a problem before exporting in pddl"

        path = '../generated_ppdl_problem_instances/'
        self.check_dir(path)
        filename = 'problem_n_{0}_from_{1}_to_{2}_budget_{3}_seed_{4}.pddl'.format(self.n,
                                                                                   self.starting_node,
                                                                                   self.ending_node,
                                                                                   self.budget,
                                                                                   self.seed)
        destination_filename = path + filename

        export_ppdl_file(destination_filename, self.n, self.adj_matrix_costs, self.node_costs, self.node_rewards,
                         self.starting_node, self.ending_node, self.budget)

    def formulate_lp_problem_instance(self):
        assert self.problem_generated, "Generate a problem before formulating in linear programming"

        self.docplex_model_interface = LpModelInterface(self)

        self.docplex_model_interface.set_starting_ending_nodes(self.starting_node, self.ending_node)

        self.docplex_model_interface.set_budget(self.budget)

        self.docplex_model_interface.create_model()

        self.lp_formulated = True

    def solve_lp(self):
        assert self.lp_formulated, "Formulate in linear programming before trying to solve"

        time1 = time.time()
        self.solution_lp = self.docplex_model_interface.compute_solution()
        time2 = time.time()

        print('Time for finding a solution: {:.5} seconds\n'.format(time2 - time1))

        if self.solution_lp is None:
            print("\nNo solution found")

        self.lp_solved = True
        return self.solution_lp

    def export_lp_solution(self):
        """
        Create a file with in '../lp_solutions/' containing the solution of the lp problem.
        The solution contains the objective and the path.
        """
        assert self.lp_solved, "Solve a LP problem before exporting the solution to a file"
        filename = self.docplex_model_interface.get_problem_instance_name() + '.sol'

        path = '../lp_solutions/'
        self.check_dir(path)
        filename = path + filename
        file = open(filename, 'w')
        file.write(str(self.solution_lp))
        file.close()

    @staticmethod
    def check_dir(directory):
        """
        Check the existence of a directory and create it if it doesn't exit.
        """
        os.makedirs(directory, exist_ok=True)

    # Setters
    def set_starting_ending_nodes(self, starting_node, ending_node):
        self.starting_node = starting_node
        self.ending_node = ending_node

    def set_time_resources(self, time_resources):
        self.budget = time_resources
