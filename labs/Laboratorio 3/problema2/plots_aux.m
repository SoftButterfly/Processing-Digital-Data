figure(1)
  t = -0.5:0.001:2.5;
  subplot(1,2,1)
    plot(t,funX1(t));
    grid on
    ylim([min(funX1(t))-0.5 max(funX1(t))+0.5])
    title('$$x_{1}(t)$$','FontSize',20,'interpreter','latex')
  subplot(1,2,2)
    plot(t,funY1(t));
    grid on
    ylim([min(funY1(t))-0.5 max(funY1(t))+0.5])
    title('$$y_{1}(t)$$','FontSize',20,'interpreter','latex')

figure(2)
  t = -0.5:0.001:3.5;
  subplot(1,2,1)
    plot(t,funX2(t));
    grid on
    ylim([min(funX2(t))-0.5 max(funX2(t))+0.5])
    title('$$x_{2}(t)$$','FontSize',20,'interpreter','latex')
  t = -0.5:0.001:4.5;
  subplot(1,2,2)
    plot(t,funX3(t));
    grid on
    ylim([min(funX3(t))-0.5 max(funX3(t))+0.5])
    title('$$x_{3}(t)$$','FontSize',20,'interpreter','latex')

