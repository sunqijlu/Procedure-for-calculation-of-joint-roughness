clear; %清除工作空间的所有变量，函数，和MEX文件
clc;%清除命令窗口的内容
close;

% figure(1)
% %%优势倾向示意图
% % color=[144,170,235;235,192,89;235,124,120;235,192,89;235,124,120];
% % color=[255, 236, 92;235,124,120;235,124,120;235,124,120;235,124,120];
% color=[255, 236, 92;255, 236, 92;255, 236, 92;235,124,120;235,124,120];
% % tend=[0,90,180,270];
% global Rmax
% Rmax=0.1;
% slope1=importdata(strcat('E:\桌面文件\滑动面搜索\TEST_2月22日\察达分区_test\chada_slope_1w.mat'));
% colormap winter
% x=slope1(:,1);
% y=slope1(:,2);
% z=slope1(:,3);
% c=z;%c表示对z轴进行着色
% scatter3(x,y,z,200,c,'.');%50表示点的大小，c表示着色情况，'.'表示点的形状
% view(3)
% hold on
% tend=[0,180,270,90];
% % set(gca,'xtick',[],'xticklabel',[]);
% % set(gca,'ytick',[],'yticklabel',[]);
% % set(gca,'ztick',[],'zticklabel',[]);
% for i=1:2
% %    x=15;
% %    y=20+10*i;
% %    z=25-i*5;
% %    d=10;
%     x=i*200;
% %     x=200;
% %     y=-20;
%     y=0;
% %     z=140;
%     z=130;
%     d=150;
%    angle=35;
%    fra=[x,y,z,d,tend(i),angle];
%    [x,y,z]=draw_circle(fra,1);
%    c=color(i,:)./255;
%    patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',0.85);
% %    patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',0.6);
%    view(3)
%    hold on
% end
%%%分区示意图
%%纵向分区示意图
% zone=cell(1,5);
% zone{1}=[30,40.26,23.02;30,40.26,0;0,40.26,0;0,40.26,23.02];
% zone{2}=[30,57.16,18.98;30,57.16,0;0,57.16,0;0,57.16,18.98];
% zone{3}=[30,74.26,11.55;30,74.26,0;0,74.26,0;0,74.26,11.55];
% zone{4}=[30,91.7,3.13;30,91.7,0;0,91.7,0;0,91.7,3.13];
% zone{5}=[30,27,30;30,27,0;0,27,0;0,27,30];
% transparent=0.6;
% color=[144,170,235;152,235,182;235,192,89;235,124,120];
% for i=1:5
%     cord=zone{i};
%     x=cord(:,1);
%     y=cord(:,2);
%     z=cord(:,3);
%     c=color(3,:)./255;
%     patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',transparent);
%     view(3)
% end
% %%%横向分区示意图
% transparent=0.6;
% color=[144,170,235;144,170,235;235,192,89;235,192,89];
% point=[15,55,10;15,50,13];
% % figure(2)
% for i=1:2
%     c=color(i+1,:)./255;
%     plot3(point(i,1),point(i,2),point(i,3),'o','MarkerFaceColor',c,'MarkerEdgeColor',c,'MarkerSize',6);
% %     plot3(point(i,1),point(i,2),point(i,3),'color',color(i+1,:)./255);
%     hold on
% end
% zone=cell(1,4);
% zone{1}=[30,40.7,22.87;30,40.7,0;0,40.7,0;0,40.7,22.87];
% zone{2}=[30,70.38,13.51;30,70.38,0;0,70.38,0;0,70.38,13.51];
% zone{3}=[30,35.12,25.55;30,35.12,0;0,35.12,0;0,35.12,25.55];
% zone{4}=[30,65.21,15.95;30,65.21,0;0,65.21,0;0,65.21,15.95];
% for i=1:4
%     cord=zone{i};
%     x=cord(:,1);
%     y=cord(:,2);
%     z=cord(:,3);
%     c=color(i,:)./255;
%     patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',transparent);
%     view(3)
% end


%%%绘制坡体
%%%去除坐标轴及刻度
set(gca,'xtick',[],'xticklabel',[]);
set(gca,'ytick',[],'yticklabel',[]);
set(gca,'ztick',[],'zticklabel',[]);
color=[202,202,202];
transparent=0.6; %%透明度
c=color./255;
step=0.05;
% f1=[0,20,0;30,20,0;30,160,0;0,160,0]; %底面
% x=f1(:,1);
% y=f1(:,2);
% z=f1(:,3);
% patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',transparent,'LineWidth',1);
% view(3)
% linehandle = patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',transparent,'LineWidth',1);
% set( linehandle, 'linesmoothing', 'on' );
% hold on
% f2=[0,20,0;30,20,0;30,20,30;0,20,30];%左侧面
% x=f2(:,1);
% y=f2(:,2);
% z=f2(:,3);
% patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',transparent,'LineWidth',1);
% view(3)
% linehandle = patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',transparent,'LineWidth',1);
% set( linehandle, 'linesmoothing', 'on' );
% hold on
% f4=[0,20,30;0,30,30;30,30,30;30,20,30];%%顶面
% x=f4(:,1);
% y=f4(:,2);
% z=f4(:,3);
% patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',transparent,'LineWidth',1);
% view(3)
% linehandle = patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',transparent,'LineWidth',1);
% set( linehandle, 'linesmoothing', 'on' );
% hold on

