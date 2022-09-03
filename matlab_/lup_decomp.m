%function [L,U,P] = lup_decomp(A)
% A: matriz nao-singular
% L, U: matrizes triang. inf. e sup., respectivamente
% P: matriz de permutacao
A = input("");
n = size(A,1);
P = eye(n); L = P; U = A;
Pk = P;
Mk = P;
for j=1:n
    Pk(:,:,j) = P;
    Mk(:,:,j) = P;
end
for k=1:n
    [~,p] = max(abs(U(k:n,k)));
    p = p+(k-1);
    P([k p],:) = P([p k],:);
    Pk([k p],:,k) = Pk([p k], :, k);
    U([k p],k:n) = U([p k],k:n);
    L([k p],1:k-1) = L([p k],1:k-1);
    for i=k+1:n
        L(i,k) = U(i,k)/U(k,k);
        Mk(i,k,k) = -L(i,k);
        U(i,k:n) = U(i,k:n) - L(i,k)*U(k,k:n);
    end
end

Inv_A = A\eye(n);

fprintf("inv(A) =\n");
disp(Inv_A);
fprintf("L =\n");
disp(L);
fprintf("U =\n");
disp(U);
fprintf("P =\n");
disp(P);
for k=1:size(A,1)-1
  fprintf("P%d =\n",k);
  disp(Pk(:,:,k)); % Pk deve conter todas as matrizes de permutação
end
for k=1:size(A,1)-1
  fprintf("M%d =\n",k);
  disp(Mk(:,:,k)); % Mk deve conter todas as matrizes de eliminação
end