function p=piramideGau(im_original,N)
if nargin==1, N=5; end % Si numero de argumentos igual a uno asignamos a N 5
p=cell(1,N);

% Crear filtro gaussiano 2D a usar
s=3; x = -5:5; % sigma = 1, soporte = ?2:2 (N=5)
h = exp(-(x.^2)/(2*s.^2)); % Expresion gauss 1D
h = h/sum(h); % Normaliza para que suma=1
G = h' * h; % Crea mascara 2D

% Calcular los niveles p{1}, p{2}, ..., p{N} de la piramide laplaciana
% Recordad que p{N} es la versión reducida de la imagen
im_original=double(im_original);
for k=1:N,
    im_suavizada=fc_imfilter(im_original,G,'symmetric'); % Obtenemos la imagen suavizada
    p{k} = im_suavizada; %obtenemos los detalles
    im_original = im_suavizada(1:2:end,1:2:end,:);
end

return