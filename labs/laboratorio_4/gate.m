function f = gate(t)
    f = heaviside(t+1/2)-heaviside(t-1/2);
end
