t = -1:0.0001:1;
a = 1;
figure(1)
  f = gate(t);
  plot(t,f,'LineWidth',2);
  ylim([-0.5 1.5])
  grid on
  set(gca,...
      'xTickLabel',{'','-a/2','0','a/2',''},...
      'YTickLabel',{'','0','','1/a',''},...
      'FontSize',14,...
      'FontName','Cambria');
  ylabel('$$f_1(t)$$','interpreter','latex','FontSize',18)
  xlabel('$$t$$','interpreter','latex','FontSize',18)
  title('$$f_1(t)$$','interpreter','latex','FontSize',24)

t = -4:1:4;
figure(2)
  f = 1+impulso(mod(t,2));
  stem(t,f,'LineWidth',2);
  ylim([-0.5 2.5])
  xlim([-4.5 4.5])
  grid on
  set(gca,...
      'FontSize',14,...
      'FontName','Cambria');
  ylabel('$$f_2(n)$$','interpreter','latex','FontSize',18)
  xlabel('$$n$$','interpreter','latex','FontSize',18)
  title('$$f_2(n)$$','interpreter','latex','FontSize',24)
