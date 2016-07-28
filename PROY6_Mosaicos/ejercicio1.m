im=imread('image01.jpg'); bw=fc_rgb2gray(im); imwrite(bw,'img.pgm');
system('siftWin32 <img.pgm >data.txt');
parse_keyfile('data.txt',[2,3]);
name='image';
Nfotos=10;
s=cell(1,Nfotos);

for k = 1:Nfotos,
    fich=sprintf('%s%02d.jpg',name,k);
    im=imread(fich);
    bw=fc_rgb2gray(im); 
    imwrite(bw,'img.pgm');
    system('siftWin32 <img.pgm >data.txt');
    s{k}=parse_keyfile('data.txt',[2,3]);
end

