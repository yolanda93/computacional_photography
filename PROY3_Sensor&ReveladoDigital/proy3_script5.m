function [ r_inter g_inter b_inter ] = proy3_script4( raw )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

tamano = size(raw);

r_raw = raw(:,:,1);
g_raw = raw(:,:,2);
b_raw = raw(:,:,3);

r = zeros(tamano(1),tamano(2));
g = zeros(tamano(1),tamano(2));
b = zeros(tamano(1),tamano(2));

r(1:2:end,1:2:end) = r_raw(1:2:end,1:2:end); %asignamos los valores del raw
r(1:2:end,2:2:end-1) = (r(1:2:end,1:2:end-2)+r(1:2:end,3:2:end))./2;  %asignamos la media entre los valores asignados a la fila
r(2:2:end-1,2:end-1) = (r(1:2:end-2,2:end-1)+r(3:2:end,2:end-1))./2; %rellenamos filas vacias con vecinos de columnas

b(2:2:end,2:2:end) = b_raw(2:2:end,2:2:end); %asignamos los valores del raw
b(2:2:end,3:2:end-1) = (b(2:2:end,1:2:end-2)+ b(2:2:end,4:2:end))./2; %asignamos la media entre los valores asignados a la fila
b(3:2:end-1,2:end-1) = (b(2:2:end-2,2:end-1)+ b(4:2:end,2:end-1))./2; %rellenamos filas vacias con vecinos de columnas

g(1:2:end,2:2:end) = g_raw(1:2:end,2:2:end); % asignamos casillas impares
g(2:2:end,1:2:end) = g_raw(2:2:end,1:2:end); % asignamos casillas pares

for f = 2:tamano(1)-1
 for c = 2:tamano(2)-1    
    if g(f,c) == 0
     g(f,c) = (g(f,c-1) + g(f,c+1) + g(f-1,c) + g(f+1,c))/4;
    end
 end
end

r_inter = r(2:end-1,2:end-1);
g_inter = g(2:end-1,2:end-1); 
b_inter = b(2:end-1,2:end-1); 
        

end
