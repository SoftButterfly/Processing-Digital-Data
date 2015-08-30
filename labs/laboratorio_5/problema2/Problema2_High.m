%% asdfas
Fs = 8000; % frecuencia de muestreo
Nbit = 16; % Numero de bits
Nchan = 1; % numero de canales
tg = 5;    % Tiempo de grabacion
x = load('voice1s.txt');  
x = x - mean(x); 
N = length(x); 
[A,I] = max(abs(x)); 
t = (1:N)/Fs; 

NFFT = 2^nextpow2(N);
y    = fft(x,NFFT)/N;
y2   = 2*abs(y);
f    = Fs/2*linspace(0,1,NFFT/2+1);


Fc = 100;                 % [Hz] Frecuencia de Corte
Bt = 20;                      % [Hz] Ancho de la banda de transicion
Rs = 10;                          % [dB] Atenuacion en la banda de rechazo
Rp = 2;                           % [dB] Atenuacion en la banda de paso
Wp = 2*Fc/Fs;                     % [rad/s] Frecuencia angular de la Fc
Ws = 2*(Fc+Bt)/Fs;                % [rad/s] Frecuencia angular de la Bt
[n1,wn1]=buttord(Wp,Ws,Rp,Rs);   % Orden del filtro y fecuencia angular de corte (función buttord).
[B1,A1]=butter(n1,wn1,'High');    % Coeficientes del filtro (función butter).
[h1,w1]=freqz(B1,A1);                  % Respuesta en frecuencia (función freqz).
xf=filtfilt(B1,A1,x);             % Filñtrado de la señal

figure(1)
subplot(2,1,1)
plot(w1(1:20),abs(h1(1:20)))
set(gca,'FontSize',12,'FontName','Cambria');
xlabel('Frecuencia Angular (rad/s)')
title('Diagram de Bode','FontSize',14)
grid on

subplot(2,1,2)
plot(t,xf,'LineWidth',2)
set(gca,'FontSize',12,'FontName','Cambria');
xlabel('Tiempo (s)')
title('Señal filtrada','FontSize',14)
grid on


x = load('voice2s.txt');  
x = x - mean(x); 
N = length(x); 
[A,I] = max(abs(x)); 
t = (1:N)/Fs; 

NFFT = 2^nextpow2(N);
y    = fft(x,NFFT)/N;
y2   = 2*abs(y);
f    = Fs/2*linspace(0,1,NFFT/2+1);


Fc = 100;                 % [Hz] Frecuencia de Corte
Bt = 20;                      % [Hz] Ancho de la banda de transicion
Rs = 10;                          % [dB] Atenuacion en la banda de rechazo
Rp = 2;                           % [dB] Atenuacion en la banda de paso
Wp = 2*Fc/Fs;                     % [rad/s] Frecuencia angular de la Fc
Ws = 2*(Fc+Bt)/Fs;                % [rad/s] Frecuencia angular de la Bt
[n1,wn1]=buttord(Wp,Ws,Rp,Rs);   % Orden del filtro y fecuencia angular de corte (función buttord).
[B1,A1]=butter(n1,wn1,'High');    % Coeficientes del filtro (función butter).
[h1,w1]=freqz(B1,A1);                  % Respuesta en frecuencia (función freqz).
xf=filtfilt(B1,A1,x);             % Filñtrado de la señal

figure(2)
subplot(2,1,1)
plot(w1(1:20),abs(h1(1:20)))
set(gca,'FontSize',12,'FontName','Cambria');
xlabel('Frecuencia Angular (rad/s)')
title('Diagram de Bode','FontSize',14)
grid on

subplot(2,1,2)
plot(t,xf,'LineWidth',2)
set(gca,'FontSize',12,'FontName','Cambria');
xlabel('Tiempo (s)')
title('Señal filtrada','FontSize',14)
grid on