Fa=[];
a=ones(4,1);
for i=1:10000
    ID=randperm(size(x,1),4) ;
    ID_1=ID(1,1);
    ID_2=ID(1,2);
    ID_3=ID(1,3);
    ID_4=ID(1,4);
    x_1=[x(ID_1);x(ID_2);x(ID_3);x(ID_4);];
    y_1=[y(ID_1);y(ID_2);y(ID_3);y(ID_4);];
    z_1=[z(ID_1);z(ID_2);z(ID_3);z(ID_4);];
    L=[x_1,y_1,a];
    Fa(i,1:3)=(inv(L'*L)*L'*z_1)';%求点云的拟平面的A B D
    Fa(i,4)=1;
    Fa(i,4)=Fa(i,3);
    Fa(i,3)=-1;%拟平面的法向量
end

a=ones(size(x,1),1);
L=[x,y,a];
Fa(1,1:3)=(inv(L'*L)*L'*z)';
Fa(1,4)=1;
Fa(1,4)=Fa(1,3);
Fa(1,3)=-1;