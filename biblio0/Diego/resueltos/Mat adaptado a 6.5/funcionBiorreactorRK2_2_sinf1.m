function [Y] = funcionBiorreactorRK2_2_sinf1(X)
%Funci�n del modelado del biorreactor por Runge-Kutta 2

    n = length(X);      %cantidad de nodos del modelado
    h = X(2) - X(1);
    
    f1 = @(y) 0.1 - 0.4.*y;     %Der. de la concentraci�n del reactivo
    y1 = 1;                     %Valor a tiempo 0
    
    Y = NaN(n,1);               %Prealocaci�n del vector Y

    Y(1) = y1;
        
    for i=1:n-1
        K1 = (0.1 - 0.4.*Y(i));
        K2 = (0.1 - 0.4.*(Y(i) + h*K1));
        Y(i+1) = Y(i) + h*((1-(1/(2)))*K1 + (1/(2))*K2);
    end
    