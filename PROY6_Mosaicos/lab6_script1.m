im=imread('image01.jpg'); bw=fc_rgb2gray(im); imwrite(bw,'img.pgm');
system('siftWin32 <img.pgm >data.txt');
parse_keyfile('data.txt');
name='image';
Nfotos=10;

for k = 1:Nfotos,
    s=cell(1,Nfotos);
    fich=sprintf('%s%02d.jpg',name,k);
    im=imread(fich);
end

