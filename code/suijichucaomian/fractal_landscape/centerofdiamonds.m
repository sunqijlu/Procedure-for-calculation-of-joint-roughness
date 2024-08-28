function y = centerofdiamonds(x,ran,step,maxstep);
n=size(x,1);
y = x;
for i=2:1:n-1
    for j=3-mod(i,2):2:n-1
        y(i,j) = (y(i-1,j)+y(i+1,j)+y(i,j-1)+y(i,j+1))*0.25+ran*normrnd(0,1);
        showit(removeborders(y),step,maxstep,i,n-1,'Diamond');
    end
end
end