function demoP3(arg)

global im im_h
global x y pl lin selected 
global N M s

if nargin==0, arg='inicio'; im=imread('foto.jpg'); 
else
 if ~ischar(arg), im=arg; arg='inicio'; end    
end

switch(arg)
  
    case 'inicio'           
      
     [N M s]=size(im);      

   
     x = round([M/4 M/2 3*M/4]); 
     y=  round(N*[3 1 3]/4); 
     x = [x x]; y=[y y]; 
     
     figure(1); 
     axes('pos',[0.05 0.05 0.43 0.9]); 
     hold off; image(im,'Xdata',[1 M],'Ydata',[1 N]);
            
     hold on      
     lin(1)=plot([x(1:3) x(1)],[y(1:3) y(1)],'y','LineWidth',2,...
                  'UserData',1);
     
     pl=zeros(1,3);
     for k=1:3, 
         pl(k)=plot(x(k),y(k),'yo','MarkerFaceColor','y',...
                              'UserData',k,'MarkerSize',6); 
     end         
     hold off
     
     set(gca,'Xlim',[-5 M+5],'Ylim',[-5 N+5],'Color',get(gcf,'Color')')
     axis off

     axes('pos',[0.52 0.05 0.43 0.9]); 
     hold off;  im_h=image(im,'Xdata',[1 M],'Ydata',[1 N]);      
     
     hold on 
     
     lin(2)=plot([x(4:6) x(4)],[y(4:6) y(4)],'r','LineWidth',2,'UserData',2); 
          
     for k=3+1:6, 
         pl(k)=plot(x(k),y(k),'ro','MarkerFaceColor','r',...
                            'UserData',k,'MarkerSize',6); 
     end                   
     hold off; 
     set(gca,'Xlim',[-5 M+5],'Ylim',[-5 N+5])
     axis off
     set(gca,'Color',get(gcf,'Color')');

     set(pl,'ButtonDownFcn','demoP3 pincha_punto');
     
     colormap(gray(256))
         
        
    case 'pincha_punto'
      selected=get(gcbo,'UserData'); 
      set(gcf,'WindowButtonUpFcn','demoP3 release_punto');
      set(gcf,'WindowButtonMotionFcn','demoP3 mueve_punto');   
      
    case 'mueve_punto'
      pos=get(gca,'CurrentPoint'); X=pos(1,1); Y=pos(1,2);
            
      set(gco,'Xdata',X,'Ydata',Y);           
      y(selected)=Y; x(selected)=X;
      demoP3 pinta_lineas

    case 'chequea'  
      x(x<1)=1; y(y<1)=1;  
      x(x>M)=M; y(y>N)=N;
      demoP3 pinta_lineas
      demoP3 pinta_puntos 
      
 
         
    case 'release_punto'
     
      demoP3 chequea  
      
      set(gcf,'WindowButtonMotionFcn','');    
      set(gcf,'WindowButtonUpFcn','');
 
      demoP3 interpola

    case 'pinta_puntos'
        
      for k=1:2*3, 
         set(pl(k),'Xdata',x(k),'Ydata',y(k));
      end
      
    case 'pinta_lineas'
     
                    
      set(lin(1),'Xdata',[x(1:3) x(1)],'Ydata',[y(1:3) y(1)]);
      set(lin(2),'Xdata',[x(4:6) x(4)],'Ydata',[y(4:6) y(4)]); 
           
    case 'interpola'

     P=get_P3([x((1:3)+3)' y((1:3)+3)'],[x(1:3)' y(1:3)']);
     im2 = interpola(im,P); im2(isnan(im2))=128;
     set(im_h,'Cdata',uint8(im2));

     
end

return

