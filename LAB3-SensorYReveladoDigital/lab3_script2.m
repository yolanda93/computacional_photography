im = imread('color.jpg');
%fc_truesize;
 
im2 = im(650:750,650:700,:);
figure(1);image(im2);

rgb = zeros(1,3);
rgb(1) = mean2(double(im2(:,:,1)));
rgb(2) = mean2(double(im2(:,:,2)));
rgb(3) = mean2(double(im2(:,:,3)));
media = mean(rgb); 

c = media./rgb;
c = c.*rgb;
 
im3(:,:,1) = double(im2(:,:,1)).*c(1);
im3(:,:,2) = double(im2(:,:,2)).*c(2);
im3(:,:,3) = double(im2(:,:,3)).*c(3);
 
im3 = uint8(im3);
figure(2); image(im3);
