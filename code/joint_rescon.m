%% 结构面重构算法
clear all
joint=load('D:\桌面\小论文\小论文数据\最终旋转平移后数据\数据12+锚点+旋转+最终.txt');
a=size(joint,1);
joint(a-2:a,:)=[];
joint(:,1)=joint(:,1)-min(joint(:,1));
joint(:,2)=joint(:,2)-min(joint(:,2));
x=joint(:,1);
y=joint(:,2);
z=joint(:,3);
a= 3.2 ;
b= 6.2 ;
c= 1.3 ;
d= 4.3 ;
X=(a:0.001:b)';
Y=(c:0.001:d)';
[X,Y]=meshgrid(X,Y);
Z_rescon=griddata(x,y,z,X,Y,'cubic');
X=(0:0.001:(b-a))';
Y=(0:0.001:(d-c))';
[X,Y]=meshgrid(X,Y);
joint_1(:,:,1)=X;
joint_1(:,:,2)=Y;
joint_1(:,:,3)=Z_rescon;
save joint_16.mat