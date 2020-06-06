# Author: Francesco Nuzzo
from os import listdir
import numpy as np
import operator

# This is the script we used for aggregating the lp solutions all together.
# The result is a file with x rows, where x is the number of tests.
# Each row is in the format:
# n;seed;total_reward

path_with_solutions = '../lp_solutions/'

files = listdir(path=path_with_solutions)

all_solutions_filename = '../all_lp_solutions.sol'

data_solutions = np.empty((len(files), 3), dtype=int)

i = 0
for filename in files:
    attributes = filename.split("_")

    n = int(attributes[2])
    seed = int(attributes[10].split('.')[0])
    reward = 0
    with open(path_with_solutions + filename) as file_reader:
        count_line = 0
        for line in file_reader:
            count_line += 1
            if line == "None":
                break
            if count_line == 2:
                info = line.split(' ')
                reward = int(info[1])
                break

    data_solutions[i, 0] = n
    data_solutions[i, 1] = seed
    data_solutions[i, 2] = reward

    i += 1

# data_solutions = data_solutions[data_solutions[:, 0].argsort(kind='mergesort')]
data_solutions = np.array(sorted(data_solutions, key=operator.itemgetter(0, 1)))
str_all_solutions = ""

for entry in data_solutions:
    str_all_solutions += '{0};{1};{2}\n'.format(entry[0], entry[1], entry[2])

sol_write = open(all_solutions_filename, 'w')
sol_write.write(str_all_solutions)
sol_write.close()
