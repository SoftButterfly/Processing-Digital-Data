clear all
close all
clc

t = -10:0.0001:10;
x = hfun(0.5*t).*impulso(t+1);

plot(t,x)
ylim([min(x)-0.5,max(x) + 0.5])
title('$$h({1\over 2}t)\delta(t)$$','interpreter','latex')
grid on
