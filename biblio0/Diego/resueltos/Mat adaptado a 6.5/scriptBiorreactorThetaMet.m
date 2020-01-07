%Script del modelado del biorreactor por Theta-m�todo

    clc
    clear all

    fc = @(t) 1/4 + (3/4)*exp(-0.4*t);
    
    f1 = @(y) 0.1 - 0.4.*y;     %Der. de la concentraci�n del reactivo
    y1 = 1;                     %Valor a tiempo 0
    n = 5;                      %Cantidad de nodos del modelado
    theta = 1;
    
    X = NaN(n,1);               %Prealocaci�n del vector X
    Y = NaN(n,1);               %Prealocaci�n del vector Y
    tMax = 30;                  %Tiempo m�ximo del modelado
    
    for i=1:n
        X(i) = (i-1)*tMax /(n-1);
    end

    h = X(2) - X(1);  
    Y(1) = y1;
    A = 0.1;
    B = 0.4;
        
    for i=1:n-1
        Y(i+1) = (Y(i) + h*theta*f1(Y(i)) + h*A - h*theta*A)/(1 + h*B - h*theta*B);
    end
    
    plot(X,Y);
    %fplot(fc, [0 30]);