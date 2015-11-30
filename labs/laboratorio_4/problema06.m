T = 0.8;
n = [-2:2];
f = [0:0.125:2];
X = zeros(size(f)) ;
for i = 1: length(f)
    X(i) = sum(T*triangle(n*T/2).*exp(-j*2*pi*f(i)*n*T));
end
