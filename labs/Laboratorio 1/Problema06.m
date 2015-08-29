clear all 
clc

fprintf('metodo de montecarlo para calcular pi\n');
N = input ('Ingrese el número de dardos : ');

n = 0;
x = 0; 
y = 0;
count = 1;

rng(0,'twister');

while count < N;
    x = rand;
    y = rand;
    
    if sqrt (x^2 + y^2) <= 1 
        n = n + 1;
    end
    
    count = count + 1;
end

fprintf('Dardos dentro del Círculo   : %d\n', n);
fprintf('Valor aproximado de Pi      : %.5f\n', 4*n/N);