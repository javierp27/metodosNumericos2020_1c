function [ Mat1 ] = pivotEntreFilas2( Mat1, fila1, fila2 )
	%Retorna la matriz resultante de pivotar las filas fila1 y fila2 de Mat1
    [n,noSeUsa2] = size(Mat1);
    P = eye(n,n);
    P(fila2,fila2) = 0;
	P(fila1,fila1) = 0;
	P(fila1,fila2) = 1;
	P(fila2,fila1) = 1;
	Mat1 = Mat1*P;  %No es la matriz buscada. Ser�a P*Mat1
end
