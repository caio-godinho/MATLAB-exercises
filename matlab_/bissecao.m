function x = bissecao(func,a,b,tol)
% [a,b]: intervalo com f(a)*f(b)<0
x = (a+b)/2;
erro = inf;
while erro>tol
    if func(a)*func(x) < 0
        b = x;
    else
        a = x;
    end
    x0 = x;
    x = (a+b)/2;
    erro = abs(x-x0);
end