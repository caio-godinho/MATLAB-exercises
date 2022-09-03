x0 = input("");
m = input("");
s = input("");
A = zeros(size(m, 1));

for i = 1:size(s, 1)
    A(i+1, i) = s(i);
end
for j = 1:size(m, 1)
    A(1, j) = m(j);
end

k = 0; erro = inf;
n = size(A,1);

while (erro>1e-6)
    y = A*x0;
    x = y/norm(y);
    erro = abs(abs(x0'*x)-1);
    x0 = x; k = k+1;
end

lambda = x'*A*x;

disp('x = ');
disp(x);
fprintf('k = %d',k);