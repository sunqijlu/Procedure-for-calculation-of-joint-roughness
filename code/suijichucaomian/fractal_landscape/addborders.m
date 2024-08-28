function y = addborders(x)
y = zeros(size(x)+2);
y(2:end-1,2:end-1)=x;
end