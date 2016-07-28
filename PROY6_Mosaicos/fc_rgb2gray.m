function out=fc_rgb2gray(im)

if (size(im,3)~=3), 
    fprintf('Need a RGB input image with 3 color planes\n');
    out=-1; return; 
end

is_uint8=strcmp(class(im),'uint8'); % Check if input is uint8 class

if is_uint8, im=double(im); end

out = 0.2989*im(:,:,1) + 0.5870*im(:,:,2) + 0.1140*im(:,:,3);

if is_uint8, out=uint8(out); end

return