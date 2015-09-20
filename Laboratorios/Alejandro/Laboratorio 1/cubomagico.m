function cubomagico
clear all
clc
n= input('Ingrese la dimension del cuadrado magico nxn: ');
m = magic(n)
save magico_n.txt m -ascii
M=load ('magico_n.txt');
maximo=(max(max(M)));
[a b]=find(M==maximo);
fprintf('%s %3.0f \n','El maximo sera =',maximo)
fprintf('%s %2.0f \n %s %2.0f \n',' fila =',a,'columna =',b)
end