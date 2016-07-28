im1 = imread('ajedrez1.jpg');
im2 = imread('ajedrez2.jpg');
%figure(1); image(im1);
%figure(2); image(im2);
%colormap(gray(256));

s=5; x = -10:10; 
h = exp(-(x.^2)/(2*s.^2)); % Expresion gauss 1D
h = h/sum(h); % Normaliza para que suma=1
G = h' * h; % Crea mascara 2D
%sum(G(:))

d1 = fc_imfilter(double(im1), G, 'symmetric');
d2 = fc_imfilter(double(im2), G, 'symmetric');
detalles1 = abs(im1 - uint8(d1));
detalles2 = abs(im2 - uint8(d2));
figure(3); image(detalles1);
figure(4); image(detalles2);

im3 = (im2.*0)+128;

longitud = size(im2);
umbral = 2.0;

for i=1:longitud(1)
  for j=1:longitud(2)
      if(detalles1(i,j)/detalles2(i,j) > umbral)
          im3(i,j) = im1(i,j);
      end
      if(detalles1(i,j)/detalles2(i,j) < (1/umbral))
          im3(i,j) = im2(i,j);
      end
  end
end 

figure(5);image(im3);
colormap(gray(256));
fc_truesize();


im3 = (im2.*0)+128;

M = (detalles1>detalles2);

N = 71; %valor arbitrario
P = ones(N)/(N*N);

M = fc_imfilter(M,P,'symmetric');

for i=1:longitud(1)
  for j=1:longitud(2)
      if(M(i,j) > 0.6)
          im3(i,j) = im1(i,j);
      end
      if(M(i,j) < 0.4)
          im3(i,j) = im2(i,j);
      end
      if(M(i,j) > 0.4 && M(i,j) < 0.6)
         im3(i,j) = 128;
      end
  end
end 

figure(6);image(im3);
colormap(gray(256));
fc_truesize();
          
          