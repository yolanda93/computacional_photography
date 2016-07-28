function im=invlap(p)
N = length(p); % N�mero de n�veles de la piramide
im=p{N}; % Inicializamos con version tama�o sello.
im = double(im);
% Ir sumando los detalles de los niveles p{k-1}, p{k-2}, ..., p{1} de la piramide laplaciana
% Recordad que p{N} es la versi�n reducida de la imagen

for k=N-1:-1:1,
    im = amplia_2(im);
    im = im + p{k};
end

im = uint8(im);

end