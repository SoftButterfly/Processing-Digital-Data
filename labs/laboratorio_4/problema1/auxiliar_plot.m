t = -2:0.001:4;
figure(1)
  f = triangle(0.5*t)+triangle(0.5*(t-1))+triangle(0.5*(t-2));
  plot(t,f,'LineWidth',2);
  ylim([-0.5 1.5]);
  set(gca,...
      'FontSize',14,...
      'FontName','Cambria');
  grid on
  ylabel('$$f_3(t)$$','interpreter','latex','FontSize',16)
  xlabel('$$t$$','interpreter','latex','FontSize',16)
  title('$$f_3(t)$$','interpreter','latex','FontSize',20)

figure(2)
  f = -triangle(0.5*t)+triangle(0.5*(t-2));
  plot(t,f,'LineWidth',2);
  ylim([-1.5 1.5])
  set(gca,...
      'FontSize',14,...
      'FontName','Cambria');
  grid on
  ylabel('$$f_4(t)$$','interpreter','latex','FontSize',16)
  xlabel('$$t$$','interpreter','latex','FontSize',16)
  title('$$f_4(t)$$','interpreter','latex','FontSize',20)