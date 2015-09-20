clear all
close all
clc

t = -10:0.0001:10;
x = 4*hfun(0.25*t);

plot(t,x)
ylim([min(x)-0.5,max(x) + 0.5])
title('$$4h({1\over 4}t)$$','interpreter','latex')
grid on
