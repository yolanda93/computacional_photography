load datos_gredos;
x = 3040; y = 2022;
densidad = 129; %pix/mm
focal = 23; %mm

ErHermanito = datos3D(6);
Casquerazo = datos3D(10);
PicoHuertos = datos3D(24);
RiscoNegro = datos3D(26);

listaDatos3x4en3d = [ ErHermanito; Casquerazo; PicoHuertos; RiscoNegro];

im = imread('IMGP3029.jpg');

image(im); hold on;

% Puntos cogidos a "mano" sobre el dibujo y pertenecientes a los picos
listaDatos2x4en2dAMano = [ 1035 727; 1201, 665; 2472, 338;2992, 374];

% Obtenemos los puntos marcados sobre la imagen
plot(listaDatos2x4en2dAMano(1, 1), listaDatos2x4en2dAMano(1, 2),'ro','MarkerFaceColor','r','MarkerSize',3);
plot(listaDatos2x4en2dAMano(2, 1), listaDatos2x4en2dAMano(2, 2),'ro','MarkerFaceColor','r','MarkerSize',3);
plot(listaDatos2x4en2dAMano(3, 1), listaDatos2x4en2dAMano(3, 2),'ro','MarkerFaceColor','r','MarkerSize',3);
plot(listaDatos2x4en2dAMano(4, 1), listaDatos2x4en2dAMano(4, 2),'ro','MarkerFaceColor','r','MarkerSize',3);