% % f6=[30,30,30;30,35,25;30,40,20;30,50,20;30,60,25;30,70,10;30,100,0];%%右侧面
% f6=[30,30,30;30,35,25;30,40,20;30,50,20;30,60,25;30,70,20;30,80,18;30,90,20;30,100,10;30,110,8;30,120,5;30,130,3;30,140,1;30,150,1;30,160,0];
% [~,xb1,yb1,zb1]=get_bezier(f6',step);

%%有弧度的坡面

xx=[0,7.5,15,22.5,30];%弧度坡面
% xx=[0,3,6,9,12];
yy=[30,35,40,50,60,70,80,90,100,110,120,130,140,150,160];
zz1=[30,25,20,20,25,20,18,20,10,8,5,3,1,1,0];
zz=[zz1;zz1-2;zz1-4;zz1-8;zz1-5;zz1-3;zz1];
cord=[ ];
for i=1:5
    cc=zeros(15,3);
    cc(:,1)=xx(i);
    cc(:,2)=yy;
    cc(:,3)=zz(i,:);
    [~,xb,yb,zb]=get_bezier(cc',step);
    cord=[cord;xb',yb',zb'];
end
%%拟合坡面
x=cord(:,1);
y=cord(:,2);
z=cord(:,3);
[X,Y]=meshgrid(min(x):1:max(x),min(y):1:max(y)); 
Z=griddata(x,y,z,X,Y,"v4");
figure(1)
colormap white
surf(X,Y,Z,'FaceColor','interp','FaceLighting','phong');
shading interp
camlight left;
hold on
shading interp
title('Interpolated Shading')
s.EdgeColor = 'none';
shading interp

%%顶面
c1=[X(1,:)',Y(1,:)',Z(1,:)']; %y=30
c2=flipud(c1);
c2(:,2)=20;
cc=[c1;c2];
x=cc(:,1);
y=cc(:,2);
z=cc(:,3);
patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',transparent,'LineWidth',1);
view(3)
% plot3(c1(:,1),c1(:,2),c1(:,3),'ob','LineWidth',2);
% hold on
%%左侧面
c2=c1;
c2(:,2)=20;
c3=flipud(c2);
c3(:,3)=-10;
cc=[c2;c3];
x=cc(:,1);
y=cc(:,2);
z=cc(:,3);
patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',transparent,'LineWidth',1);
view(3)
%%右侧面
[r1,r2]=size(X);
c1=[X(r1,:)',Y(r1,:)',Z(r1,:)']; %y=160
c2=flipud(c1);
c2(:,3)=-10;
cc=[c1;c2];
x=cc(:,1);
y=cc(:,2);
z=cc(:,3);
patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',transparent,'LineWidth',1);
view(3)
%%底面
cord=[0,20,-10;0,160,-10;30,160,-10;30,20,-10];
x=cord(:,1);
y=cord(:,2);
z=cord(:,3);
patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',transparent,'LineWidth',1);
view(3)
%%正面
c1=[X(:,r2),Y(:,r2),Z(:,r2)]; %x=30
c2=[c1;30,160,-10;30,20,-10;30,20,30];
x=c2(:,1);
y=c2(:,2);
z=c2(:,3);
patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',transparent,'LineWidth',1);
view(3)
%背面
c2(:,1)=0;
x=c2(:,1);
y=c2(:,2);
z=c2(:,3);
patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',transparent,'LineWidth',1);
view(3)
% set(gca,'xtick',[],'xticklabel',[]);
% set(gca,'ytick',[],'yticklabel',[]);
% set(gca,'ztick',[],'zticklabel',[]);
% set(gca,'Visible','off'); %%去除坐标轴边框
% set(gcf,'color','w'); %%设置背景为白色


% rx=f11(:,1);
% ry=f11(:,2);
% rz=f11(:,3);
% tri2=delaunayTriangulation(rx,ry,rz);
% tri=delaunay(rx,ry,rz);
% trisurf(tri,rx,ry,rz);%%绘制由向量 x、y 和 z 中的点以及三角连接矩阵 T 定义的三维三角曲面。
% shading interp
% view(3);


% plot3(f9(:,1),f9(:,2),f9(:,3),'ob','LineWidth',2);
% hold on
% plot3(f6(:,1),f6(:,2),f6(:,3),'ob','LineWidth',2);
% hold on
% plot3(f7(:,1),f7(:,2),f7(:,3),'ob','LineWidth',2);
% hold on
% [~,dd]=size(xb1);
% %%%%绘制坡面点云示意图
% xx=0:1:30; %%x方向每隔1m取一个点
% [~,dd2]=size(xx);
% cord=zeros(dd*dd2,3);
% t1=1;
% for i=1:dd
%     cord(t1:dd2*i,1)=xx;
%     cord(t1:dd2*i,2)=yb2(i);
%     cord(t1:dd2*i,3)=zb2(i);
%     t1=dd2*i+1;
% end
% color=[255, 174, 0];
% b=color./255;
% % plot3(cord(:,1),cord(:,2),cord(:,3),'.','color',b) %%%绘制点云
% % hold on
% 
% x3=xb2;
% for i=0:dd-1
%     x3(1,i+1)=xb2(1,dd-i);
%     y3(1,i+1)=yb2(1,dd-i);
%     z3(1,i+1)=zb2(1,dd-i);
% end
% xb=[xb1,x3];
% yb=[yb1,y3];
% zb=[zb1,z3];
% patch ([xb(:);xb(1)],[yb(:);yb(1)],[zb(:);zb(1)],c,'FaceAlpha',transparent,'LineWidth',1);
% view(3)
% linehandle = patch ([xb(:);xb(1)],[yb(:);yb(1)],[zb(:);zb(1)],c,'FaceAlpha',transparent,'LineWidth',1);
% set( linehandle, 'linesmoothing', 'on' );
% % bezier=[xb',yb',zb'];
% % figure(2)
% f5=[30,20,0;30,20,30;30,30,30;xb1',yb1',zb1';30,100,0];%%前正面
% x=f5(:,1);
% y=f5(:,2);
% z=f5(:,3);
% patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',transparent);
% view(3)
% f3=[0,20,0;0,20,30;0,30,30;xb2',yb2',zb2';0,100,0];%%后正面
% x=f3(:,1);
% y=f3(:,2);
% z=f3(:,3);
% patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',transparent);
% view(3)
% hold on 
% set(gca,'xtick',[],'xticklabel',[]);
% set(gca,'ytick',[],'yticklabel',[]);
% set(gca,'ztick',[],'zticklabel',[]);
% set(gca,'Visible','off'); %%去除坐标轴边框
% set(gcf,'color','w'); %%设置背景为白色
function [t,x,y,z]=get_bezier(vertices,step)
    [~,num]=size(vertices);%点的个数
    NumPoint=num-1;
    t=0:step:1;
    x=[];y=[];z=[];
    x=(1-t).^(NumPoint)*vertices(1,1);
    y=(1-t).^(NumPoint)*vertices(2,1);
    z=(1-t).^(NumPoint)*vertices(3,1);
 for j=1:NumPoint
     w=factorial(NumPoint)/(factorial(j)*factorial(NumPoint-j))*(1-t).^(NumPoint-j).*t.^(j);
     x=x+w*vertices(1,j+1);
     y=y+w*vertices(2,j+1);
     z=z+w*vertices(3,j+1);
     %%factorial为计算阶乘的函数
 end
end
function [x,y,z]=draw_circle(all,order)%绘制圆盘的函数 
%%输入参数为裂隙信息all，圆盘的序号order
%%输出参数为圆周上各点的坐标
global Rmax %直径
d=all(:,4);
%裂隙面法向量
A=cos(all(order,5)*3.14/180)*sin(all(order,6)*3.14/180);
B=sin(all(order,5)*3.14/180)*sin(all(order,6)*3.14/180);
C=cos(all(order,6)*3.14/180);
n=[A B C] ;%法向量
%裂隙圆盘圆心及直径 
r=d(order)/2 ; %圆盘半径
c=[all(order,1),all(order,2),all(order,3)]; %圆心坐标
standard_theta=(2*pi/100)*(Rmax/r);%以最大的圆为划分标准，确保每个圆盘的细分程度相同
theta=(0:standard_theta:2*pi)';%theta角从0到2*pi
a=cross(n,[1 0 0]);%n与i叉乘，求取a向量
 if ~any(a)%如果a为零向量，将n与j叉乘
     a=cross(n,[0 1 0]);
 end
 b=cross(n,a);%求取b向量
 a=a/norm(a);%单位化a向量
 b=b/norm(b);%单位化b向量
 c1=c(1)*ones(size(theta,1),1);
 c2=c(2)*ones(size(theta,1),1);
 c3=c(3)*ones(size(theta,1),1);
 x=c1+r*a(1)*cos(theta)+r*b(1)*sin(theta);%圆上各点的x坐标
 y=c2+r*a(2)*cos(theta)+r*b(2)*sin(theta);%圆上各点的y坐标
 z=c3+r*a(3)*cos(theta)+r*b(3)*sin(theta);%圆上各点的z坐标
end