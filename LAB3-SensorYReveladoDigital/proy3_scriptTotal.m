%ejercicio 1
imRaw=double(imread('raw_red.pgm'));
imNorm=imRaw/norm(imRaw);
for i=1:length(imNorm)
    if(imNorm(i)<128)
        imNorm(i)=0;
    end
end

%ejercicio 2
r = zeros(size(imNorm));
g = zeros(size(imNorm));
b = zeros(size(imNorm));
r(1:2:end,1:2:end)=imNorm(1:2:end,1:2:end);
g(1:2:end,2:2:end) = imNorm(1:2:end,2:2:end); % asignamos casillas impares
g(2:2:end,1:2:end) = imNorm(2:2:end,1:2:end); % asignamos casillas pares
b(2:2:end,2:2:end)=imNorm(2:2:end,2:2:end);

%ejercicio 3
c=[0.75;0.75;1.0];
r(1:2:end,1:2:end) = r(1:2:end,1:2:end).*c(1);
g(1:1:end,2:2:end) = g(1:1:end,2:2:end).*c(2);
b(2:2:end,2:2:end) = b(2:2:end,2:2:end).*c(3);

%ejercicio 4 
tamano = size(r);
r(1:2:end,2:2:end-1) = (r(1:2:end,1:2:end-2)+r(1:2:end,3:2:end))./2; %asignamos la media entre los valores asignados a la fila
r(2:2:end-1,2:end-1) = (r(1:2:end-2,2:end-1)+r(3:2:end,2:end-1))./2; %rellenamos filas vacias con vecinos de columnas

b(2:2:end,3:2:end-1) = (b(2:2:end,1:2:end-2)+ b(2:2:end,4:2:end))./2; %asignamos la media entre los valores asignados a la fila
b(3:2:end-1,2:end-1) = (b(2:2:end-2,2:end-1)+ b(4:2:end,2:end-1))./2; %rellenamos filas vacias con vecinos de columnas

for f = 2:tamano(1)-1
    for c = 2:tamano(2)-1
        if g(f,c) == 0
            g(f,c) = (g(f,c-1) + g(f,c+1) + g(f-1,c) + g(f+1,c))/4;
        end
    end
end

r_inter = r(2:end-1,2:end-1);
g_inter = g(2:end-1,2:end-1);
b_inter = b(2:end-1,2:end-1);

%Ejercicio 6

RGB=[r_inter(:)';g_inter(:)';b_inter(:)'];
M1=[0.6844,0.1651,0.1009;0.3600,0.7634,-0.1235;0.0389,-0.0575,1.1072];
M2=[3.2406,-1.5372,-0.4986;-0.9689,1.8758,0.0415;0.0557,-0.2040,1.0570];
M=M1*M2;
sRGB=M*RGB;
for i=1:length(sRGB(:))
    if(sRGB(i)<0)
        sRGB(i)=0;
    end
    if(sRGB(i)>1)
        sRGB(i)=1;
    end
end

%Ejercicio 7 y 8

imagen = sRGB;
a=0.055;
sigma=2.4;

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
    if(0 == mod(i,tamano(2)-2))
      imNL(j,:) = imagen(i-(tamano(2)):i); 
      j = j+1;
    end
end


image(imNL);