% 点到拟合平面的距离
a=4;
aa=ones(a,1);
L=[x(floor(linspace(1,611,a)),1),y(floor(linspace(1,611,a)),1),aa];
Fa(1,1:3)=(inv(L'*L)*L'*z(floor(linspace(1,611,a)),1))';
Fa(1,4)=1;
Fa(1,4)=Fa(1,3);
Fa(1,3)=-1;
x_1=1;
y_1=1;
z_1=Fa(1,1)*x_1+Fa(1,2)*y_1+Fa(1,4);
D(:,1)=x;
D(:,2)=y;
D(:,3)=z;
for i=1:size(x,1)
    A(1,1)=x(i,1)-x_1;
    A(1,2)=y(i,1)-y_1;
    A(1,3)=z(i,1)-z_1;
    B(1,1:3)=Fa(1,1:3);
    aaa=dot(A,B);
    a=Fa(1,1);
    b=Fa(1,2);
    c=Fa(1,3);
    d=Fa(1,4);
    if aaa>0||aaa==0
        D(i,4)=abs(a*x(i,1)+b*y(i,1)+c*z(i,1)+d)/sqrt(a^2+b^2+c^2);
    else
        D(i,4)=-abs(a*x(i,1)+b*y(i,1)+c*z(i,1)+d)/sqrt(a^2+b^2+c^2);
    end
end
% 进行网格化  mesh
a= MSS(x,y,z);


