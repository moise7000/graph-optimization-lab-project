# Nodes
param n; #number of nodes
set N := 1..n; # 

# node costs
param c{N} default 1;

# Links or edges
set E within N cross N;
param t{E};

param T;
