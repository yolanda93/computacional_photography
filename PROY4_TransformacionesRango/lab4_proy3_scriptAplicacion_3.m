clear;
im0 = imread('wolf_rain3.jpg');
X_tam = 265; Y_tam =315; 
X0 = 355; Y0 = 550;
im2 = im0(Y0:Y0+Y_tam,X0:X0+X_tam,:); %imagen del ojo
X_fr= 701; Y_fr= 560;
im1 = im0; im1(Y_fr:Y_fr+Y_tam,X_fr:X_fr+X_tam,:) = im2(:,:,:); 
w=[130 170];%w=[130 70]
mask = crea_mask(im0,[X_fr+X_tam/2 Y_fr+Y_tam/2+8],w);
%im = (1-mask).*double(im0) + mask.*double(im1);
im1 = uint8(im1);

%figure(1); image(im0);
%figure(2); image(im1);

%Fusion por bandas

p0 = lap(im0,5); %piramide lapciana de im0
p1 = lap(im1,5); %piramide lapciana de im0
mask_cell = piramideGau(mask,5); %piramide lapciana de mascara gaussiana

new=cell(1,5);

for k = 1:5,
 % Piramide laplaciana compuesta
 new{k} = (1- mask_cell{k}).*p0{k} + mask_cell{k}.*p1{k};
end

figure(1); visualiza_lap(mask_cell);
figure(2); visualiza_lap(new);

imagen_fusionada = invlap(new);


set(gcf, 'name', 'Imagen fusionada');
figure(3);image(imagen_fusionada);
fc_truesize();


