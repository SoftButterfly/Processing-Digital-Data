s=2;
while (s==2)
clear all
clc
fprintf('Funcion Compuerta Unitaria : \n\n1) h(t+1) \n2) h(t/2 -2) \n3) h(1-2t) \n4) 4h(t/4) \n5) 0.5h(t)*u(t)+h(-t)*u(t) \n6) h(t/2)*d(t+1) \n7) h(t)*[u(t+1)-u(t-1)]');
f=input('\n\nSeleccione la funcion que desee graficar : ');
if (f~=1 & f~=2 & f~=3 & f~=4 & f~=5 & f~=6 & f~=7 )
    fprintf('No ha seleccionado una de los metodos mencionados\n');
else
    t=-10:0.01:10;
    switch (f)
        case 1
            y=h(t+1);
            plot (t,y), grid on, xlabel 't', axis ([-8 8 -3 4]),  ylabel 'h(t+1)';
        case 2
            y=h(t/2. -2);
            plot (t,y), grid on, xlabel 't', axis ([-8 8 -3 4]), ylabel 'h(t/2 -2)';
        case 3
            y=h(1-2.*t);
            plot (t,y), grid on, xlabel 't',axis ([-8 8 -3 4]),ylabel 'h(1-2t)';
        case 4
            y=4.*h(t/4.);
            plot (t,y), grid on , xlabel 't',axis ([-10 10 -4 5]) ,ylabel '4h(t/4)';
        case 5
            %%y=h(t/2. -2);
            plot (t,y), grid on , xlabel 't',  axis ([-8 8 -3 4]), ylabel '0.5h(t)*u(t)+h(-t)*u(t)';
        case 6
            y=h(t/2. -2);
            plot (t,y), grid on , xlabel 't', axis ([-8 8 -3 4]), ylabel 'h(t/2 -2)';
        case 7
            y=h(t/2. -2);
            plot (t,y), grid on , xlabel 't', axis ([-8 8 -3 4]),ylabel 'h(t/2 -2)';
     end
end
s=input('\n1)Salir \n2)Graficar otra funcion \n\nQue desea hacer?: ');
end
clc