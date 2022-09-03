h = input("");

f = @(x,y) -2*x*y;

tam = 1 + 1/h;
y = size(tam, 1);
x = size(tam, 1);
y(1) = 1; x(1) = 0;
y(2) = y(1) +  h*f(x(1),y(1));
x(2) = x(1) + h;

for i = h*2 : h : 1
    pos = 1 + i/h;
    y(pos) = y(pos-2) + 2*h*f(x(pos-1),y(pos-1));
    x(pos) = i;
end

exata = exp(-x.^2);
erro = abs(exata - y);

fprintf("Pontos:\n"); fprintf(" %.6f", x);
fprintf("\n\nSolução exata:\n"); fprintf(" %.6f", exata);
fprintf("\n\nSolução aproximada:\n"); fprintf(" %.6f", y);
fprintf("\n\nErro:\n"); fprintf(" %.6f", erro);