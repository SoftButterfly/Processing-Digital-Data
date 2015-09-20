clear all
close all
clc

t = -10:0.0001:10;
x = 0.5.*hfun(t).*escalon(t) + hfun(-t).*escalon(t);
plot(t,x)
ylim([min(x)-0.5,max(x) + 0.5])
title('$${1\over 2}h(t)u(t) + h(-t)u(t)$$','interpreter','latex')
grid on
