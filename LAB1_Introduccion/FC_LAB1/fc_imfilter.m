function res=mi_imfilter(im,h,tipo)
% res=mi_imfilter(im,h,tipo)
% Filtra imagen im con filtro h
% tipo = 'replicate','symmetric','circular',
% tipo = valor numérico 

[N M s]=size(im);
[n m]=size(h);

n2 = floor((n-1)/2); 
m2 = floor((m-1)/2);

temp = rellena(im,n2,n-n2-1,m2,m-m2-1,tipo);

res=zeros(N,M,s);

for k=1:s,    
 plano = double(temp(:,:,k));
 res(:,:,k)=filter2(h,plano,'valid');
end    

switch(class(im))
    case 'uint8', res = uint8(res);    
end    

return

function res=rellena(im,a,b,c,d,forma)


fondo=0; if ~ischar(forma), fondo=forma; forma='cte'; end


[N M s]=size(im);

res = fondo*ones(N+a+b,M+c+d,s);
res([1:N]+a,[1:M]+c,:)=im;


switch forma,
    
    case 'media'
      
      for k=1:s, 
        m=mean(mean(im(:,:,k))); 
        res(:,:,k)=0*res(:,:,k)+m;
      end
      res([1:N]+a,[1:M]+c,:)=im;
                    
    case 'replicate'
      for k=1:s,  
          res([1:a],:,k) = ones(a,1)*res(a+1,:,k);
          res([1:b]+a+N,:,k) = ones(b,1)*res(a+N,:,k);
          
          res(:,1:c,k) = res(:,c+1,k)*ones(1,c);
          res(:,[1:d]+c+M,k) = res(:,c+M,k)*ones(1,d);
      end 
      
    case 'symmetric'
     for k=1:s,    
      res(1:a,:,k) = flipud(res([1:a]+a+1,:,k));
      res([1:b]+a+N,:,k) = flipud(res([1:b]+a+N-b-1,:,k));
      
      res(:,1:c,k) = fliplr(res(:,[1:c]+c+1,k));
      res(:,[1:d]+c+M,k) = fliplr(res(:,[1:d]+c+M-d-1,k));      
     end   
        
    case 'circular'   
     for k=1:s,          
      res(1:a,:,k) = res([1:a]+N,:,k);  
      res([1:b]+a+N,:,k) = res([1:b]+a,:,k);  
      
      res(:,[1:c],k) = res(:,[1:c]+M,k);  
      res(:,[1:d]+c+M,k) = res(:,[1:d]+c,k);  
     end          
end     
         
switch(class(im))
    case 'uint8', res = uint8(res);    
end    



