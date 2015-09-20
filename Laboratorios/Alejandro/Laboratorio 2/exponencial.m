s=2;
while (s==2)
clear all
clc
    fprintf('Se tienen los siguientes valores para la constante a : \n-> a=1 \n-> a=5 \n-> a=20 \n-> a>50  (amortiguamiento critico)'); 
    a=input('\nIngrese el valor de la constante a : ');
    t=0:0.05:5;
    x=cos(2.*pi*t).*exp(-a*t);
    plot (t,x), grid on, xlabel 'tiempo(s)', ylabel 'x(t)'
s=input('\n1)Salir \n2)Graficar otra funcion \n\nQue desea hacer?: ');
end
clc