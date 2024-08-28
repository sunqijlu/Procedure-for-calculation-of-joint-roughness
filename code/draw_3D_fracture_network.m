clear; %清除工作空间的所有变量，函数，和MEX文件
clc;%清除命令窗口的内容
close; 
% %绘制正方体
% v1=[0,0,0;0,500,0;700,500,0;700,0,0];
% v2=[0,0,500;0,500,500;700,500,500;700,0,500];
% v3=[0,0,0;700,0,0;700,0,500;0,0,500]; 
% v4=[0,500,0;700,500,0;700,500,500;0,500,500];
% v5=[0,0,0;0,500,0;0,500,500;0,0,500];
% v6=[700,0,0;700,500,0;700,500,500;700,0,500];
% cord=cell(1,6);
% cord{1,1}=v1;cord{1,2}=v2;cord{1,3}=v3;cord{1,4}=v4;cord{1,5}=v5;cord{1,6}=v6;
%  color=[202, 202, 202];
% c=color(1,:)./255;
% lim=500;
% xlim([0,700]);
% ylim([0,lim]);
% zlim([0,lim]);
% set(gca,'FontName','Times New Roman','FontSize',16,'LineWidth',1.5)
% for i=1:6
%      color=[202, 202, 202];
%     c=color(1,:)./255;
%     x=cord{1,i}(:,1);y=cord{1,i}(:,2);z=cord{1,i}(:,3);
%     patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',0.3,'LineWidth',1.0);
%     view(3)
%     hold on
%     color=[255, 129, 208];
%     c=color(1,:)./255;
%     x=cord{1,i}(:,1)*2/7;y=cord{1,i}(:,2)*0.4;z=cord{1,i}(:,3)*0.4;
%     patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',0.3,'LineWidth',1.0);
%     view(3)
%     hold on
% 
%     
% end
% slope=importdata(strcat('D:\桌面\滑动面搜索\TEST_2月22日\察达分区_test\察达点云12w_rgb.mat'));
% x=slope(:,1);
% y=slope(:,2);
% z=slope(:,3);
% color=slope(:,4:6);
% c=color./255;
% figure (1)
% scatter3(x,y,z,50,c,'.');%50表示点的大小，c表示着色情况，'.'表示点的形状



% %%%%绘制三维裂隙网络
% global group1
% global group2
% global group3
group1=importdata(strcat('D:\桌面\滑动面搜索\TEST_2月22日\察达分区_test\fra1_1m.mat'));
group2=importdata(strcat('D:\桌面\滑动面搜索\TEST_2月22日\察达分区_test\fra2_1m.mat'));
group3=importdata(strcat('D:\桌面\滑动面搜索\TEST_2月22日\察达分区_test\fra3_1m.mat'));


% [n1,~]=size(fra1);
% [n2,~]=size(fra2);
% [n3,~]=size(fra3);
% g1=unique(round(n1*rand(400000,1)));
% g2=unique(round(n2*rand(230000,1)));
% g3=unique(round(n3*rand(270000,1)));
% %删除0
% [z1,~,~]=find(g1==0);
% [z2,~,~]=find(g2==0);
% [z3,~,~]=find(g3==0);
% g1(z1)=[ ];
% g2(z2)=[ ];
% g1(z3)=[ ];

% global group1
% global group2
% global group3
% group1=fra1(g1,:);
% group2=fra1(g2,:);
% group3=fra1(g3,:);

%%分组绘制三维裂隙网络
ff=cell(1,3);
all_fra=cell(1,3);
all_fra{1,1}=group1;
all_fra{1,2}=group2;
all_fra{1,3}=group3;
for i=1:3
% [m,~]=size(all_fra{1,i});    
[o,~,~]=find(all_fra{1,i}(:,4)>2);
[n,~]=size(o);
fra=all_fra{1,i}(o,:);%%半径大于2m的裂隙
aa=n*rand(round(n/2),1);
order1=unique(round(n*rand(round(n/6),1))); 
[zz,~,~]=find(order1==0);
order1(zz)=[ ];%%将0序号置空

[order,~,~]=find(fra(order1,1)<200 & fra(order1,2)<200 & fra(order1,3)<200);
ff{1,i}=fra(order1(order),:);
% [zz,~,~]=find(order==0);
% order(zz)=[ ];%%将0序号置空

end

% fra{1,1}=group1;
% fra{1,2}=group2;
% fra{1,3}=group3;
color=[235,124,120;144,170,235;152,235,182;];
% color=[254,244,165; 225,213,240;242,212,210;176,217,205];
%%配色3
% color=[255,92,53;167,137,224;143,186,245;134,245,163];
%%配色4
% color=[245, 195, 68; 125, 204, 99;186, 108, 245; 240, 107, 62];
global Rmax
Rmax=10;
lim=200;
for i=1:3
%    [r1,~,~]=find(fra{1,i}(:,1)<lim&fra{1,i}(:,2)<lim&fra{1,i}(:,3)<lim);
%    [dd,~]=size(r1);
%    figure (1)
   set(gca,'FontName','Times New Roman','FontSize',16,'LineWidth',1.5)
   xlim([0,lim]);
    ylim([0,lim]);
    zlim([0,lim]);
    [dd,~]=size(ff{1,i});
   for j=1:dd
%     [x,y,z]=draw_circle(fra{1,i},r1(j,1));
    [x,y,z]=draw_circle(ff{1,i},j);
    c=color(i,:)./255;
    patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',0.9,'LineWidth',0.5);
    view(3)
    hold on
   end

end 
set(gca,'xtick',[],'xticklabel',[]);
set(gca,'ytick',[],'yticklabel',[]);
set(gca,'ztick',[],'zticklabel',[]);
set(gca,'Visible','off'); %%去除坐标轴边框
set(gcf,'color','w'); %%设置背景为白色



