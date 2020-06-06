from argparse import ArgumentParser
from src.ModelInterface import ModelInterface

# Additional parameters can be set in PyCharm by going in
# Run -> Edit Configuration -> Configuration -> Parameters
#
# Example of parameters:
# -n 5 -sn 0 -en 1 -tr 20 -s 0

# Initialization of argument parser
parser = ArgumentParser()
parser.add_argument("-n", "--number_of_nodes", help="Number of nodes of the graph", type=int)
parser.add_argument("-sn", "--starting_node",
                    help="First node of the path. Set to -1 if you don't want any fixed starting node", type=int)
parser.add_argument("-en", "--ending_node",
                    help="Last node of the path. Set to -1 if you don't want any fixed starting node", type=int)
parser.add_argument("-b", "--budget", help="Total time available for visiting the nodes", type=int)
parser.add_argument("-s", "--seed", help="Random seed for generating a specific instance of the problem", type=int)
args = parser.parse_args()

# # Processing the parameters
n = args.number_of_nodes
starting_node = args.starting_node if args.starting_node != -1 else None
ending_node = args.ending_node if args.ending_node != -1 else None
time_resources = args.budget
seed = args.seed

# Init of model handler
model_interface = ModelInterface()

# Problem generated and saved inside the interface
print("Generating a problem...\n")
model_interface.generate_problem_instance(n, seed)

# Setting parameters
model_interface.set_starting_ending_nodes(starting_node=starting_node, ending_node=ending_node)
model_interface.set_time_resources(time_resources=time_resources)

# Saving pddl problem instance
# print("Exporting pddl problem")
# model_interface.export_in_pddl()

# Formulate lp problem
print("Formulating lp problem...\n")
model_interface.formulate_lp_problem_instance()

print("Computing solution with lp...\n")
sol = model_interface.solve_lp()

print(sol)
#
# model_interface.export_lp_solution()

#
# CODE FOR GENERATING ALL TEST CASES
#
# Processing the parameters
# experimented_n_nodes = [6, 9, 12, 15]
# for number_of_nodes in experimented_n_nodes:
#     # For seed
#     budget = 2 * number_of_nodes
#     for random_seed in range(100):
#         n = number_of_nodes
#         starting_node = args.starting_node
#         ending_node = args.ending_node
#         time_resources = budget
#         seed = random_seed
#
#         # Init of model handler
#         model_interface = ModelInterface()
#
#         # Problem generated and saved inside the interface
#         model_interface.generate_problem_instance(n, random_seed)
#
#         # Setting parameters
#         model_interface.set_starting_ending_nodes(starting_node=starting_node, ending_node=ending_node)
#         model_interface.set_time_resources(time_resources=time_resources)
#
#         # Saving pddl problem instance
#         model_interface.export_in_pddl()
#
#         # Formulate lp problem
#         model_interface.formulate_lp_problem_instance()
#
#         sol = model_interface.solve_lp()
#
#         # print(sol)
#
#         model_interface.export_lp_solution()
