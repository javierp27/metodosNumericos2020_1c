function [ lambda ] = potenciaInversaParaTridiag( A, tol, Nmax )
%Retorna el menor autovalor de la matriz A tridiagonal definida positiva
    [n,noSeUsa] = size(A);
    x = rand(n,1);
    k = 0;
    
    
    [L,U] = algoritmoThomas(A);
    y = x/norm(x);
    z = algoritmoDescenso(L,y);
    x = algoritmoRemonte(U,z);
    lambda = transpose(y)*x;
    err = tol*abs(lambda) + 1;
    
    while (err > tol*abs(lambda)) && (abs(lambda) > 0) && (k <= Nmax)
        y = x/norm(x);
        z = algoritmoDescenso(L,y);
        x = algoritmoRemonte(U,z);
        lambda2 = transpose(y)*x;
        err = abs(lambda2 - lambda);
        lambda = lambda2;
        k = k+1;
    end
    if k > Nmax
        error('Nro. de iteraciones m�ximo alcanzado')
    end
    fprintf('Nro. de iteraciones %d \n', k);
    lambda = 1/lambda;
end
