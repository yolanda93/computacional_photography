function [h x]=fc_imhist(im,N)

if nargin==1, N=256; end


is_uint8=strcmp(class(im),'uint8'); % Check if input is uint8 class

if is_uint8, 
    x=(0:N-1)*255/(N-1); im=double(im);
else
    MM=max(max(im(:,:,1)));
    x=MM*(0:N-1)/(N-1); 
end

if size(im,3)==1,
  h = histc(im(:),x);
  
  if nargout==0,
    g=[1 1 1]*0.4;  
    stem(x,h,'k','Marker','none'); 
    %set(bb,'EdgeColor',g,'FaceColor',g);
  end  
else 
  h=zeros(N,3);
  
  for k=1:3,
    h(:,k) = histc(reshape(im(:,:,k),1,size(im,1)*size(im,2)),x);      
  end    

  if nargout==0,   
    stem(x,h(:,1),'r','Marker','none'); hold on;
    stem(x+0.33,h(:,2),'g','Marker','none');
    stem(x+0.67,h(:,3),'b','Marker','none');
    hold off
  end 
  
  
end    
  
  set(gca,'Xlim',[x(1) x(end)]);

return




