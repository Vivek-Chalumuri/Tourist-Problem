# Author: Vivek Chalumuri

def export_ppdl_file(destination_filename, n, adj_matrix_costs, node_costs, node_rewards, starting_node, ending_node,
                     time_resources):
    '''
    traveltimeMatrix = np.random.randint(10,80, size=(8,8))
    timeList = np.random.randint(20,100, size=(8))
    expList = np.random.randint(100,600, size=(8))
    initNode = 0
    endNode = 6
    maxTime = 300
    '''

    obj_string = "(:objects"
    init_string = "(:init \n"
    tt_string = '\n'
    ta_string = '\n'
    exp_string = '\n'
    visit_string = '\n'

    for i in range(n):
        for j in range(n):
            if i != j:
                tt_string += "(= (travelTime " + "n" + str(i) + " n" + str(j) + ") " + str(
                    adj_matrix_costs[i][j]) + ")\n"
        obj_string += " n" + str(i)
        ta_string += "(= (timeAt n" + str(i) + ") " + str(node_costs[i]) + ")\n"
        exp_string += "(= (exp n" + str(i) + ") " + str(node_rewards[i]) + ")\n"
        if i != starting_node:
            visit_string += "(notVisited n" + str(i) + ")\n"
        else:
            visit_string += "(haveVisited n" + str(i) + ")\n"
            visit_string += "(at n" + str(i) + ")\n"

    obj_string += " - node)\n\n"
    end_string = "\n(= (maxTime) " + str(
        time_resources) + ")\n(= (timeCost) 0)\n(= (fun) 0)\n\n)\n\n(:goal (at n" + str(
        ending_node) + "))\n(:metric maximize (fun))\n\n)"
    content = obj_string + init_string + tt_string + ta_string + exp_string + visit_string + end_string

    file = open(destination_filename, 'w')
    file.write("(define (problem LimitedTour)\n")
    file.write("(:domain Tourism)\n")
    file.write(content)

    file.close()
