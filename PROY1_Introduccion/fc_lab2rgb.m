function rgb=fc_lab2rgb(lab)
% From RGB to Lab color space

[N M s]=size(lab); 

if s~=3,rgb=-1; fprintf('Input must have 3 color planes\n'); return; end

if strcmp(class(lab),'uint8'), rgb=double(rgb); end 


A = [0.3811 0.5783 0.0402; 0.1967 0.7244 0.0782; 0.0241 0.1288 0.8444];
v = [3 6 2]; v = 1./sqrt(v);
H = diag(v)*[1 1 1; 1 1 -2; 1 -1 0];

lab = reshape(lab,N*M,s)';  % 3 x Np 

lms = H\lab; LMS = 10.^lms; q = A\LMS; q=q';
qq = uint8(round(q));
rgb=reshape(qq,N,M,3);  % Back to N x M x 3 

return

