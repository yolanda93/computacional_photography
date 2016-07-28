function clas=determina_triang(tri,xy,N,M)

clas=uint8(ones(N,M));

NT=size(tri,1);

for k=1:NT
  
  XY=xy(tri(k,:),:); 
  
  v0 = XY(2,:)-XY(1,:);  
  v1 = XY(3,:)-XY(1,:);
  
  d00 = v0*v0'; d01 = v1*v0'; d11 = v1*v1';
  A = [d00 d01; d01 d11]; %K =inv([d00 d01; d01 d11]);

  mm=min(XY); MM=max(XY);
  rx=mm(1):MM(1);
  ry=mm(2):MM(2);
  unos = rx*0+1;
  
  fila=1;
  for j=ry
     tira = [rx-XY(1,1); unos*j-XY(1,2)];
     dp = [v0; v1]*tira;          
     uv = A\dp;  %uv = K * dp;         
     test=((uv(1,:) >= 0) & (uv(2,:) >= 0) & (sum(uv)<= 1.01));
     clas(j,rx(test))=k; 
     fila=fila+1;           
  end
        
end    

return


