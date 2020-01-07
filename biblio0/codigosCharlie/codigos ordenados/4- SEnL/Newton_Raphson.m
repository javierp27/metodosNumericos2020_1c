
function [X1] = Newton_Raphson()

syms x    %declaramos a X una variable simb�lica
Y=x*x*x-9;  %se solicita la entrada de la funci�n



%graficamos la funci�n en un intervalo para poder tomar una buena
%estimaci�n de la ra�z
sup = 10;
in = -10;
t = linspace(in,sup,500);    %generamos un vector con los valores
plot(t,subs(Y,t))               %generamos la gr�fica
grid on


Xn=1;    %se solicita la estimaci�n inicial
Ydx = diff(Y,x);   %derivamos la funcion Y con respecto a X y lo asignamos a la variable Ydx

%inicializar varibles
error = 1;
tolerancia = 0.000001;
n=10;
i=2;
    while error>=tolerancia && i<n    %condici�n de terminaci�n cuando el error sea menor a la tolerancia 
         
         X1 = Xn - (subs(Y,Xn)/subs(Ydx,Xn));  %formula de Newton-Raphson
         error = abs((X1-Xn)/X1);              %calculo del error
         Xn=X1;  %asignaci�n del nuevo valor de Xn para la siguiente iteraci�n
         i=i+1;
    end
Xn=double(Xn);
    
end


