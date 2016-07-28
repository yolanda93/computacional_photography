%% Apartado B
%
clear;
im1 = imread('beach1.jpg');
im2 = imread('beach2.jpg');

im_copia1 = fc_rgb2lab(im1);
im_copia2 = fc_rgb2lab(im2);

% Primera imagen
mean_1 = zeros(1,3);
desv_1 = zeros(1,3);

for n = 1:3
    mean_1(n) = mean2(im_copia1(:,:,n));
    desv_1(n) = std2(im_copia1(:,:,n));
end

% Segunda imagen
mean_2 = zeros(1,3);
desv_2 = zeros(1,3);

for n = 1:3
    mean_2(n) = mean2(im_copia2(:,:,n));
    desv_2(n) = std2(im_copia2(:,:,n));
end


% Cambiamos imagen1
longitud1 = size(im_copia1(:,:,1));

for n = 1:3
   for i = 1:longitud1(1)
       for j = 1:longitud1(2)
           pixel = im_copia1(i,j,n);
           pixel = (pixel- mean_1(n))/desv_1(n);
           pixel = (pixel*desv_2(n))+mean_2(n);
           im_copia1(i,j,n) = pixel;
       end
   end
end

% Cambiamos imagen2
longitud2 = size(im_copia2(:,:,1));

for n = 1:3
   for i = 1:longitud2(1)
       for j = 1:longitud2(2)
           pixel = im_copia2(i,j,n);
           pixel = (pixel- mean_2(n))/desv_2(n);
           pixel = (pixel*desv_1(n))+mean_1(n);
           im_copia2(i,j,n) = pixel;
       end
   end
end

% Volvemos al rgb y mostramos las imagenes
im_cambiada1 = fc_lab2rgb(im_copia1);
im_cambiada2 = fc_lab2rgb(im_copia2);

figure(1);image(im_cambiada1); set(gcf, 'name', 'Beach 1: Todos los planos cambiados')
%fc_truesize();
figure(2);image(im_cambiada2); set(gcf, 'name', 'Beach 2: Todos los planos cambiados')
%fc_truesize();



% Ahora volvemos a realizar los cambios pero sin tocar la luminancia (nos saltamos su plano, que es el primero)
im_copia3 = fc_rgb2lab(im1);
im_copia4 = fc_rgb2lab(im2);

% Cambiamos imagen1
longitud1 = size(im_copia3(:,:,1));

for n = 2:3
   for i = 1:longitud1(1)
       for j = 1:longitud1(2)
           pixel = im_copia3(i,j,n);
           pixel = (pixel- mean_1(n))/desv_1(n);
           pixel = (pixel*desv_2(n))+mean_2(n);
           im_copia3(i,j,n) = pixel;
       end
   end
end

% Cambiamos imagen2
longitud2 = size(im_copia4(:,:,1));

for n = 2:3
   for i = 1:longitud2(1)
       for j = 1:longitud2(2)
           pixel = im_copia4(i,j,n);
           pixel = (pixel- mean_2(n))/desv_2(n);
           pixel = (pixel*desv_1(n))+mean_1(n);
           im_copia4(i,j,n) = pixel;
       end
   end
end

% Volvemos al rgb y mostramos las imagenes
im_cambiada3 = fc_lab2rgb(im_copia3);
im_cambiada4 = fc_lab2rgb(im_copia4);

figure(3);image(im_cambiada3); set(gcf, 'name', 'Beach 1: Luminancia intacta')
%fc_truesize();
figure(4);image(im_cambiada4); set(gcf, 'name', 'Beach 2: Luminancia intacta')
%fc_truesize();
figure(5);image(im1); set(gcf, 'name', 'Beach 1: Original')
%fc_truesize();
figure(6);image(im2); set(gcf, 'name', 'Beach 2: Original')
%fc_truesize();






    
