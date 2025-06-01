var x{N, N} >= 0, <= 1;
var y{N} >= 0;
var z{A} >= 0;
var w{N, A} >= 0, <= 1;

minimize TotalCost:
	sum{i in N} c[i] * y[i] + sum{(i, j) in A} g[i, j] * z[i, j];

s.t. Assignment{k in N : d[k] > 0}:
	sum{i in N : a[k, i] = 1} x[k, i] = 1;

s.t. ProcessingCapacity{i in N}:
	sum{k in N : a[k, i] = 1} d[k] * x[k, i] <= cap[i] * y[i];

s.t. ChannelCapacity{(i, j) in A}:
	sum{k in N : a[k, i] = 1 and a[k, j] = 1} d[k] * w[k, i, j] <= u * z[i, j];

s.t. DelayConstraint{k in N : d[k] > 0}:
	sum{(i, j) in A : a[k, i] = 1 and a[k, j] = 1} t[i, j] * w[k, i, j] <= T;

s.t. FlowConservation{k in N, i in N : a[k, i] = 1}:
	sum{(i, j) in A : a[k, j] = 1} w[k, i, j] - sum{(j, i) in A : a[k, j] = 1} w[k, j, i] =
		if i == k then (1 - x[k, k]) else (-x[k, i]);

s.t. Cover{cov in Covers}:
	sum{k in ExtCovers[cov]} x[k, CoverTarget[cov]] <= max(0, CoverCard[cov] - 1 + B * (y[CoverTarget[cov]] - 1));
