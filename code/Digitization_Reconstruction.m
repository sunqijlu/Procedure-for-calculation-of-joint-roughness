%% 图5a的示意图
data=importdata('数据2.txt');
data_1=data(data(:,1)>=92&data(:,1)<=93,:);
data_2=data_1(data_1(:,2)>=-25&data_1(:,2)<=-24,:);
x=data_2(:,1);
y=data_2(:,2);
z=data_2(:,3);
plot3(x,y,z,'o','MarkerSize',4,'MarkerEdgeColor','k','MarkerFaceColor','r')
a=n(1,1);
b=n(2,1);
d=n(3,1);
A=[min(x),min(y),0];
B=[min(x),max(y),0];
C=[max(x),min(y),0];
D=[max(x),max(y),0];
A(1,3)=a*A(1,1)+b*A(1,2)+d;
B(1,3)=a*B(1,1)+b*B(1,2)+d;
C(1,3)=a*C(1,1)+b*C(1,2)+d;
D(1,3)=a*D(1,1)+b*D(1,2)+d;
hold on;
P = [A',B';C',D'];
X = P([1,4],:);
Y = P([2,5],:);
Z = P([3,6],:);
h = surf(X,Y,Z);
set(h,'FaceColor',[1,0,0],'FaceAlpha',0.5,'LineWidth',0.1,'EdgeColor',[1,1,1]);
set(gca,'FontSize',15,'LineWidth',3);
axis([92 93 -25 -24 27 29])
%% 图5b的示意图
data=importdata('数据2+锚点.txt');
n=nihe(data);
data_1=data(data(:,1)>=2.5&data(:,1)<=3.5,:);
data_2=data_1(data_1(:,2)>=3&data_1(:,2)<=4,:);
x=data_2(:,1);
y=data_2(:,2);
z=data_2(:,3);
plot3(x,y,z,'o','MarkerSize',4,'MarkerEdgeColor','k','MarkerFaceColor','r')
a=n(1,1);
b=n(2,1);
d=n(3,1);
A=[min(x),min(y),0];
B=[min(x),max(y),0];
C=[max(x),min(y),0];
D=[max(x),max(y),0];
A(1,3)=a*A(1,1)+b*A(1,2)+d;
B(1,3)=a*B(1,1)+b*B(1,2)+d;
C(1,3)=a*C(1,1)+b*C(1,2)+d;
D(1,3)=a*D(1,1)+b*D(1,2)+d;
hold on;
P = [A',B';C',D'];
X = P([1,4],:);
Y = P([2,5],:);
Z = P([3,6],:);
h = surf(X,Y,Z);
set(h,'FaceColor',[1,0,0],'FaceAlpha',0.5,'LineWidth',0.1,'EdgeColor',[1,1,1]);
set(gca,'FontSize',15,'LineWidth',3);
axis([2.5 3.5 3 4 -0.5 0.5])
%% 图5c的示意图
% n=nihe(data);
% data_1=data(data(:,1)>=2.5&data(:,1)<=3.5,:);
% data_2=data_1(data_1(:,2)>=3&data_1(:,2)<=4,:);
% x=data_2(:,1);
% y=data_2(:,2);
% z=data_2(:,3);
plot3(x,y,z,'o','MarkerSize',4,'MarkerEdgeColor','k','MarkerFaceColor','r')
hold on
[xq,yq] = meshgrid(2.5:.05:3.5, 3:.05:4);
zq = griddata(x,y,z,xq,yq);
h = surf(xq,yq,zq);
set(h,'FaceColor',[1,0,0],'FaceAlpha',0.3,'LineWidth',0.1,'EdgeColor',[0.6,0.6,0.6]);
set(gca,'FontSize',15,'LineWidth',3);
axis([2.5 3.5 3 4 -0.25 0.25])
zz=ones(size(xq,1),size(xq,1))*-0.25;
g = surf(xq,yq,zz);
set(g,'FaceColor',[1,0,0],'FaceAlpha',0,'LineWidth',0.1,'EdgeColor',[0.4,0.4,0.4]);
set(gca,'FontSize',15,'LineWidth',3);
%% 图5d的示意图
zq(find(isnan(zq)==1)) = 0;
joint_3(:,:,1)=xq;
joint_3(:,:,2)=yq;
joint_3(:,:,3)=zq;
joint_2=reshape(joint_3,[size(joint_3,1)*size(joint_3,1),3]);
jx=joint_2(:,1);
jy=joint_2(:,2);
jz=joint_2(:,3);
Xb=[jx,jy,jz];
DT=delaunayTriangulation(jx,jy);%重复点最少
T=DT.ConnectivityList;%三角形顶点索引矩阵
TR = triangulation(T,Xb);
F = incenter(TR);%
P= faceNormal(TR);%法向量
trisurf(T,Xb(:,1),Xb(:,2),Xb(:,3),'FaceColor',[1,0,0],'FaceAlpha',0.3,'LineWidth',0.1,'EdgeColor',[0.4,0.4,0.4]);%%%三角剖分后的三维可视图
axis([2.5 3.5 3 4 -0.25 0.25])
set(gca,'FontSize',15,'LineWidth',3);
hold on
plot3(jx,jy,jz,'o','MarkerSize',3,'MarkerEdgeColor','k','MarkerFaceColor','r')
