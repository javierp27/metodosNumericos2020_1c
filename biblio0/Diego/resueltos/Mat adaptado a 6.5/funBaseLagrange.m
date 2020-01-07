function [ L ] = funBaseLagrange(n,X1,i,X2)
%Realiza la funci�n base del polinomio de Lagrange para interpolaci�n.
    L = 1;
    for j=1:n
        if j~=i
            L = L*((X2 - X1(j))/(X1(i) - X1(j)));
        end
    end
end

