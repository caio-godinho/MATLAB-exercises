f = input("");
x = input("");
N = input("");

a = x(1);
b = x(2);
h = norm(x(2)-x(1))/N;
res = 0;

for i = 0 : N-1
    res = res + f(x(1)+i*h) + 3*f(x(1)+(i+1/3)*h) + 3*f(x(1)+(i+2/3)*h) + f(x(1)+(i+1)*h);
end

fprintf('%.9f', (3*res)/(24*(1/h)));