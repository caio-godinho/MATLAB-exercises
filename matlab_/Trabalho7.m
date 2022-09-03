A = input("");
erro_tol = input("");

n = size(A,1);
V = eye(n);
k = 0;
erro = 1000;
off = 0;

while erro_tol<erro
    [Q,R] = mgs(A);
    A = R*Q;
    V = V*Q;
    erro = sqrt(norm(A, "fro")^2 - sum(diag(A.^2)));
    if k == 0
        off = erro;
    else
        off = [off ; erro]; 
    end
    k = k+1;
end

D = sort(diag(A),'descend');
disp('D = ');
disp(D); % a variável D deve ser um vetor coluna que contém os autovalores em ordem decrescente
fprintf('k = %d\n',k)
disp('erros = ');
disp(off);  % a variável erros deve ser um vetor coluna