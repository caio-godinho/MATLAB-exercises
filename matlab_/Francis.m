function [V,D] = Francis(A,tol)
n = size(A,1);
V = eye(n);
erro = inf;
while erro>tol
    [Q,R] = mgs(A);
    A = R*Q;
    V = V*Q;
    erro = max(max(abs(tril(A,-1))));
end
D = diag(A);
disp(D);