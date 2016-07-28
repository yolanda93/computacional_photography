function [xy1,xy2]=find_matches(s1,s2)


xy1=[]; xy2=[];

for k = 1:size(s1.xy,1)

   distancia = zeros(1,size(s2.desc,1));
   for n = 1:size(s2.desc,1)
     distancia(n) = norm((s1.desc(k,:)- s2.desc(n,:)));
   end
   [Dmin,M] = min(distancia,[],2);
   Dmin
   ratio=(Dmin(2)/Dmin(1));
   
   if(ratio>=5)
      xy1(k) = s1{k}.xy(1,1:2);
      xy2(k) = s2{k}.xy(M(1),1:2);
   end     
end