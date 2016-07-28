%ejercicio 3
c=[0.75;0.75;1.0];
R(1:2:end,1:2:end) = R(1:2:end,1:2:end).*c(1);
G(1:1:end,2:2:end) = G(1:1:end,2:2:end).*c(2);
B(2:2:end,2:2:end) = B(2:2:end,2:2:end).*c(3);
