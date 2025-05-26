var x{N, N} binary;
var y{N, N, N} binary;
var z{N} integer >= 0;
var w{N, N} integer >= 0;

minimize TotalCost:
	sum {i in N} (c[i] * z[i]) + sum {(i, j) in A} (g[i, j] * w[i, j]);

s.t. Assignment {i in N}:
	sum {j in N} x[i, j] = 1;
s.t. NodeCapacity {j in N}:
	sum {i in N} (d[i] * x[i, j]) <= cap[j] * z[j];
s.t. ArcCapacity {(i, j) in A}:
	sum {k in N} (d[k] * y[i, j, k]) <= u * w[i, j];
s.t. Latency {k in N}:
	sum {(i, j) in A} (t[i, j] * y[i, j, k]) <= T;
s.t. Flow {i in N, a in N, b in N}:
    sum {j in N: (i, j) in A} y[i, j, a] - sum {j in N: (j, i) in A} y[j, i, b] =
    if a = b then
        0
    else if i = a then
        x[a, b]
    else if i = b then
        -x[b, a]
    else
        0;
