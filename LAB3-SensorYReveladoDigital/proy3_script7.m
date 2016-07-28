%Ejercicio 7 y 8

function [imNL] = proy3_script7(imagen,a,sigma)
%a=0.055;
%sigma=2.4;

tamano = size(imagen);
imagen1 = imagen(:);
for i=1:length(imagen1)
   if(imagen1(i)<0.0031308)
       imagen1(i)=imagen1(i).*12.92;
   else
       imagen1(i)=(1+a).*(imagen1(i)^(1/sigma))-a;
   end
end

imagen1 = uint8(imagen1*255*1.2);
j = 1;
imNL = imagen1;

for i = 1:length(imagen)
    if(imagen(i)>255)
        imagen(i) = 255;
    end
    if(0 == mod(i,tamano(2)))
      imNL(j,:) = imagen(i-tamano(2):i); 
    end
end


end