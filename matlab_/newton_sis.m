function [x0,k] = newton_sis(F,Jac,x0,tol,kmax)
% F: funcao vetorial
% Jac: Jacobiano de F
% x: chute inicial (vetor coluna)
if nargin == 4
    kmax = 1000;
end
for k=1:kmax
    v = Jac(x0(1), x0(2), x0(3))\F(x0(1), x0(2), x0(3));
    %v = Jac(x)\F(x);
    x0 = x0 - v;
    
    if norm(v) < tol
        return;
    end
end