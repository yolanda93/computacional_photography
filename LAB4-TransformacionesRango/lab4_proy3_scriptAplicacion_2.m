clear;
im0 = imread('face.jpg');
X_tam = 300; Y_tam =210; 
X0 = 537; Y0 = 351;
im2 = im0(Y0:Y0+Y_tam,X0:X0+X_tam,:); %imagen del ojo
X_fr= 310; Y_fr=138;
im1 = im0; im1(Y_fr:Y_fr+Y_tam,X_fr:X_fr+X_tam,:) = im2(:,:,:); 
mask = crea_mask(im0,[X_fr+X_tam/2 Y_fr+Y_tam/2+8]);
%im = (1-mask).*double(im0) + mask.*double(im1);
im1 = uint8(im1);

%figure(1); image(im0);
%figure(2); image(im1);

%Fusion por bandas
n = ;
p0 = lap(im0,n); %piramide lapciana de im0
p1 = lap(im1,n); %piramide lapciana de im0
mask_cell = piramideGau(mask,n); %piramide lapciana de mascara gaussiana

new=cell(1,n);

for k = 1:n,
 % Piramide laplaciana compuesta
 new{k} = (1- mask_cell{k}).*p0{k} + mask_cell{k}.*p1{k};
end

%figure(1); visualiza_lap(mask_cell);
%figure(2); visualiza_lap(new);

imagen_fusionada = invlap(new);



figure(3);image(imagen_fusionada);
set(gcf, 'name', 'Imagen fusionada');
fc_truesize();


