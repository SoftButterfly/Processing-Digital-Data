w = -10:0.001:10;
figure(1)
  f = sinc(0.5*w) + sinc(w);
  plot(w,f,'LineWidth',2);
  grid on;
  ylim([-0.5 max(f)+0.5]);
  set(gca,'FontSize',16,'FontName','Cambria');
  ylabel('$$F_{[f_1]}(\omega)$$','interpreter','latex','FontSize',25);
  xlabel('$$\omega$$','interpreter','latex','FontSize',25);
  title('$$F_{[f_1]}(\omega)$$','interpreter','latex','FontSize',30);

figure(2)
  f = 2*sinc(0.5*w).*(2*cos(w)-3i*sin(w));
  subplot(2,2,1)
    plot(w,real(f),'r','LineWidth',2);
    grid on;
    ylim([-0.5 4.5]);
    set(gca,'FontSize',11,'FontName','Cambria');
    ylabel('$$\bf Re\it[F_{[f_2]}(\omega)]$$','interpreter','latex',...
           'FontSize',20);
    xlabel('$$\omega$$','interpreter','latex','FontSize',20);
    title('$$\bf Re\it[F_{[f_2]}(\omega)]$$','interpreter','latex',...
          'FontSize',25);
  subplot(2,2,3)
    plot(w,imag(f),'g','LineWidth',2);
    grid on;
    ylim([-4 4]);
    set(gca,'FontSize',11,'FontName','Cambria');
    ylabel('$$\bf Im\it[F_{[f_2]}(\omega)]$$','interpreter','latex',...
           'FontSize',20);
    xlabel('$$\omega$$','interpreter','latex','FontSize',20);
    title('$$\bf Im\it[F_{[f_2]}(\omega)]$$','interpreter','latex',...
          'FontSize',25);
  subplot(1,2,2)
    plot(real(f),imag(f),'b','LineWidth',1);
    grid on;
    xlim([-0.5 4.5]);
    ylim([-4.0 4.0]);
    set(gca,'FontSize',11,'FontName','Cambria');
    ylabel('$$\bf Im\it[F_{[f_2]}(\omega)]$$','interpreter','latex',...
           'FontSize',20);
    xlabel('$$\bf Re\it[F_{[f_2]}(\omega)]$$','interpreter','latex',...
           'FontSize',20);
    title('Parametric Plot of $$\it F_{[f_2]}(\omega)$$',...
          'interpreter','latex','FontSize',25);
figure(3)
  f = 2*exp(-1i.*w).*(cos(w)-cos(2*w)).*(w.^(-2));
  subplot(2,2,1)
    plot(w,real(f),'r','LineWidth',2);
    grid on;
    ylim([-0.5 3.5]);
    set(gca,'FontSize',11,'FontName','Cambria');
    ylabel('$$\bf Re\it[F_{[f_3]}(\omega)]$$','interpreter','latex',...
           'FontSize',20);
    xlabel('$$\omega$$','interpreter','latex',...
           'FontSize',20);
    title('$$\bf Re\it[F_{[f_3]}(\omega)]$$','interpreter','latex',...
          'FontSize',25);
  subplot(2,2,3)
    plot(w,imag(f),'g','LineWidth',2);
    grid on;
    ylim([-2 2]);
    set(gca,'FontSize',11,'FontName','Cambria');
    ylabel('$$\bf Im\it[F_{[f_3]}(\omega)]$$','interpreter','latex',...
           'FontSize',20);
    xlabel('$$\omega$$','interpreter','latex','FontSize',20);
    title('$$\bf Im\it[F_{[f_3]}(\omega)]$$','interpreter','latex',...
          'FontSize',25);
  subplot(1,2,2)
    plot(real(f),imag(f),'b','LineWidth',1);
    grid on;
    xlim([-0.5 3.5]);
    ylim([-2.0 2.0]);
    set(gca,'FontSize',11,'FontName','Cambria');
    ylabel('$$\bf Im\it[F_{[f_3]}(\omega)]$$','interpreter','latex',...
           'FontSize',20);
    xlabel('$$\bf Re\it[F_{[f_3]}(\omega)]$$','interpreter','latex',...
           'FontSize',20);
    title('Parametric Plot of $$\it F_{[f_3]}(\omega)$$',...
          'interpreter','latex','FontSize',25);
