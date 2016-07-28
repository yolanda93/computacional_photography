function key=parse_keyfile(fich,rg)

fid = fopen(fich,'r');
if fid == -1, error('Fichero no existe/no pudo ser abierto'); end

data = fscanf(fid,'%d %d', [1 2]);
N = data(1);
L = data(2);

data = fscanf(fid,'%f', [4+L N])';  

fclose(fid);

% Normaliza descriptores
for k=1:N
  dd = data(k,5:end); % descriptores;
  data(k,5:end)=dd/norm(dd);   
end    

% Organiza datos en estructura.
key = struct('xy',data(:,[2 1]),'sd',data(:,3:4),'desc',data(:,5:end)); 

N_org = size(key.xy,1);

fprintf('Image %s done: Norg %d ',fich,N_org);
if nargin==2,   
  % Reducir num de puntos a un rango de escalas
  smin=rg(1); smax=rg(2);
  esc = key.sd(:,1);
  keep = (esc>=smin) & (esc<=smax);  Nfin=sum(keep);  
  
  key.sd=key.sd(keep,:); 
  key.desc=key.desc(keep,:);
  key.xy=key.xy(keep,:);  
    
  fprintf(' -> N filtrados %d\n',Nfin);       
else
  fprintf('\n');  
end    


return