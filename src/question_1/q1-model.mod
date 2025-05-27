set NODES;                          # Set of nodes in the network
set EDGES within NODES cross NODES; # Set of edges (i,j)

# Parameters
param cost{NODES} >= 0;            
param delay{EDGES} >= 0;              
param T >= 0;                       
param distance{NODES, NODES} >= 0;  

# Decision Variables
var x{NODES} binary;                # 1 if device installed at node i, 0 otherwise
var y{NODES, NODES} binary;         # 1 if node i served by device at node j, 0 otherwise


minimize Total_Cost: sum{i in NODES} cost[i] * x[i];

# Constraints


subject to Coverage{i in NODES}:
    sum{j in NODES} y[i,j] = 1;

  
subject to Service{i in NODES, j in NODES}:
    y[i,j] <= x[j];


subject to Distance{i in NODES, j in NODES}:
    y[i,j] * distance[i,j] <= T;

