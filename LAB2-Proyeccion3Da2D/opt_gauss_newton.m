function [X fval]=opt_gauss_newton(f,X0,alfa,delta)
% Busqueda del m�nimo de ||f|| siguiendo el m�todo de Gauss-Newton.
% X0 = vector de partida = vector de N parametros
% La funci�n f es una funci�n R^N -> R^M
% El algoritmo trata de hallar X tal que minimize ||f(X)||
% Basado en la iteraci�n de Newton-Raphson: el siguiente punto 
% de la sucesi�n lo calcula como:
%
% dX = inv(J`J)*(J'*f(X));  X' = X - dX
%
%  J es la matriz Jacobiamo (J)ij = dfi/dXj
%  No hace falta suministrarla: se aproxima num�ricamente.
% 
% Antes de aceptar la correcci�n dX comprueba si ||f(X-dX)|| < ||f(X)||
% De no ser as� hace un backtracking a lo largo de la l�nea dada por dX:
%     X - alfa*dX, X-alfa*alfa*dX, etc. 
% Solo cuando la funci�n de coste se reduce se acepta el paso.
% alfa es opcional. Si no se da se usa alfa=0.5
% 
% El �ltimo argumento delta tambi�n es opcional. Es un vector del mismo 
% tama�o que X (N = n�mero de parametros). Indica que salto usar para cada
% par�metro al calcular las derivadas num�ricas (para obtener J)
% Idealmente es una fracci�n del rango significativo del parametro.
% Si el parametro k es un �ngulo entre 0 y 180 delta(k) podr�a ser 1.
% Si el par�metro k oscila en [0,1] ser�a mejor usar delta(k)=0.1 o 0.01.
% Si no se especifica se toma la unidad delta(k)=1
%
% SALIDA: X = vector final de parametros que minimizan funci�n f
%         fval = f(X), valores finales de la funci�n f en X (m valores)



if nargin==2, alfa=0.5; delta=ones(size(X0)); end
if nargin==3, delta=ones(size(X0)); end


N=length(X0);  f0=f(X0);  
M = length(f0);


X=X0; dX=10;  

      
ff_X=f(X);  R0 = norm(ff_X);  % Funci�n de coste en pto. inicial
   
   
% Estimaci�n matriz Jacobiano usando derivadas num�ricas
 J = zeros(M,N);  
 for k=1:N,   
   H=zeros(N,1); H(k)=delta(k);
   der=(f(X+H)-ff_X)/delta(k);        
   J(:,k)=der;
 end
    
   
% Determinaci�n de la correcci�n a aplicar 
 dX = (J'*J)\ (J'*ff_X);
     
% Funci�n de coste en el nuevo punto
 fval = f(X-dX);
 R1 = norm(fval);
   
   
 cont=0;
 while(R1>=R0)&&(cont<10)  % Backtracking si no se ha reducido la funci�n de coste
   dX=dX*alfa;  
   fval = f(X-dX);
   R1 = norm(fval);           
  % fprintf('%.3f -> %.3f\n',R0,R1); pause      
   cont=cont+1;   
 end         
       
 X=X-dX; % Aplico correccion
 
 res=R1;


return