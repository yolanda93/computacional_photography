% Ejercicio 1
clear;
imRaw=double(imread('raw_red.pgm'));
imRaw = imRaw-128;
for i=1:length(imRaw)
   if(imRaw(i)<0)
       imRaw(i)=0;
   end
end
imRaw=imRaw./(4095-128);
