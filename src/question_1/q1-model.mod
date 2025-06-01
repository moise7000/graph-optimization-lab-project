# Q1 Model - Telecommunication Network Device Location Problem

# Decision variables
var x{N} binary;  # 1 if device installed at node i, 0 otherwise
var y{N,N} binary;  # 1 if node i is served by device at node j, 0 otherwise

# Objective: minimize total cost of installed devices
minimize TotalCost: sum{i in N} c[i] * x[i];

# Constraints
# Coverage constraint: each node must be served by exactly one device
subject to Coverage{j in N}:
sum{i in N } a[i,j] * x[i] >= 1;

# Service constraint: a node can only be served by an installed device
#subject to Service{i in N, j in N}:
#y[i,j] <= x[j];

# Distance constraint: service only allowed within time threshold
#subject to Distance{i in N, j in N}:
#    y[i,j] * d[i,j] <= T;


