


%seed fixed, then you always will get the same result
rng(1.058)

%tollerance for the iteration
tol=1E-10;

%% Definition of the matrix
%note that this is one option to define de matrix for THIS example
%this is a matrix of the form
 %| 2 -1  0  0  0 |
 %|-1  2 -1  0  0 |
 %| 0 -1  2 -1  0 |
 %| 0  0 -1  2 -1 |
 %| 0  0  0 -1  2 |
%of the size defined in n

n= 500; %size 


S1 = sparse([1:n], [1:n], 2*ones(1,n), n, n);
S2 = sparse([1:n-1], [2:n], -1*ones(1,n-1), n, n);
S3 = sparse([2:n], [1:n-1], -1*ones(1,n-1), n, n);
A = full(S1 + S2 + S3);% Si se quiere la matriz llena

%% Definition of the vector B
b = ones (1,n)/(n + 1)^2;

%%
r=zeros(n,1);
x=rand(n,1); %initial condition
b=b';


r=b-A*x; %the error between members

k=0; %number of iteration
d=r;

alfa=(transpose(d)*r)/(transpose(d)*A*d); %calculate alfa

x=x+alfa*d; % recalculate X
 

%repeat
r1=r;
r=b-A*x;

while(norm(r)>tol && k<n) % lo del k es para que corte si tarda mucho
    k=k+1;
    bet=(norm (r)^2)/(norm (r1)^2); %calculate beta

    d=r+bet*d;
    alfa=(transpose(d)*r)/(transpose(d)*A*d); %calculate alfa
    x=x+alfa*d;
    r1=r;
    r=b-A*x;
end



norm(A*x-b)




% 
% % Resolucion de las ralas
% for n=1:20
%     S1 = sparse([1:n], [1:n], 2*ones(1,n), n, n, 0);
%     S2 = sparse([1:n-1], [2:n], -1*ones(1,n-1), n, n, 0);
%     S3 = sparse([2:n], [1:n-1], -1*ones(1,n-1), n, n, 0);
%     A = S1 + S2 + S3; % Si se quiere la matriz en formato RALO
%     b = ones (1,n)/(n + 1)^2; % Para generar el vector segundo miembro
%     r=zeros(n,1);
%     x=rand(n,1);
%     b=b';
% 
% 
%     t1=time();
%     r=b-A*x;
% 
%     k=0;
%     d=r;
%     alfa=(transpose(d)*r)/(transpose(d)*A*d);
%     x=x+alfa*d;
%     r1=r;
%     r=b-A*x;
% 
%     while(norm(r)>tol && k<n) % lo del k es para que corte si tarda mucho
%         k=k+1;
%         bet=(norm (r)^2)/(norm (r1)^2);
%         d=r+bet*d;
%         alfa=(transpose(d)*r)/(transpose(d)*A*d);
%         x=x+alfa*d;
%         r1=r;
%         r=b-A*x;
%     end
% 
%     t2=time();
%     Tral(n)=t2-t1;
%     it_ral(n)=k;
% end
% q(:,1)=Tllen;
% q(:,2)=Tral;
% %save Datos3P4E2.dat q;
% 
% 

