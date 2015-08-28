Fs = 8000;

y1 = load('voice1s.txt');  
y1 = y1 - mean(y1); 
N  = length(y1);
Ty1 = fft(y1,N)/N;

y2 = load('voice1s.txt');  
y2 = y2 - mean(y2); 
N  = length(y2); 
Ty2 = fft(y2,N)/N;

Ty1y2 = Ty1.*Ty2;

y1y2 = ifft(Ty1.*Ty2,N)*N*N;
t = (1:N)/Fs;

plot(t,y1y2)
xlim([0 5])
ylim([-0.3 0.3])
set(gca,'FontSize',12,'FontName','Cambria');
xlabel('Tiempo (s)')
title('Coeficiente de relacion cruzada','FontSize',14)
