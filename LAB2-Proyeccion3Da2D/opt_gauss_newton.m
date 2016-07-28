function [X fval]=opt_gauss_newton(f,X0,alfa,delta)
% Busqueda del mínimo de ||f|| siguiendo el método de Gauss-Newton.
% X0 = vector de partida = vector de N parametros
% La función f es una función R^N -> R^M
% El algoritmo trata de hallar X tal que minimize ||f(X)||
% Basado en la iteración de Newton-Raphson: el siguiente punto 
% de la sucesión lo calcula como:
%
% dX = inv(J`J)*(J'*f(X));  X' = X - dX
%
%  J es la matriz Jacobiamo (J)ij = dfi/dXj
%  No hace falta suministrarla: se aproxima numéricamente.
% 
% Antes de aceptar la corrección dX comprueba si ||f(X-dX)|| < ||f(X)||
% De no ser así hace un backtracking a lo largo de la línea dada por dX:
%     X - alfa*dX, X-alfa*alfa*dX, etc. 
% Solo cuando la función de coste se reduce se acepta el paso.
% alfa es opcional. Si no se da se usa alfa=0.5
% 
% El último argumento delta también es opcional. Es un vector del mismo 
% tamaño que X (N = número de parametros). Indica que salto usar para cada
% parámetro al calcular las derivadas numéricas (para obtener J)
% Idealmente es una fracción del rango significativo del parametro.
% Si el parametro k es un ángulo entre 0 y 180 delta(k) podría ser 1.
% Si el parámetro k oscila en [0,1] sería mejor usar delta(k)=0.1 o 0.01.
% Si no se especifica se toma la unidad delta(k)=1
%
% SALIDA: X = vector final de parametros que minimizan función f
%         fval = f(X), valores finales de la función f en X (m valores)



if nargin==2, alfa=0.5; delta=ones(size(X0)); end
if nargin==3, delta=ones(size(X0)); end


N=length(X0);  f0=f(X0);  
M = length(f0);


X=X0; dX=10;  

      
ff_X=f(X);  R0 = norm(ff_X);  % Función de coste en pto. inicial
   
   
% Estimación matriz Jacobiano usando derivadas numéricas
 J = zeros(M,N);  
 for k=1:N,   
   H=zeros(N,1); H(k)=delta(k);
   der=(f(X+H)-ff_X)/delta(k);        
   J(:,k)=der;
 end
    
   
% Determinación de la corrección a aplicar 
 dX = (J'*J)\ (J'*ff_X);
     
% Función de coste en el nuevo punto
 fval = f(X-dX);
 R1 = norm(fval);
   
   
 cont=0;
 while(R1>=R0)&&(cont<10)  % Backtracking si no se ha reducido la función de coste
   dX=dX*alfa;  
   fval = f(X-dX);
   R1 = norm(fval);           
  % fprintf('%.3f -> %.3f\n',R0,R1); pause      
   cont=cont+1;   
 end         
       
 X=X-dX; % Aplico correccion
 
 res=R1;


return