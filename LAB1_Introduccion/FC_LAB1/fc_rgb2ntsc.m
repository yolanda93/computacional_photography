function yiq=fc_rgb2yiq(rgb)
% From RGB image to YIQ

[N M s]=size(rgb);

if s~=3, 
  yiq=-1; fprintf('Input must be RGB image\n');
  return; 
end

is_uint8=strcmp(class(rgb),'uint8');

if is_uint8, rgb=double(rgb)/255; end  % [0,1]

% Transformation matrix
A = [0.299 0.587 0.114; 0.596 -0.274 -0.322; 0.211 -0.523 0.312]; 

I = reshape(rgb,N*M,3);
I = I*A';

yiq = reshape(I,N,M,3);


return