clear all
close all
clc

L = 1;

X = -5:0.01:5;
Y = ones(size(X)).*(-0.5*L*ones(size(X)) <= X & X <= 0.5*L*ones(size(X)));

plot(X,Y)
ylim([-0.5, 1.5])
xlabel('X');
ylabel('Y');
title(sprintf('Funcion compuerta unitaria\n(Usando comandos "zeros" y "ones")'));
grid on
