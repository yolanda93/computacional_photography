%ejercicio 2
R = zeros(size(imNorm));
G = zeros(size(imNorm));
B = zeros(size(imNorm));
R(1:2:end,1:2:end)=imNorm(1:2:end,1:2:end);
G(1:1:end,2:2:end)=imNorm(1:1:end,1:2:end);
B(2:2:end,2:2:end)=imNorm(2:2:end,2:2:end);


