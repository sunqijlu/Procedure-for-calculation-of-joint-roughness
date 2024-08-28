function y = diamond_square_algorithm(x,ran,step,maxstep)

x = addborders(x);
y = enlarge(x);
y = centerofsquares(y,ran,step,maxstep);
y = wrap(y);
y = centerofdiamonds(y,ran,step,maxstep);
y = removeborders(y);

end