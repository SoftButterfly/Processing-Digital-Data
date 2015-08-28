Fs  = 100;
T   = 1/Fs;
L   = 3500;
t   = (0:L-1)*T;
y   = sin(t) + 0.25*sin(10*t);
NP2 = 2^nextpow2(L);
Y   = fft(y,NP2)/L;
f   = (Fs)*linspace(0,1,NP2);
figure(1)
  plot(Fs*t,y)
  xlim([0 Fs*10*pi])
  set(gca,'FontSize',12,'FontName','Cambria');
  title('$$y(t)=\rm sen \it(t)+\rm\frac{1}{4}sen(10\it t)$$',...
        'Interpreter','latex','FontSize',18);
  xlabel('tiempo (\it{ms}\rm)','FontSize',16,'FontName','Cambria');
  ylabel('\it{y}\rm(\it{t}\rm)','FontSize',16,'FontName','Cambria');
  
figure(2)
  plot(f(1:150),2*abs(Y(1:150)))
  xlim([0 3])
  ylim([0 1])
  set(gca,'FontSize',12,'FontName','Cambria');
  title('Espectro de amplitudes de \it{y}\rm(\it{t}\rm)',...
        'FontSize',18,'FontName','Cambria');
  xlabel('Frecuecia \nu (\it{Hz}\rm)','FontSize',16,'FontName','Cambria');
  ylabel('|\it{Y}\rm(\it{\nu}\rm)|','FontSize',16,'FontName','Cambria');
  hold on
  text('String',{'|Y(\nu)| = 0.7304','   \nu    = 0.1465'},...
       'Position',[0.2465 0.7304])
  plot(f(7),2*abs(Y(7)), '*r')
  plot([0  f(7)],[2*abs(Y(7)) 2*abs(Y(7))], ':r')
  plot([f(7)  f(7)],[0 2*abs(Y(7))], ':r')
  plot(f(66),2*abs(Y(66)), '*g')
  text('String',{'|Y(\nu)| = 0.2374','   \nu    = 1.5873'},'Position',[1.6873 0.2374])
  plot([f(66)  f(66)],[0 2*abs(Y(66))],':g',[0  f(66)],[2*abs(Y(66)) 2*abs(Y(66))], ':g')
  %plot( ':g')