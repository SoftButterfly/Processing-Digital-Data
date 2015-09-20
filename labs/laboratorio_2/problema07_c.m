clear all
close all
clc

t = -10:0.0001:10;
x = hfun(1 - 2*t);

plot(t,x)
ylim([min(x)-0.5,max(x) + 0.5])
title('$$h(1-2t)$$','interpreter','latex')
grid on
