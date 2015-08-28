Fs = 8000; % frecuencia de muestreo
Nbit = 16; % Numero de bits
Nchan = 1; % numero de canales
tg = 5;    % Tiempo de grabacion
r = audiorecorder(Fs, Nbit, Nchan); 
record(r);  
pause(tg); 
stop(r); 
y = getaudiodata(r);  
y = y - mean(y); 
N = length(y); 
[A,I] = max(abs(y)); 

t = (1:N)/Fs; 
subplot(2,1,1), plot(t,y), grid, zoom xon 
title('Señal en el dominio del tiempo') 
xlabel('Tiempo (seg)')
Y = fft(y,N); 
Pyy = Y.*conj(Y) / N; 
f = (Fs)*(0:N/2-1)/ N; 
subplot(2,1,2), plot(f,Pyy(1:N/2)), grid, 
zoom xon 
title('Espectro de frecuencias de la señal') 
xlabel('Frecuencia (Hz)')