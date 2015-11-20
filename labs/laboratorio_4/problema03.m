t = -4:1:4;
f = 1+impulso(mod(t,2));
F = fft(f);
figure(1)
  stem(t,abs(F),'LineWidth',2);
  ylim([-0.5 14.5])
  xlim([-4.5 4.5])
  grid on
  set(gca,'FontSize',14,'FontName','Cambria');
  ylabel('$$\it |F_{[f_2]}(\omega)|$$','interpreter','latex','FontSize',18)
  xlabel('$$\omega$$','interpreter','latex','FontSize',18)
  title('$$\it |F_{[f_2]}(\omega)|$$','interpreter','latex','FontSize',24)