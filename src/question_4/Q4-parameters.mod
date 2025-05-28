# Nodes
param nb_n; #number of nodes
set N := 1..nb_n; # 

# Links or edges
set A within N cross N;
param u; #channel capacity


param c{N} default 1;
param g{A} default 0;
param t{A};# default 1;
param cap{N};# default 100000;
param T;
param d{N} default 0;