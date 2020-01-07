function [ x ] = algoritmoJacobi( A , b , x, Tol, itMax)
%Realiza iteraciones de la forma Jacobi sobre la matriz A y su vector solucion b
%Recibe adem�s los par�metros x: vector inicial, itMax: iteraciones m�ximas permitidas
%y Tol: la tolerancia deseada.
    k = 1;
    r = b - A*x;
    Tol2 = Tol*norm(b);
    D = diag(A);
    
    while (k <= itMax) && (norm(r) > Tol2)
        z = r./D; % ' ./ ' , ' .* ' , ' .^ ', operaciones en vectores de igual tama�o miembro a miembro. grande matlab
        x = x + z;
        r = b - A*x;
        k = k + 1;
        if(k == itMax)
            error('Nro max de iteraciones alcanzados')
        end
    end
    fprintf('Nro de iteraciones: %d \n', k);
end