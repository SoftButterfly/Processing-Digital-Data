figure(1)
subplot(2,2,1)
  t = -15:1:15;
  x = (0.5.^t).*escalon(t-4);
  h = (4.^t).*escalon(2-t);
  y = conv(x,h,'same');
  stem(t,y)
  grid on
  ylim( [min(y)-0.5 max(y)+0.5] )
  title('$$x_{1}(t)*h_{1}(t)$$','FontSize',20,'interpreter','latex')
subplot(2,2,2)
  t = -5:1:5;
  x = escalon(-t) - escalon(-t-2);
  h = escalon(t-1) - escalon(t-4);
  y = conv(x,h,'same');
  stem(t,y)
  grid on 
  ylim( [min(y)-0.5 max(y)+0.5] )
  title('$$x_{2}(t)*h_{2}(t)$$','FontSize',20,'interpreter','latex')
subplot(2,2,3)
  t = -10:1:10;
  x = escalon(t);
  h = (0.5.^(-t)).*escalon(-t);
  y = conv(x,h,'same');
  stem(t,y)
  grid on
  ylim( [min(y)-0.5 max(y)+0.5] )
  title('$$x_{3}(t)*h_{3}(t)$$','FontSize',20,'interpreter','latex')
subplot(2,2,4)
  t = -10:0.01:10;
  a = 1;
  x = exp(-a*t).*escalon(t);
  h = exp(-a*t).*escalon(t);
  y = conv(x,h,'same');
  plot(t,y)
  grid on
  ylim( [min(y)-0.5 max(y)+0.5] )
  title('$$x_{4}(t)*h_{4}(t)$$','FontSize',20,'interpreter','latex')
figure(2)
subplot(3,1,1)
  t = -10:1:10;
  x = escalon(t);
  h = (0.5.^(-t)).*escalon(-t);
  y = conv(x,h,'same');
  plot(t,y,'.-')
  grid on
  ylim( [min(y)-0.5 max(y)+0.5] )
  title('$$x_{3}(t)*h_{3}(t)$$','FontSize',20,'interpreter','latex')
subplot(3,1,2)
  t = -100:1:100;
  x = escalon(t);
  h = (0.5.^(-t)).*escalon(-t);
  y = conv(x,h,'same');
  plot(t,y,'.-')
  grid on
  ylim( [min(y)-0.5 max(y)+0.5] )
  title('$$x_{3}(t)*h_{3}(t)$$','FontSize',20,'interpreter','latex')
subplot(3,1,3)
  t = -1000:1:1000;
  x = escalon(t);
  h = (0.5.^(-t)).*escalon(-t);
  y = conv(x,h,'same');
  plot(t,y,'.-')
  grid on
  ylim( [min(y)-0.5 max(y)+0.5] )
  title('$$x_{3}(t)*h_{3}(t)$$','FontSize',20,'interpreter','latex')