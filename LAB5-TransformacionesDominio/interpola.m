function im = interpola(im,P)
[N,M,s]=size(im);
im=double(im); % Ahora deja las cosas como están

Xi = zeros(N,M);     
Yi = zeros(N,M);

for k = 1:N, 
    for j = 1:M,
      vec = [j k 1]'; % hallamos vector
      vec = P*vec; % aplicamos P al vector
      
      Xi(k,j) = vec(1)/vec(3); % normalizamos x
      Yi(k,j) = vec(2)/vec(3); % normalizamos y y luego lo guardamos en nuestras matrices  
    
    end
end
  
im2(:,:,1) = interp2(im(:,:,1),Xi,Yi,'bilinear');
im2(:,:,2) = interp2(im(:,:,2),Xi,Yi,'bilinear');
im2(:,:,3) = interp2(im(:,:,3),Xi,Yi,'bilinear');

im = uint8(im2);

return