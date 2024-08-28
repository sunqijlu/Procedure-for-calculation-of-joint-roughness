function y = enlarge(x)
n = size(x,1);
y = zeros(2*n-3,2*n-3);
for i=2:n-1
    for j=2:n-1
        y(2*i-2,2*j-2)=x(i,j);
    end
end
end
