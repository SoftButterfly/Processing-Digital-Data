clear all
close all
t = -10:0.0001:10;

figure(1)
x = hfun(t);
plot(t,x)
ylim([min(x)-0.5,max(x) + 0.5])
grid on
title('$$h(t)$$','interpreter','latex')


figure(2)
x = hfun(t+1);
plot(t,x)
ylim([min(x)-0.5,max(x) + 0.5])
grid on
title('$$h(t+1)$$','interpreter','latex')

figure(3)
x = hfun(0.5*t - 2);
plot(t,x)
ylim([min(x)-0.5,max(x) + 0.5])
grid on
title('$$h({1 \over 2}t-2)$$','interpreter','latex')

figure(4)
x = hfun(1 - 2*t);
plot(t,x)
ylim([min(x)-0.5,max(x) + 0.5])
grid on
title('$$h(1-2t)$$','interpreter','latex')

figure(5)
x = 4*hfun(0.25*t);
plot(t,x)
ylim([min(x)-0.5,max(x) + 0.5])
grid on
title('$$4h({1\over 4}t)$$','interpreter','latex')

figure(6)
x = 0.5.*hfun(t).*escalon(t) + hfun(-t).*escalon(t);
plot(t,x)
ylim([min(x)-0.5,max(x) + 0.5])
grid on
title('$${1\over 2}h(t)u(t) + h(-t)u(t)$$','interpreter','latex')

figure(7)
x = hfun(0.5*t).*impulso(t+1);
plot(t,x)
ylim([min(x)-0.5,max(x) + 0.5])
grid on
title('$$h({1\over 2}t)\delta(t)$$','interpreter','latex')

figure(8)
x = hfun(t).*(escalon(t+1)-escalon(t-1));
plot(t,x)
ylim([min(x)-0.5,max(x) + 0.5])
grid on
title('$$h(t)(u(t+1)-u(t-1))$$','interpreter','latex')