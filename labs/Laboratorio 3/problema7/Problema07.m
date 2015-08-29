t = 0:1:20;
y = funY(t);
stem(t,y,'*-r')
grid on
ylim([min(y)-0.1 max(y)+0.1])
title('$$\rm y(n)$$','interpreter','latex','FontSize',20)