clear all
close all
clc

L = 1;

X = -5:0.01:5;
Y = escalon(X,-0.5*L).*escalon(-X,-0.5*L);

plot(X,Y)
ylim([-0.5, 1.5])
xlabel('X');
ylabel('Y');
title(sprintf('Funcion compuerta unitaria\n(Usando la funcion "escalon" del problema 1)'))
grid on
