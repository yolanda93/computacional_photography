function lab=fc_rgb2lab(rgb)
% From RGB to Lab color space

[N M s]=size(rgb); 

if s~=3,lab=-1; fprintf('Input must be RGB image\n'); return; end

if strcmp(class(rgb),'uint8'), rgb=double(rgb); end 


A = [0.3811 0.5783 0.0402; 0.1967 0.7244 0.0782; 0.0241 0.1288 0.8444];
v = [3 6 2]; v = 1./sqrt(v);
H = diag(v)*[1 1 1; 1 1 -2; 1 -1 0];


rgb = reshape(rgb,N*M,s)';  % 3 x Np 

LMS = A*rgb; LMS(LMS==0)=0.1;
lms = log10(LMS);
lab = H*lms;

lab = reshape(lab',N,M,3);  % Back to N x M x 3 

return

