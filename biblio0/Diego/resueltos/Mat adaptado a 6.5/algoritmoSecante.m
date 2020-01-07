function [ x ] = algoritmoSecante( funcionDeX, a, b, Tol, NMax )
%Aproxima la ra�z separada presente en el intervalo (a,b) de la funci�n de x por el m�todo de la
%secante

    k = 1;

    if not(funcionDeX(a)* funcionDeX(b) < 0)
        error('No hay cambio de signo entre los extremos del intervalo (a,b)');
    end

    I = b - a;

    while (abs(I) > Tol) && (k <= NMax)

        x = a - ((b - a)/(funcionDeX(b) - funcionDeX(a))) * funcionDeX(a);
        
        if funcionDeX(a)* funcionDeX(x) < 0
            b = x;
        elseif funcionDeX(b)* funcionDeX(x) < 0
            a = x;
        else
            a = x;
            b = x;                    
        end

        I = b - a;
        k = k + 1;

    end

    if k > NMax
        %fprintf('x al momento del corte: %f \n', x);
        error('N�mero de iteraciones m�ximo alcanzado');
    else
        fprintf('Nro de iteraciones: %d \n', k);
    end
end

