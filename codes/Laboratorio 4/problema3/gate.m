function f = gate(t)
f = heaviside(t + 0.5) - heaviside(t - 0.5);
    