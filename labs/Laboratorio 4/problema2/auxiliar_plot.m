t = -2.5:0.001:3.5;
figure(1)
  f = -triangle(0.5*(t+1))-triangle(0.5*(t))+triangle(0.5*(t-2));
  plot(t,f,'LineWidth',2);
  ylim([-1.5 1.5])
  xlim([-2.5 3.5])
  grid on
  set(gca,...
      'FontSize',14,...
      'FontName','Cambria');
  ylabel('$$f(t)$$','interpreter','latex','FontSize',18)
  xlabel('$$t$$','interpreter','latex','FontSize',18)
  title('$$f(t)$$','interpreter','latex','FontSize',24)