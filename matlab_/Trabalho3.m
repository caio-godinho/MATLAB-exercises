A = input("");
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

disp("L = ");
disp(L);
disp("U = ");
disp(U);