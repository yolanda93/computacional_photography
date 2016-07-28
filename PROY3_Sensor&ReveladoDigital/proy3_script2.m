% Ejercicio 2
r = zeros(size(imNorm));
g = zeros(size(imNorm));
b = zeros(size(imNorm));
r(1:2:end,1:2:end)=imNorm(1:2:end,1:2:end);
g(1:1:end,2:2:end)=imNorm(1:1:end,2:2:end);
g(2:1:end,1:2:end)=imNorm(2:1:end,1:2:end);
b(2:2:end,2:2:end)=imNorm(2:2:end,2:2:end);


