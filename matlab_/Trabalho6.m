A = input("");
n = size(A,1);
B = zeros(n,1);

for i = 1:n
    if (i==1)
        soma = sum(abs(A-diag(diag(A))),2);%Soma elementos da linha, exceto aquele que pertence a diagonal principal
        B(i) = soma(i)/A(i,i);

    else
        Soma = abs(A(i,1:i-1))*B(1:i-1);
        if (n~=i)
            Soma = Soma + abs(A(i,i+1:n))*ones(n-i,1);
        end
        B(i) = Soma/A(i,i);
    end
end

if(max(B)<1) 
    disp("SATISFAZ");
else
    disp("NÃO SATISFAZ");
end