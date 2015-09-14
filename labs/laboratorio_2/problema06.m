Fs = 20;
f  = 1;

t  = linspace(0,5,5*Fs);
X  = zeros(3,length(t));

X(1,:) = exp( -1*t).*cos(2*pi*f.*t);
X(2,:) = exp( -5*t).*cos(2*pi*f.*t);
X(3,:) = exp(-20*t).*cos(2*pi*f.*t);

hold on
plot(t,X(1,:),'r','DisplayName','a =  1')
plot(t,X(2,:),'g','DisplayName','a =  5')
plot(t,X(3,:),'b','DisplayName','a = 20')
xlabel('Tiempo (s)')
ylabel('Intensidad')
title('X(t)=e^{-at} cos(2\pi t)')
legend('show')
grid on
