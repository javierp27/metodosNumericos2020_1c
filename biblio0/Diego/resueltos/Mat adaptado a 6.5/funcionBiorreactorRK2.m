function [X,Y] = funcionBiorreactorRK2(h, tMax)
%Funci�n del modelado del biorreactor por Runge-Kutta 2

    X = (0:h:tMax);     %defino el vector X para el equispaciado entre elementos h, entre 0 y tMax
    n = length(X);      %cantidad de nodos del modelado
    
    f1 = @(y) 0.1 - 0.4.*y;     %Der. de la concentraci�n del reactivo
    y1 = 1;                     %Valor a tiempo 0
    
    Y = NaN(n,1);               %Prealocaci�n del vector Y

    Y(1) = y1;
        
    for i=1:n-1
        K1 = f1(Y(i));
        K2 = f1(Y(i) + h*alfa*K1);
        Y(i+1) = Y(i) + h*((1-(1/(2*alfa)))*K1 + (1/(2*alfa))*K2);
    end
    