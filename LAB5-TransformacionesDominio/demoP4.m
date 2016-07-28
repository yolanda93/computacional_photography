function demoP4(arg)

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
   
     x = [1 M M 1]; y=[1 1 N N]; 
     x = [x x]; y=[y y]; 
     
     figure(1); 
     axes('pos',[0.05 0.05 0.43 0.9]); 
     hold off; image(im,'Xdata',[1 M],'Ydata',[1 N]);
            
     hold on      
     lin(1)=plot([x(1:4) x(1)],[y(1:4) y(1)],'y','LineWidth',2,...
                  'UserData',1);
     
     pl=zeros(1,8);
     for k=1:4, 
         pl(k)=plot(x(k),y(k),'yo','MarkerFaceColor','y',...
                              'UserData',k,'MarkerSize',5); 
     end         
     hold off
     
     set(gca,'Xlim',[-5 M+5],'Ylim',[-5 N+5],'Color',get(gcf,'Color')')
     axis off

     axes('pos',[0.52 0.05 0.43 0.9]); 
     hold off;  im_h=image(im,'Xdata',[1 M],'Ydata',[1 N]);      
%     truesize;
     
     hold on 
     
     lin(2)=plot([x(5:8) x(5)],[y(5:8) y(5)],'r','LineWidth',2,'UserData',2); 
          
     for k=5:8, 
         pl(k)=plot(x(k),y(k),'ro','MarkerFaceColor','r',...
                            'UserData',k,'MarkerSize',5); 
     end  
     
     hold off; 
     set(gca,'Xlim',[-5 M+5],'Ylim',[-5 N+5])
     axis off
     set(gca,'Color',get(gcf,'Color')');

     set(pl,'ButtonDownFcn','demoP4 pincha_punto');
     
     colormap(gray(256))
     
      
        
    case 'pincha_punto'
      selected=get(gcbo,'UserData'); 
      set(gcf,'WindowButtonUpFcn','demoP4 release_punto');
      set(gcf,'WindowButtonMotionFcn','demoP4 mueve_punto');   
      
     %sub=im(K*S+[1-2*S:0],[1:2*S]+(J-2)*S,:); 
     %set(im2_h,'Cdata',sub);
      
      
    case 'mueve_punto'
      pos=get(gca,'CurrentPoint'); X=pos(1,1); Y=pos(1,2);
            
      set(gco,'Xdata',X,'Ydata',Y);           
      y(selected)=Y; x(selected)=X;
      demoP4 pinta_lineas


    case 'chequea'  
      x(x<1)=1; y(y<1)=1;  
      x(x>M)=M; y(y>N)=N;
      demoP4 pinta_lineas
      demoP4 pinta_puntos 
      
 
         
    case 'release_punto'
     
      demoP4 chequea  
      
      set(gcf,'WindowButtonMotionFcn','');    
      set(gcf,'WindowButtonUpFcn','');
 
      demoP4 interpola

    case 'pinta_puntos'
        
      for k=1:8, 
         set(pl(k),'Xdata',x(k),'Ydata',y(k));
      end
      
    case 'pinta_lineas'
     
                    
      set(lin(1),'Xdata',[x(1:4) x(1)],'Ydata',[y(1:4) y(1)]);
      set(lin(2),'Xdata',[x(5:8) x(5)],'Ydata',[y(5:8) y(5)]); 

           
    case 'interpola'
            
     P=get_P4([x(5:8)' y(5:8)'],[x(1:4)' y(1:4)']);
          
     im2 = interpola(im,P); im2(isnan(im2))=128;
             
     set(im_h,'Cdata',uint8(im2));
     
end



