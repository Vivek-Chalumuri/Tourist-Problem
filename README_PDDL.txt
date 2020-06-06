Planner file: LPG-td-1.4/lpg-td

Usage:
 	./LPG-td-1.4/lpg-td -o <DOMAIN_FILE> -f <PROBLEM_FILE> -n <max number of desired solutions>

For our testing we used the following setting:

	./lpg-td -o <DOMAIN_FILE> -f <PROBLEM_FILE> -n 20 -seed 2004 -cputime 300

Optional Arguments:

	-seed <integer>

Specifies the seed for the random number generator used by Walkplan 
(a stochastic local search procedure). By using the same seed number, 
it is possible to repeat identical runs.

	-cputime <number>       

Specifies the maximum CPU-time (in seconds) after which termination of 
the planning process is forced. The default value is 1800 (30 minutes).

	-out <string> 

This option can be used to change the default name of the files containing 
the plans computed by LPG-td. 
For example, "lpg -o op-file-name -f p-file-name -n 2 -out myplan" produces 
two files (assuming that the planner finds two solutions) named 
"myplan_1.SOL" and "myplan_2.SOL".


For detailed documentation please refer:  http://lpg.ing.unibs.it/

