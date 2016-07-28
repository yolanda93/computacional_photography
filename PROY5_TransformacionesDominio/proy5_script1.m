yoli=imread('ant.jpg');
victor=imread('willis.jpg');
load('xy_control.mat');
% promediar las coordenadas 
%yoli=imread('yoli.jpg');
%victor=imread('victor.jpg');
%load('xy_yoli_victor.mat');

[N,M,s] = size(x1);
xm= x1./2 + x2./2;
ym= y1./2 + y2./2;
tri=delaunay(xm,ym);
figure
image(ant);hold on;
triplot(tri,x1,y1);
[NT,M,s]=size(tri);
figure
image(willis);hold on;
triplot(tri,x2,y2);

P1=cell(1,NT);
P2=cell(1,NT);

%Calcular las matrices de transformación.
for k = 1:NT
    id=tri(k,:);
    Xorg=xm(id,:);
    Yorg=ym(id,:);
    X1dest=x1(id,:);
    Y1dest=y1(id,:);
    X2dest=x2(id,:);
    Y2dest=y2(id,:);
    destino1=[X1dest,Y1dest];  
    destino2=[X2dest,Y2dest];
    origen=[Xorg,Yorg];
    P1{k}=get_P3(origen,destino1);
    P2{k}=get_P3(origen,destino2);
end
% vemos en que triangulo cae cada pixel.
[N,M,s]=size(yoli);
clas=determina_triang(tri,[xm ym],N,M);
antDef=deforma_img(ant,P1,clas);
willisDef=deforma_img(willis,P2,clas);
figure; image(uint8(antDef));
figure; image(uint8(willisDef));

res = (antDef+willisDef)/2.0;
figure; image(uint8(res));




