Fs  = 8000;
T   = 1/Fs;
Signal = fopen('datos.txt','r');
y = fscanf(Signal,'%f');
fclose(Signal);

L   = length(y);
t   = (0:L-1)*T;

NP2 = 2^nextpow2(L);
Y   = fft(y,NP2)/L;
f   = (Fs/2)*linspace(0,1,NP2/2+1);
figure(1)
  plot(t,y)
  set(gca,'FontSize',12,'FontName','Cambria');
  %xlim([0 max(t)])
  title('{\itSeñal de audio} ({\rmdatos.txt})','FontSize',18);
  xlabel('tiempo (\it{ms}\rm)','FontSize',16,'FontName','Cambria');
  ylabel('Amplitud','FontSize',16,'FontName','Cambria');
  
figure(2)
  plot(f,2*abs(Y(1:NP2/2+1)))
  set(gca,'FontSize',12,'FontName','Cambria');
  title('Espectro de frecuencias','FontSize',18,'FontName','Cambria');
  xlabel('Frecuencia \nu (\it{Hz}\rm)','FontSize',16,'FontName','Cambria');
  ylabel('Amplitud','FontSize',16,'FontName','Cambria');