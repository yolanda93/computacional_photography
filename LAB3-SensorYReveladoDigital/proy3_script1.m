%ejercicio 1
imRaw=double(imread('raw_red.pgm'));
imNorm=imRaw/norm(imRaw);
for i=1:length(imNorm)
   if(imNorm(i)<128)
       imNorm(i)=0;
   end
end