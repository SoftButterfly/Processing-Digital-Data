function f = triangle(t)
f = heaviside(t+0.5).*heaviside(-t+0.5).*(1-2*abs(t));