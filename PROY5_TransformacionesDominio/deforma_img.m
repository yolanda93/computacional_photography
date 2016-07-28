function im2=deforma_img(im,P,clas)
% im = imagen a deformar (im1 o im2)
% P{} = familia de matrices afines a utilizar (P1 o P2)
% clas = informaci�n sobre tri�ngulo al que pertenece cada p�xel, que
% usar� para determinar que P{k} usar en la transformaci�n coordenadas
[N,M,s]=size(im);
im=double(im); % Ahora deja las cosas como est�n

Xi = zeros(N,M);     
Yi = zeros(N,M);

for k = 1:N, 
    for j = 1:M,
      vec = [j k 1]'; % hallamos vector de coordenadas homog�neas.
      c=clas(k,j);
      vec = P{c}*vec; % aplicamos P al vector
      
      Xi(k,j) = vec(1)/vec(3); % normalizamos x
      Yi(k,j) = vec(2)/vec(3); % normalizamos y y luego lo guardamos en nuestras matrices  
    
    end
end
  
im2(:,:,1) = interp2(im(:,:,1),Xi,Yi,'bilinear');
im2(:,:,2) = interp2(im(:,:,2),Xi,Yi,'bilinear');
im2(:,:,3) = interp2(im(:,:,3),Xi,Yi,'bilinear');


return
