%% Apartado A
%
im = imread('faunia.jpg');
im_copia1 = fc_rgb2ntsc(im);
im_copia2 = fc_rgb2ntsc(im);

% Primera imagen
planoY = im_copia1(:,:,1);
P = 0.3;
im_copia1 = fc_imresize(im_copia1, P);
im_copia1 = fc_imresize(im_copia1, 1/P);
im_copia1(:,:,1) = planoY; % Volvemos a meter el plano Y en una imagen que ha perdido informacion

% Segunda imagen
P = 0.3;
im_copia2 = fc_imresize(im_copia2, P);
im_copia2 = fc_imresize(im_copia2, 1/P);


im_copia1 = fc_ntsc2rgb(im_copia1);
im_copia2 = fc_ntsc2rgb(im_copia2);

figure(1);image(im); set(gcf, 'name', 'Figura Original')
fc_truesize();
figure(2);image(im_copia1); set(gcf, 'name', 'Primera Copia')
fc_truesize();
figure(3);image(im_copia2); set(gcf, 'name', 'Segunda Copia')
fc_truesize();

im_bw = imread('faunia.jpg');