figure(4)
  f = -8i.*exp(-1i.*w).*((sin(0.5*w)).^2).*sin(w).*(w.^(-2));
  subplot(2,2,1)
    plot(w,real(f),'r','LineWidth',2);
    grid on;
    ylim([-1.8 0.2]);
    set(gca,'FontSize',11,'FontName','Cambria');
    ylabel('$$\bf Re\it[F_{[f_4]}(\omega)]$$','interpreter','latex',...
           'FontSize',20);
    xlabel('$$\omega$$','interpreter','latex','FontSize',20);
    title('$$\bf Re\it[F_{[f_4]}(\omega)]$$','interpreter','latex',...
          'FontSize',25);
  subplot(2,2,3)
    plot(w,imag(f),'g','LineWidth',2);
    grid on;
    ylim([-1 1]);
    set(gca,'FontSize',11,'FontName','Cambria');
    ylabel('$$\bf Im\it[F_{[f_4]}(\omega)]$$','interpreter','latex',...
           'FontSize',20);
    xlabel('$$\omega$$','interpreter','latex','FontSize',20);
    title('$$\bf Im\it[F_{[f_4]}(\omega)]$$','interpreter','latex',...
          'FontSize',25);
  subplot(1,2,2)
    plot(real(f),imag(f),'b','LineWidth',1);
    grid on;
    xlim([-1.8 0.2]);
    ylim([-1 1]);
    set(gca,...
        'FontSize',11,'FontName','Cambria');
    ylabel('$$\bf Im\it[F_{[f_4]}(\omega)]$$','interpreter','latex',...
           'FontSize',20);
    xlabel('$$\bf Re\it[F_{[f_4]}(\omega)]$$','interpreter','latex',...
           'FontSize',20);
    title('Parametric Plot of $$\it F_{[f_4]}(\omega)$$',...
          'interpreter','latex','FontSize',25)
figure(5)
  f = 2*sinc(0.5*w).*(2*cos(w)-3i*sin(w));
  subplot(1,3,1)
    plot(w,abs(f),'r','LineWidth',2);
    grid on;
    ylim([-0.5 4.5]);
    set(gca,...
        'FontSize',11,...
        'FontName','Cambria');
    ylabel('$$\it|F_{[f_2]}(\omega)|$$',...
           'interpreter','latex',...
           'FontSize',20);
    xlabel('$$\omega$$','interpreter','latex',...
           'FontSize',20);
    title('$$\it|F_{[f_2]}(\omega)|$$','interpreter','latex',...
          'FontSize',25);
  
  f = 2*exp(-1i.*w).*(cos(w)-cos(2*w)).*(w.^(-2));
  subplot(1,3,2)
    plot(w,abs(f),'g','LineWidth',2);
    grid on;
    ylim([-0.5 3.5]);
    set(gca,...
        'FontSize',11,...
        'FontName','Cambria');
    ylabel('$$\it|F_{[f_3]}(\omega)|$$',...
           'interpreter','latex',...
           'FontSize',20);
    xlabel('$$\omega$$','interpreter','latex',...
           'FontSize',20);
    title('$$\it|F_{[f_3]}(\omega)|$$','interpreter','latex',...
          'FontSize',25);

  f = -8i.*exp(-1i.*w).*((sin(0.5*w)).^2).*sin(w).*(w.^(-2));
  subplot(1,3,3)
    plot(w,abs(f),'b','LineWidth',2);
    grid on;
    ylim([-0.5 2]);
    set(gca,...
        'FontSize',11,...
        'FontName','Cambria');
    ylabel('$$\it|F_{[f_4]}(\omega)|$$','interpreter','latex',...
           'FontSize',20);
    xlabel('$$\omega$$','interpreter','latex',...
           'FontSize',20);
    title('$$\it|F_{[f_4]}(\omega)|$$','interpreter','latex',...
          'FontSize',25);
