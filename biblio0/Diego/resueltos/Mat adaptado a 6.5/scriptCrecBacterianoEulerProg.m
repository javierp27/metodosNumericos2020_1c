%Script del modelado del crecimiento de bacterias por Euler progresivo

    clc
    clear all
    
    f1 = @(y) 4.*y .* (1 - y./30);      %Der. de la concentraci�n del reactivo
    y1 = 1e-4;                          %Valor a tiempo 0
    n = 100000;                         %Cantidad de nodos del modelado
    
    X = NaN(n,1);                       %Prealocaci�n del vector X
    Y = NaN(n,1);                       %Prealocaci�n del vector Y
    tMax = 10;                          %Tiempo m�ximo del modelado
    
    for i=1:n
        X(i) = (i-1)*tMax /(n-1);
    end

    h = X(2) - X(1);  
    Y(1) = y1;
        
    for i=1:n-1
        Y(i+1) = Y(i) + h*f1(Y(i));
    end
    
    plot(X,Y);