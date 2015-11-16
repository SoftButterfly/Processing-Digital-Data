function f = p1_X( n )
    f = impulso(n) + 2*impulso(n-1) - impulso(n-3);
end
