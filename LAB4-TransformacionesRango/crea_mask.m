function mask=crea_mask(im,p,w)

if nargin==2, w=[130 70]; end %w=[70 40]*2; end

[N,M,s]=size(im);
cx=p(1); cy=p(2); wx=w(1); wy=w(2);

x = ones(N,1)*(1:M); x = (x-cx)/wx;  % 75; OK
y = (1:N)'*ones(1,M); y = (y-cy)/wy; % 45; OK 
r = sqrt(x.^2 + y.^2);
mask = (r<=1); 

if s==3, mask = cat(3,mask,mask,mask); end
  

return