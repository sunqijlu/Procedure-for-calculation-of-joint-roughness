%% 
clear all
joint=load('D:\桌面\小论文\小论文数据\最终旋转平移后数据\数据34+锚点+旋转+最终.txt');
a=size(joint,1);
joint(a-2:a,:)=[];
joint(:,1)=joint(:,1)-min(joint(:,1));
joint(:,2)=joint(:,2)-min(joint(:,2));
x=joint(:,1);
y=joint(:,2);
z=joint(:,3);
a=  2  ;
b=  4  ;
c=  3  ;
d=  5  ;
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
save joint_45.mat
%% 


x=0;
y=0;
X=(0:0.002:L)';
Y=(0:0.002:L)';
[X,Y]=meshgrid(X,Y);
for j=1:2:size(joint,1)
    x=x+1;
    for k=1:2:size(joint,1)
        y=y+1;
        Z_rescon(x,y)=Z(j,k);
    end
end