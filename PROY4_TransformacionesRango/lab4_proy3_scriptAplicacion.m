im0 = imread('face.jpg');
figure(2); image(im0);
fc_truesize;
set(gcf, 'name', 'Imagen original');

X_tam = 300; Y_tam =210; 
X0 = 537; Y0 = 351;
im2 = im0(Y0:Y0+Y_tam,X0:X0+X_tam,:); %imagen del ojo
%figure(3); image(im2);
%fc_truesize;

X_fr= 310; Y_fr=138;
im1 = im0; im1(Y_fr:Y_fr+Y_tam,X_fr:X_fr+X_tam,:) = im2(:,:,:); 
%figure(4); image(im1);
%fc_truesize;

mask = crea_mask(im0,[X_fr+X_tam/2 Y_fr+Y_tam/2+8]);
%figure(5); image(mask);
%fc_truesize;

im = (1-mask).*double(im0) + mask.*double(im1);
im = uint8(im);
figure(6);image(im);
fc_truesize;
set(gcf, 'name', 'Imagen con 3 ojos');




