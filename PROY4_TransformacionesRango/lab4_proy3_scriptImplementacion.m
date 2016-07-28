im = imread('faunia2.jpg');
p = lap(im,5);
visualiza_lap(p);

im_invlap = invlap(p);
figure(2); image(im_invlap);
set(gcf, 'name', 'Imagen con invlap');

figure(3); image(im);
set(gcf, 'name', 'Imagen original');

media_original = mean2(im);
media_invlap = mean2(im_invlap);

diferencia = abs(media_original-media_invlap);
display(media_original);
display(media_invlap);
display(diferencia);