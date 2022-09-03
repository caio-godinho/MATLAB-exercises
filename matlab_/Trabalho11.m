%{
xi = input("");
yi = input("");
teste = input("");
%}
xi = [0.0000 0.7854 1.5708 2.3562 3.1416];
yi = [0.0000 0.7071 1.0000 0.7071 0.0000];
teste = [0.0000 0.3491 0.6981 1.0472 1.3963 1.7453 2.0944 2.4435 2.7925 3.1416];


n = max(size(xi));
w = zeros(1, n);
wi = 1;
for k = 1 : n
    for i = 1 : n
       if(i ~= k)
           wi = wi * (xi(k) - xi(i));
       end
    end
    wi = wi^-1;
    w(k) = wi;
    wi = 1;
end

numerador = 0;
denominador = 0;
Px = 0;
igual = 0;
t = max(size(teste));
P = zeros(1,t);
exato = zeros(1, t);
for j  = 1 : t
    for k = 1 : n
        if(teste(j) == xi(k))
             igual = 1;
             P(j) = yi(k);
             break;
        end
        numerador = numerador + yi(k) * w(k)/(teste(j)-xi(k));
        denominador = denominador + w(k)/(teste(j)-xi(k));
    end
    if(denominador ~= 0 && igual == 0)
        Px = numerador/denominador;
        P(j) = Px;
    end
    exato(j) = sin(teste(j));
    numerador = 0;
    denominador = 0;
    igual = 0;
end

fprintf('Exato:\n')
fprintf(' %.4f',exato);
fprintf('\nInterpolado:\n');
fprintf(' %.4f',P);
fprintf('\nPesos:\n');
fprintf(' %.4f',w);