syms x    %declaramos a X una variable simb�lica
Y=x*x*x-9;  %se solicita la entrada de la funci�n

n=50;

%graficamos la funci�n en un intervalo para poder tomar una buena
%estimaci�n de la ra�z
sup = 10;
in = -10;
t = linspace(in,sup,500);    %generamos un vector con los valores
plot(t,subs(Y,t))               %generamos la gr�fica
grid on

xn(1)= 0;
xn(2)= 5;
for i=2:n-2
cosos =  (xn(i) - xn(i-1)) / ( subs(Y,xn(i))-subs(Y,xn(i-1)));    
coso = cosos*subs(Y,xn(i));
xn(i+1)= xn(i) - coso;  
    
end