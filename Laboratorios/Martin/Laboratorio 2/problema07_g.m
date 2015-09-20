clear all
close all
clc

t = -10:0.0001:10;
x = hfun(t).*(escalon(t+1)-escalon(t-1));

plot(t,x)
ylim([min(x)-0.5,max(x) + 0.5])
title('$$h(t)(u(t+1)-u(t-1))$$','interpreter','latex')
grid on
