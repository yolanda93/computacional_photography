function rgb=fc_yiq2rgb(yiq)
 
A = [0.299 0.587 0.114; 0.596 -0.274 -0.322; 0.211 -0.523 0.312];
iA = inv(A);

[N M s]=size(yiq);

if s~=3, 
    rgb=-1; fprintf('Input must have 3 color planes\n');
    return; 
end

I = reshape(yiq,N*M,3)';

I = A\I;

rgb = reshape(I',N,M,3);

% Corrects rounding error that might put the image outside [0,1]
%rgb=rgb+5*eps;
%rgb=rgb*0.999999;

M = max(max(max(rgb)));
m = min(min(min(rgb))); 
rgb = (rgb-m)/(M-m);

return