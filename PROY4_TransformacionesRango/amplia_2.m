function im2=amplia_2(im)
% im2=amplia_2(im)
% Amplia im en un factor 2 en cada dimensión.
% Resultado en im2.
% Usa filtro Lanczlos

 a=2;
 x = [-a+0.5:0.5:a-0.5];
 L = sinc(x/a).*sinc(x);
 L=L/(sum(L)-1); L(4)=1;

 L = L'*L;
  

[N M s]=size(im);


% Inserta 0's
im2=zeros(2*N,2*M,s);
for c=1:s,  
  for k=1:N, im2(2*k-1,1:2:end,c)=im(k,:,c); end
end  


% Filtra con kernel
im2 = fc_imfilter(im2,L,'symmetric');


switch(class(im))
    case 'uint8',im2= uint8(im2);    
end 

return