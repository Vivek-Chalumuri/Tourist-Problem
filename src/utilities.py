# Author: Francesco Nuzzo
import math
import random
import networkx as nx
import numpy as np


def distance(point_a, point_b):
    dx = point_a[0] - point_b[0]
    dy = point_a[1] - point_b[1]
    return math.sqrt(dx ** 2 + dy ** 2)


def powerset(s):
    powerset = set()
    # n = len(s)
    for i in range(2 ** len(s)):
        subset = tuple([x for j, x in enumerate(s) if (i >> j) & 1])
        s_cardinality = len(subset)

        if not (2 <= s_cardinality):
            continue

        powerset.add(subset)
    # print('n = {0}, # subtours = {1}'.format(n, len(powerset)))
    # print(powerset)
    return powerset


def generate_graph(n, min_reward=1, max_reward=10, map_size=(10, 10), map_side=None, random_seed=None):
    random.seed(random_seed)

    # Returned values
    node_rewards = []
    node_costs = []
    adj_matrix_costs = np.zeros((n, n), dtype=int)

    if map_side is None:
        len_x, len_y = map_size
    else:
        len_x = len_y = map_side

    graph = nx.to_directed(nx.complete_graph(n))

    node_positions = dict((i, {'pos': (random.uniform(0, len_x), random.uniform(0, len_y))}) for i in range(n))

    nx.set_node_attributes(graph, node_positions)

    # Weight equal to distance, converted to integer
    edges = graph.edges()
    weights = []
    for u, v in edges:
        dist = math.ceil(int(distance(graph.nodes()[u]['pos'], graph.nodes()[v]['pos'])))
        adj_matrix_costs[u, v] = dist
        graph[u][v]['weight'] = dist
        weights.append(dist)

    average_edges_weight = np.mean(weights)
    # std_edges_weight = np.std(weights)
    # print('Average edges weight: {:.5}'.format(average_edges_weight))
    # print('Std edges weight: {:.5}'.format(std_edges_weight))

    # Nodes have random reward and costs
    # The cost is in [1, average_edges_weight)
    for node in graph.nodes(data=True):
        reward = random.randint(min_reward, max_reward)
        cost = random.randint(1, math.ceil(int(average_edges_weight)))
        node[1]['reward'] = reward
        node[1]['cost'] = cost
        node_rewards.append(reward)
        node_costs.append(cost)

    # Add the cost of the node to the edge
    for u, v in edges:
        graph[u][v]['weight'] += node_costs[v]

    # Inserting null node as node with index 'n'
    null_node = n
    graph.add_node(n, pos=(0, 0), reward=0, cost=0)
    for node in graph.nodes():
        graph.add_edge(node, null_node, weight=0)
        graph.add_edge(null_node, node, weight=0)

    return graph, node_rewards, node_costs, adj_matrix_costs

    # def get_fixed_instance():
    #     n = 4
    #
    #     G = nx.to_directed(nx.complete_graph(n))
    #
    #     node_positions = [
    #         (0, 0),
    #         (5, 5),
    #         (5, 4),
    #         (-100, -100)
    #     ]
    #
    #     node_rewards = [0, 10, 3, 10]
    #
    #     pos = dict((i, {'pos': node_positions[i]}) for i in range(n))
    #     dict_node_rewards = dict((i, {'reward': node_rewards[i]}) for i in range(n))
    #
    #     nx.set_node_attributes(G, pos)
    #     nx.set_node_attributes(G, dict_node_rewards)
    #
    #     weights = dict(
    #         ((u, v), {'weight': int(distance(pos[u]['pos'], pos[v]['pos']))}) for u in range(n) for v in range(n))
    #
    #     nx.set_edge_attributes(G, weights)
    #     matrix_adj = nx.all_pairs_dijkstra(G, weight='weight')
    #
    #     weights = {}
    #     for entry in matrix_adj:
    #         u = entry[0]
    #         for v, weight in entry[1][0].items():
    #             weights[(u, v)] = {'weight': weight}
    #
    #     # weights = dict(
    #     #     ((entry[0],v), {'weight': entry[1][0][v]}) for v in range(n) for entry in matrix_adj)
    #     nx.set_edge_attributes(G, weights)
    #     return G, n
