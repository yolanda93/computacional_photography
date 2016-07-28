function fc_truesize

% Control de que existe figura, ejes, imagen
fig=findobj('type','figure'); if isempty(fig), return; end; 
fig=fig(1); 

eje=findobj(fig,'type','axes'); if isempty(eje), return; end;
set(eje,'Units','Norm');

h_im = findobj(eje,'type','image');
if isempty(h_im), return; end


dim_im=[size(get(h_im,'Cdata'),2) size(get(h_im,'Cdata'),1)];
pos_f = get(gcf,'Pos'); dim_fig = pos_f(3:4);

set(gca,'Pos',[0.0 0.0 1 1]); % Ejes cubriendo fig
pos_eje=get(gca,'Pos'); 
dim_eje=pos_eje(3:4).*dim_fig;

factor = dim_im./dim_eje;
new_dim_fig = round(dim_fig.*factor);

%qq=get(eje,'Pos');qq=qq(3:4).*

% Falta control de imagen muy grande.
screen=get(0,'ScreenSize'); screen=screen(3:4);

ratio=(new_dim_fig./screen);
M=max(ratio)+0.10;

if M>1,
   K = floor(20/M)/20;
   new_dim_fig =  new_dim_fig*K;
   fprintf('WARNING: Screen size %d x %d. Imagen reducida al %.0f%%\n',screen,K*100);
end    

% Centrar figura

pos_f(1) = (screen(1)-new_dim_fig(1)  )/2;
pos_f(2) = (screen(2)-new_dim_fig(2)-50  )/2;
set(gcf,'Pos',[pos_f(1:2) new_dim_fig]);


%set(gca,'Units','Pixels'); get(gca,'Pos'); set(gca,'Units','Norm');








