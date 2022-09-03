function [L, U] = lu_decomp_crout(A)
%A = [4 -1 3; -3 4 0; 2 -1 5];
A = [9 0 1 2; 1 8 1 1; -2 1 5 0; 3 1 0 6];
n = size(A, 1);
U = eye(n); L = zeros(n);

for j=1:n
    for i=j:n
        L(i,j) = A(i,j) - (L(i,1:j-1) * U(1:j-1,j));
    end
    for k=j+1:n
        U(j,k) = (A(j,k) - L(j,1:k-2) * U(1:k-2,k)) / L(j,j);
    end
end