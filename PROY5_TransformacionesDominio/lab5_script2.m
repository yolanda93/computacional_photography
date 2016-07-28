P = [0.2997 -0.4120 122.4903;
0.0094 -0.0688 71.8727;
0.0000 -0.0020 1.0000];

im = imread('foto.jpg');
figure(1); image(im);
im = interpola(im,P);

figure(2); image(im);