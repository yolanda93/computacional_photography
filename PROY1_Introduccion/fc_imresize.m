function im2=fc_imresize(im,P)
% Resize image im with a factor P
% P>1 larger image, P<1 smaller image

[N M s]=size(im);
NN=round(N*P); MM=ceil(M*P);
yi = 1+(N-1)*(0:NN-1)'/(NN-1); 
xi = 1+(M-1)*(0:MM-1)/(MM-1);


is_uint8=strcmp(class(im),'uint8'); % Check if input is uint8 class

if is_uint8, im=double(im); 
else
  max_v = max(max(max(im)));
  min_v = min(min(min(im)));
  delta = max_v-min_v;
end

if P<1  % Antialias filter
  e=1/P; xx = [-1:-1:-2*e]; xx = [xx(end:-1:1) (0:2*e)]; xx=xx/1.1;
  h = exp(-xx.^2); h=h/sum(h);
  H=h'*h;
  im=fc_imfilter(im,H,'symmetric');
end  
 

im2=zeros(NN,MM,s);
for k=1:s
  im2(:,:,k)=interp2(im(:,:,k),xi,yi,'cubic');
end  

if is_uint8, im2 = uint8(im2);
else
   max_p = max(max(max(im2)));
   min_p = min(min(min(im2)));   
   delta_p=max_p-min_p;
   im2 = min_v+(im2-min_p)*delta/delta_p;  
end    

return





