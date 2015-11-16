n = -5:1:5;

y1 = conv(p1_X(n), p1_H(n));
y2 = conv(p1_X(n + 2), p1_H(n));
y3 = conv(p1_X(n), p1_H(n + 2));

fprintf('x(n)*h(n)  : '); disp(y1)
fprintf('x(n+2)*h(n): '); disp(y2)
fprintf('x(n)*h(n+2): '); disp(y3)
