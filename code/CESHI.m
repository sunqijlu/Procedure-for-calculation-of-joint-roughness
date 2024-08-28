% 绘制不同视倾角的图
clear all
load('matlab.mat')
H=0.01;
X=(0.4:H:5.4)';
Y=(1.6:H:6.6)';
[X,Y]=meshgrid(X,Y);
x=joint(:,1);
y=joint(:,2);
z=joint(:,3);
Z=griddata(x,y,z,X,Y);

H=0.1;
a=0.75;
b=1.25;
X=(a:H:b)';
Y=(a:H:b)';

[X,Y]=meshgrid(X,Y);
Z=griddata(x,y,z,X,Y);

k=1;
for i=1:size(Z,1)
    for j=1:size(Z,1)
        x1(k,1)=X(1,i);
        y1(k,1)=Y(j,1);
        z1(k,1)=Z(i,j);
        k=k+1;
    end
end
Xb=[x1,y1,z1];
k=1;
for i=1:(size(X,1)-1)
    for j=1:(size(X,1)-1)
        DT(k,1)=(i-1)*size(X,1)+j;
        DT(k,2)=(i-1)*size(X,1)+j+1;
        DT(k,3)=(i-1)*size(X,1)+j+1+size(X,1);
        k=k+1;
    end
end
for i=1:(size(X,1)-1)
    for j=1:(size(X,1)-1)
        DT(k,1)=(i-1)*size(X,1)+j;
        DT(k,2)=(i-1)*size(X,1)+j+size(X,1);
        DT(k,3)=(i-1)*size(X,1)+j+1+size(X,1);
        k=k+1;
    end
end
TR = triangulation(DT,Xb);
F = incenter(TR);%
P= faceNormal(TR);%法向量

%求每个三角形的视倾角
k=1;
angle=(k-1)*2;
t=[cosd(angle),sind(angle),0];
n_0=[0,0,1];
for i=1:size(P,1)
    n=P(i,:);
    n_1=n-(n.*n_0).*n_0;
    cos_alpha=dot(t,n_1)/(norm(t)*norm(n_1));
    tan_theta=tan(acos(dot(n,n_0)/(norm(n)*norm(n_0))));
    c(i,1)=atand(-tan_theta*cos_alpha);
end
%求每个三角形面积
for i=1:size(DT,1)
    A=ZZ(DT(i,1),:);
    B=ZZ(DT(i,2),:);
    C=ZZ(DT(i,3),:);
    AB=B-A;
    BC=C-B;
    c(i,2)=1/2*norm(cross(AB,BC));  %取模
end
A_allarea=sum(c(:,2));
%求A0
A_0=0;
for i=1:size(c,1)
    if c(i,1)>0||c(i,1)==0
        A_0=A_0+c(i,2);
    end
end
A_0=A_0/A_allarea;
%求临界视倾角面积
A_1=0;
k=1;
for i=1:size(P,1)
    if c(i,1)>0
        C(k,:)=DT(i,:);
        A_1=A_1+c(i,2);
        k=k+1;
    end
end
A_1=A_1/A_allarea;
trisurf(DT,Xb(:,1),Xb(:,2),Xb(:,3),'FaceColor',[255,0,0]/255,'FaceAlpha',0.2,'LineWidth',0.1,'EdgeColor',[123,123,123]/255);%%%三角剖分后的三维可视图
hold on
% trisurf(C,Xb(:,1),Xb(:,2),Xb(:,3),'FaceColor',[255,255,0]/255,'FaceAlpha',0.6,'LineWidth',0.1,'EdgeColor',[255,255,0]/255);

% box off  % 去除上右边框刻度
% set(gca,'Visible','off');% %移除坐标轴边框
set(gcf,'color','w');% % 设置背景为白色
axis([0 2 0 2 -0.1 0.1]);
% axis equal
% set(gca,'xtick',0:1:2)
% set(gca,'ytick',0:1:2)
% set(gca,'ztick',-0.1:0.05:0.1)
set(gca,'FontSize',15,'LineWidth',3);
% hold on;
% A=[-0.2;-0.2;0.000534071];
% B=[2.2;-0.2;0.02617424];
% C=[2.2;2.2;0.021372494];
% D=[-0.2;2.2;-0.004267675];
% P = [B,A;C,D];
% X = P([1,4],:);
% Y = P([2,5],:);
% Z = P([3,6],:);
% h = surf(X,Y,Z);
% set(h,'FaceColor',[1,0,0],'FaceAlpha',0.3,'LineWidth',0.1,'EdgeColor',[1,0,0]);
