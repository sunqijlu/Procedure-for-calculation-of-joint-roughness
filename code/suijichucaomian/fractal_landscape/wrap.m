function y=wrap(x)
y = x;
y(:,1)   = x(:,end-2); 
y(:,end) = x(:,3)    ; 
y(1,:)   = x(end-2,:);
y(end,:) = x(:,3)    ;
end
