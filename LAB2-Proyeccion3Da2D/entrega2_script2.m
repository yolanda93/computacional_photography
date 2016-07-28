global u0 v0 f

% focal en pixeles.
f = 35*129;
% centro de la imagen en pixeles.
u0 = 3040/2;
v0 = 2022/2;
% cargamos la imagen.
im = imread('IMGP3047.jpg');
image(im);

% cargamos los datos.
load('datos_gredos.mat');

%Posicion de la cámara.
X(1) = (306607);
X(2)=(4459599);
X(3)=(1766);
%Orientación de la cámara.
X(4) = (190.9);
X(5)=(11.5);
X(6)=(3.8);

[uv, Zc] = Tproj(X, datos3D); 
puntos=[uv;Zc];

u = uv(1); v = uv(2);

visible1 = u(u<3040&u>0);
visible2 = v(v<2022&v>0);

visibles=(puntos(1,:) > 0) & (puntos(1,:) < 3040) & (puntos(2,:) > 0) & (puntos(2,:) < 2022 & (puntos(3,:) > 0));

figure(1); image(im);
hold on;
figure(1); plot(puntos (1,:),puntos (2,:),'ro','MarkerFaceColor','r','MarkerSize',3);
hold off;

%Posicion "equivoca" de la cámara.
Y(1) = (306533);
Y(2)= (4459214);
Y(3)= (1846);
% Mismo angulo
Y(4:6) = X(4:6);

[uv2, Zc2] = Tproj(Y, datos3D); 
puntos2=[uv2;Zc2];
figure(2); image(im);
hold on;
plot(puntos2 (1,:),puntos2 (2,:),'ro','MarkerFaceColor','r','MarkerSize',3);

figure(3);
image(im);
hold on;
figure(3); plot(puntos (1,:),puntos (2,:),'ro','MarkerFaceColor','r','MarkerSize',3);
for x = 1:30,
    if(visibles(x)) 
        text(puntos(1,x),puntos(2,x), nombres(x),'Color','r') 
    end
end    
    
    