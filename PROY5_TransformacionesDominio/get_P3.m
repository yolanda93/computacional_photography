function P=get_P3(xy,xyp)
x = xy(:,1); y =xy(:,2);
xp = xyp(:,1); yp=xyp(:,2); % Extraigo datos origen (x,y) y destino (xp,yp)

H=[x, y, [1 , 1 , 1]']; % matriz H cogemos de 3x3 en vez de 6x6 

c1 = H\xp;
c2 = H\yp;

P = [c1';
     c2';
     0 0 1]; % Obtenemos matriz de coeficientes

return