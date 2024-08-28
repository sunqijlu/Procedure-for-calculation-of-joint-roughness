function [C1,C2] = G_Grasselli(joint,t)
%粗糙度计算的基本程序,输入的joint三维矩阵,第一层为X，第二层为Y，第三层为Z，t为剪切方向向量
%% 提取joint数据，将三维矩阵转化为平面点云数据

Point=reshape(joint,[],3);
x=Point(:,1);
y=Point(:,2);

%% 进行平面点云的三角剖分，求取每个节理单元的法向量集合P

DT=delaunayTriangulation(x,y);%重复点最少
T=DT.ConnectivityList;%三角形顶点索引矩阵
TR = triangulation(T,Point);
P= faceNormal(TR);%法向量

%% 求每个节理单元的视倾角
n_0=[0,0,1];      %剪切平面的法向量
c=zeros(size(P,1),2);
for i=1:size(P,1)
    n=P(i,:);     %节理单元的法向量
    n_1=n-(n.*n_0).*n_0;     %节理单元法向量在剪切平面的投影向量
    cos_alpha=dot(t,n_1)/(norm(t)*norm(n_1));     %alpha为方位角，主要使用的公式是cos_alpha=t*n_1/|t|*|n_1|
    tan_theta=tan(acos(dot(n,n_0)/(norm(n)*norm(n_0))));     %theta为节理单元的真倾角，其计算公式为tan_theta=n*n_0/|n|*|n_0|
    c(i,1)=atand(-tan_theta*cos_alpha);     %将每个节理单元的真倾角存入变量c(:,1)中
end

%% 求每个节理单元的面积
for i=1:size(P,1)
    A=Point(T(i,1),:);
    B=Point(T(i,2),:);
    C=Point(T(i,3),:);
    AB=B-A;
    BC=C-B;
    c(i,2)=1/2*norm(cross(AB,BC));  %将每微小单元面积存入变量c(:,2)中
end

%% 求视倾角大于0度的节理单元面积总和
A=sum(c(:,2));
A_0=0;
for i=1:size(c,1)
    if c(i,1)>0||c(i,1)==0
        A_0=A_0+c(i,2);
    end
end
A_0=A_0/A;
%% 求临界视倾角面积
A_theta=zeros(100,2);
theta_max=max(c(:,1));
theta=linspace(0,theta_max,100)';
for i=1:100
    A_1=0;
    for j=1:size(c,1)
        if c(j,1)>theta(i)
            A_1=A_1+c(j,2);
        end
    end
    A_theta(i,1)=theta(i);
    A_theta(i,2)=A_1;
end
A_theta(:,2)=A_theta(:,2)/A;

%% 进行临界视倾角的拟合
% 制作输入数据，y = a*x + b
x = log(1-A_theta(1:85,1)/theta_max);
y = log(A_theta(1:85,2)/A_0);
p = polyfit(x,y,1);
C1(1,1)=p(1,1);
C1(1,2)=p(1,2);
C1(1,3)=theta_max;
C2(1,1)=theta_max/(p(1,1)+1);
end