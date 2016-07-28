function visualiza_lap(p)

ss = size(p{1}); r = ss(1)/ss(2);

s=get(0,'ScreenSize'); s=s(3:4);

% figure(1); 
set(gcf,'MenuBar','none');


N=length(p);

if r<=1, % Apaisada, disposicion vertical
    
 set(gcf,'Pos',[0 0 0.9*s.*[1/(2*r) 1]]);
 
 a=0.96; dy = 1;
 for k=1:N,
  dx=0.5-a/2;  dy=dy-a/2-0.005;
  axes('Pos',[dx dy a*[1 0.5]]);   
  Q = p{k}; m=min(Q(:)); M=max(Q(:)); 
  Q = (Q-m)/(M-m);
  image(Q); axis off;  %fc_truesize      
  a=a/2; 
end  

 return
 
 dx=0.01; s=0.98*r/2; dy=1-2*s-0.01;
 
 
    
else  % Retrato, disposicion horizntal
    
 set(gcf,'Pos',[0 0 0.9*s.*[1 1/r]]);
 dx=0.01; s=0.48; dy = 0.01;
 for k=1:N,
  axes('Pos',[dx dy+0.5-r*s s*[1 2*r]]);   
  Q = p{k}; m=min(Q(:)); M=max(Q(:)); 
  Q = (Q-m)/(M-m);
  image(Q); axis off;  %fc_truesize      
  dx = dx + s + 0.005; s=s/2;
end  
 
end    

return

figure(33); 
set(gcf,'MenuBar','none');








  
return
