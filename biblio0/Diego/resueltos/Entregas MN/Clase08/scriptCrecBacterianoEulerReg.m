%Script del modelado del biorreactor por Euler regresivo

    clc
    clear all
    
    %freg = @(y) 4.*h.*y^2./30 + (1 - 4.*h) .* y - yPrev; %Ec. implicita del modelo de crec. bacteriano
    y1 = 1e-4;                                          %Valor a tiempo 0
    n = 3000;                                           %Cantidad de nodos del modelado
    tol = 1e-6;                                         %tolerancia de corte de la bisecci�n
    nMax = 1e6;                                         %n�mero m�ximo de iteraciones de la bisecci�n
    
    X = NaN(n,1);               %Prealocaci�n del vector X
    Y = NaN(n,1);               %Prealocaci�n del vector Y
    tMax = 10;                  %Tiempo m�ximo del modelado
    
    for i=1:n
        X(i) = (i-1)*tMax /(n-1);
    end

    h = X(2) - X(1);  
    Y(1) = y1;
        
    for i=1:n-1
        freg = @(y) 4.*h.*y^2./30 + (1 - 4.*h) .* y - Y(i);
        Y(i+1) = algoritmoBiseccion(freg, y1, 30, tol, nMax);
    end
    
    plot(X,Y);