% set(gca,'xtick',[],'xticklabel',[]);
% set(gca,'ytick',[],'yticklabel',[]);
% set(gca,'ztick',[],'zticklabel',[]);
% %%%进行裂隙尺寸统计
% maxd=max(group1(:,4));
% dd=group1(:,4);
% % x = randn(1000,1);
% % edges = [-10 -2:0.25:2 10];
% % h = histogram(x,edges);
% nbins = 500;
% edges =[0 0:1:25 50];
% % h=histogram(dd,nbins);
% h=histogram(dd,edges);
% 
% 
% [num1,~]=size(group1);
% [num2,~]=size(group2);
% [num3,~]=size(group3);
% num_fra=num1+num2+num3;
% scale1=10;
% scale2=100;
% [n1,~,~]=find(scale1<group1(:,4)&group1(:,4)<scale2);
% [min1,~]=size(n1);
% [n2,~,~]=find(scale1<group2(:,4)&group2(:,4)<scale2);
% [min2,~]=size(n2);
% [n3,~,~]=find(scale1<group3(:,4)&group3(:,4)<scale2);
% [min3,~]=size(n3);
% min_fra=min1+min2+min3;
% tt=min_fra/num_fra;
% mind1=min(group1(:,4));
% mind2=min(group2(:,4));
% mind3=min(group3(:,4));


%%%%绘制三维裂隙网络
% group1=load('E:\桌面文件\滑动面搜索\TEST_2月22日\察达裂隙第一组.txt');
% group2=load('E:\桌面文件\滑动面搜索\TEST_2月22日\察达裂隙第二组.txt');
% group3=load('E:\桌面文件\滑动面搜索\TEST_2月22日\察达裂隙第三组.txt');
% fra=radius_filter(group1,group2,group3,9);
% num=1000;
% global fra
% fra=[group1(1:num,:);group2(1:num,:);group3(1:num,:)];
%%%用于进行路径可视化的控制函数
% global fra
fra1=xlsread('E:\桌面文件\滑动面搜索\TEST_2月22日\察达分区_test\察达筛选后裂隙_9w.xlsx'); %读取区域内所有裂隙数据
cc=rand(6000,1);
rr=round(90000*cc);
fra=fra1(rr,:);
% rr=round(90000*rand(4000));

% slope1=importdata(strcat('E:\桌面文件\滑动面搜索\TEST_2月22日\察达分区_test\chada_slope_1w.mat'));
colormap winter
x=slope1(:,1);
y=slope1(:,2);
z=slope1(:,3);
c=z;%c表示对z轴进行着色
scatter3(x,y,z,50,c,'.');%50表示点的大小，c表示着色情况，'.'表示点的形状
view(3)
global Rmax
Rmax=(min(fra(:,4)))/2;
%%绘制所有裂隙圆盘
[m,~]=size(fra);
tend=cell(1,4);
tend{1}=find(fra(:,5)<90);
tend{2}=find(fra(:,5)>=90&fra(:,5)<180);
tend{3}=find(fra(:,5)>=180&fra(:,5)<270);
tend{4}=find(fra(:,5)>=270&fra(:,5)<360);
%%配色1
color=[152,235,182;144,170,235;235,192,89;235,124,120];
%%配色2
% color=[254,244,165; 225,213,240;242,212,210;176,217,205];
%%配色3
% color=[255,92,53;167,137,224;143,186,245;134,245,163];
%%配色4
% color=[245, 195, 68; 125, 204, 99;186, 108, 245; 240, 107, 62];
figure (1)
set(get(gca,'XLabel'),'FontSize',16);%图上文字为8 point或小5号
set(get(gca,'YLabel'),'FontSize',16);
set(get(gca,'ZLabel'),'FontSize',16);
set(gca,'FontName','Times New Roman','FontSize',16)
axis([-10,100,0,50]);
zlim([0,500]);
for i=1:4
    [dd,~]=size(tend{i});
    for j=1:dd
    [x,y,z]=draw_circle(fra,tend{i}(j,1));
    c=color(i,:)./255;
    patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],c,'FaceAlpha',0.8,'LineWidth',0.5);
%     patch ([x(:);x(1)],[y(:);y(1)],[z(:);z(1)],'r');
    view(3);
    grid on
    hold on   
    end
end
 zlim([0,220]);
 set(gca,'xtick',[],'xticklabel',[]);
set(gca,'ytick',[],'yticklabel',[]);
set(gca,'ztick',[],'zticklabel',[]);
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
function fra=radius_filter(group1,group2,group3,para)
%输入参数为所有的裂隙数据groupn，坡面点云数据slope,期望筛选出的裂隙数num,半径因子para
%%para是控制筛选半径的参数，para*ave(r)用于筛选出较大的裂隙，para越大，筛选出的裂隙越少，para<1
%%先根据裂隙的直径进行筛选 筛选出较大的裂隙
fra1=group1;
ave1=mean(fra1(:,4)); %%%共计44.8w
[row1,~,~]=find(fra1(:,4)>ave1*para);
% [m1,~]=size(row1);
% num1=round((m1-1)*rand(num*2,1)+1);
all1=fra1(row1,:);

fra2=group2;
ave2=mean(fra2(:,4));%%共计23.4w
[row2,~,~]=find(fra2(:,4)>ave2*para);
% [m2,~]=size(row2);
% num2=round((m2-1)*rand(num,1)+1);
all2=fra2(row2,:);

fra3=group3;
ave3=mean(fra3(:,4));
[row3,~,~]=find(fra3(:,4)>ave3*para); %%共计28.7w
% [m3,~]=size(row3);
% num3=round((m3-1)*rand(num,1)+1);
all3=fra3(row3,:);
fra=[all1;all2;all3];
end