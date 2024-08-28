function y = nihe(t)
% 结构面拟合求ABCD AX+BY-Z+D=0 法向量（-A,-B,1)  y=(A,B,D);
X=t(:,1);
Y=t(:,2);
Z=t(:,3);
K=[X,Y,ones(size(t,1),1)];
y=inv(K'*K)*K'*Z;
end