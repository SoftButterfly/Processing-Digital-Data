n = -20:1:20;
X = p6_X(n);
H = p6_H(n);
Y = conv(X,H);
stem(-40:1:40,Y)
