function y = centerofsquares(x,ran,step,maxstep)
n=size(x,1);
y = x;
for i=3:2:n-2
    for j=3:2:n-2
        y(i,j) = (y(i-1,j-1)+y(i+1,j+1)+y(i+1,j-1)+y(i-1,j+1))*0.25 + ran*normrnd(0,1);
        showit(removeborders(y),step,maxstep,i,n-2,'Square ');
    end
end
end
