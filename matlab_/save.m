xi = input("");
yi = input("");
teste = input("");

n = max(size(xi));
w = zeros(1, n);
wi = 1;
for k = 1 : n
    for i = 1 : n
       if(i ~= k)
           wi = wi * (xi(k) - xi(i));
       end
    end
    wi = 1/wi;
    w(k) = wi;
    wi = 1;
end

numerador = 0;
denominador = 0;
t = max(size(teste));
P = zeros(1,t);
exato = zeros(1, t);
for j  = 1 : t
    for k = 1 : n 
        numerador = numerador + yi(k) * w(k)/(teste(j)-xi(k));
        denominador = denominador + w(k)/(teste(j)-xi(k));
    end
    Px = numerador/denominador;
    P(j) = Px;
    exato(j) = sin(teste(j));
    numerador = 0;
    denominador = 0;
end

fprintf('Exato:\n')
fprintf(' %.4f',exato);
fprintf('\nInterpolado:\n');
fprintf(' %.4f',P);
fprintf('\nPesos:\n');
fprintf(' %.4f',w);