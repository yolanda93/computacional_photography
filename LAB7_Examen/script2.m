s=5; x = -10:10; % sigma = 1, soporte = ?2:2 (N=5)
h = exp(-(x.^2)/(2*s.^2)); % Expresion gauss 1D
h = h/sum(h); % Normaliza para que suma=1
G = h' * h; % Crea mascara 2D