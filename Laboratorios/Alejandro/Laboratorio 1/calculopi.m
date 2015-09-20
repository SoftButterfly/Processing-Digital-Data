function calculopi
clear all
clc
l=input('Ingresa el lado del cuadrado :');
a=input('Ingresa en numero de dardos: ');
n=0;
for k=1:1:a
    x=rand*l;
    y=rand*l;
    r= sqrt( (x-(l/2))^2 + (y-(l/2))^2 );
    if r<(l/2)
        n=n+1;
    end
end
nuevopi=4*n/a;
fprintf('El valor obtenido por el metodo de montecarlo para %2.5i intentos es: \npi=%4.6f \n',a,nuevopi)
end