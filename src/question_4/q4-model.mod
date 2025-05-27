var x{N, N} binary;
var y{N} integer >= 0;
var z{A} integer >= 0;
var w{N, A} binary;

minimize TotalCost:
	sum{i in N} c[i] * y[i] + sum{(i, j) in A} g[i, j] * z[i, j];

s.t. Assignment{k in N}:
	sum{i in N} x[k, i] = 1;

s.t. ProcessingCapacity{i in N}:
	sum{k in N} d[k] * x[k, i] <= cap[i] * y[i];

s.t. ChannelCapacity{(i, j) in A}:
	sum{k in N} d[k] * w[k, i, j] <= u * z[i, j];

s.t. DelayConstraint{k in N}:
	sum{(i, j) in A} t[i, j] * w[k, i, j] <= T;

s.t. FlowConservation{k in N, i in N}:
	sum{(i, j) in A} w[k, i, j] - sum{(j, i) in A} w[k, j, i] = 
		if i == k then (1 - x[k, k]) else (-x[k, i]);
