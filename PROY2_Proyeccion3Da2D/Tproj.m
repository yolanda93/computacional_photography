function [uv Zc]=Tproj(X,datos3D)
% Parametros de entrada
% X:la posición (E0,N0,h0 en metros) de la cámara y los 3 ángulos (az, elev, inv en grados) que definen su
% orientación.
% datos3D: matriz 3 x N con las coordenadas de los N puntos 3D a proyectar.
% Cada columna corresponde a las coordenadas (E,N,h) de un punto.
 
global u0 v0 f
 
posicionCamara = X(1:3);
posicionCamara_E = X(1);
posicionCamara_N = X(2);
posicionCamara_h = X(3);
 
angulosCamara = X(4:6)*(pi/180); % los pasamos a radianes
az = angulosCamara(1);
elev = angulosCamara(2);
inv = angulosCamara(3);
 
% Desglosamos el vector en las filas que lo forman
datoscamara3d_E = datos3D(1,:)-posicionCamara_E;
datoscamara3d_N = datos3D(2,:)-posicionCamara_N;
datoscamara3d_h = posicionCamara_h-datos3D(3,:);
 
% matrices de giro
matrizCamaraAzimuth = [cos(az) , 0, -sin(az); 0, 1, 0; sin(az), 0, cos(az)];
matrizCamaraElevacion = [1, 0, 0; 0, cos(elev), sin(elev); 0, -sin(elev), cos(elev)];
matrizCamaraInclinacion = [cos(inv), sin(inv), 0; -sin(inv), cos(inv), 0; 0, 0, 1];
 
%datos camara 
datoscamara3d_final = matrizCamaraInclinacion*matrizCamaraElevacion*matrizCamaraAzimuth*[datoscamara3d_E;datoscamara3d_h;datoscamara3d_N];
 
%coordenadas normalizadas de una proyeccion ideal
x_norm = datoscamara3d_final(1,:) ./ datoscamara3d_final(3,:);
y_norm = datoscamara3d_final(2,:) ./ datoscamara3d_final(3,:);
 
% de coordenadas a pixeles 
u = u0 + f*x_norm;
v = v0 + f*y_norm;
 
uv = [u;v];
 
%Extraemos la tercera componente(Zc) de las coordenadas camara
Zc = datoscamara3d_final(3,:);
 
return