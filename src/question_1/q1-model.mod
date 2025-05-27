# Q1 Model - Telecommunication Network Device Location Problem

# Sets
param n;
set N := 1..n;  # Set of nodes
set E within {N,N};  # Set of edges

# Parameters
param c{N};  # Cost of installing device at node i
param t{(i,j) in E};  # Propagation delay on edge (i,j)
param T;  # Maximum allowed propagation time

# Computed parameter: shortest path distances
param d{i in N, j in N} default 999999;  # Distance matrix

# Decision variables
var x{N} binary;  # 1 if device installed at node i, 0 otherwise
var y{N,N} binary;  # 1 if node i is served by device at node j, 0 otherwise

# Objective: minimize total cost of installed devices
minimize TotalCost: sum{i in N} c[i] * x[i];

# Constraints
# Coverage constraint: each node must be served by exactly one device
subject to Coverage{i in N}:
    sum{j in N} y[i,j] = 1;

# Service constraint: a node can only be served by an installed device
subject to Service{i in N, j in N}:
    y[i,j] <= x[j];

# Distance constraint: service only allowed within time threshold
subject to Distance{i in N, j in N}:
    y[i,j] * d[i,j] <= T;

# Self-service constraint: if a device is installed at node i, it can serve itself with distance 0
subject to SelfService{i in N}:
    d[i,i] = 0;