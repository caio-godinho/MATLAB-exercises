A = input("");
b = input("");
x1 = input("");
tol = input("");
n = size(A,1);
D = diag(diag(A));
C = eye(n)-D\A;
g = D\b;
k = 0;
erro_relativo;
x0;

while 1
    k = k + 1;
    x0 = x1;
    x1 = C*x0+g;
    erro_relativo = norm(x1-x0)/norm(x1);
    if(erro_relativo<tol)
        break
    end
end

fprintf("k = %d\n",k);
disp("x = ");
disp(x1);