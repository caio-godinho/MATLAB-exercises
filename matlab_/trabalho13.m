x = input("");
y = input("");
n = length(x);
Xp = vander(x);

for k=1:3
    error = 0;
    X = Xp(:,n-k:n);
    [Q,R] = qr(X);
    a = (R\(Q'*y'))';
    P = polyval(a,x);
    
    for i=1:n
        error = error + (y(i) - P(i))^2;
    end

    fprintf('Polinômio de grau %.0f', k);
    fprintf('\n-> Coeficientes:');
    fprintf(' %.4f',a);
    fprintf('\n-> Aproximações:');
    fprintf(' %.4f',P);
    fprintf('\n-> Erro de truncamento:');
    fprintf(' %.4f\n\n',error);
end


