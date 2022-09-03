h = input("");

f = @(x,y) -2*x*y; %Derivada de y

tam = 1 + 1/h; %Numero de pontos
func = size(tam, 1); %Vetor com valores de y pelo metodo de euler
pontos = size(tam, 1); %Vetor com pontos

func(1) = 1;
pontos(1) = 0;
pos = 2;

for i = 0 : h : (1-h)
    func(pos) = func(pos-1) + h*f(i, func(pos-1));
    pontos(pos) = i+h;
    pos = pos+1;
end

exata = exp(-pontos.^2); %Solucao exata
erro = abs(exata - func); %Erro

fprintf("Pontos:\n"); fprintf(" %.6f", pontos);
fprintf("\n\nSolução exata:\n"); fprintf(" %.6f", exata);
fprintf("\n\nSolução aproximada:\n"); fprintf(" %.6f", func);
fprintf("\n\nErro:\n"); fprintf(" %.6f", erro);