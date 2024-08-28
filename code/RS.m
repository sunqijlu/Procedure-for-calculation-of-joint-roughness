function [A_t,A_n] = RS(joint)
%粗糙度计算的基本程序,主要是实际面积和投影面积比
%% 提取joint数据，将三维矩阵转化为平面点云数据

Point=reshape(joint,[],3);
x=Point(:,1);
y=Point(:,2);

%% 进行平面点云的三角剖分，求取每个节理单元的法向量集合P

DT=delaunayTriangulation(x,y);%重复点最少
T=DT.ConnectivityList;%三角形顶点索引矩阵
TR = triangulation(T,Point);
P= faceNormal(TR);%法向量

%% 求每个节理单元的面积
c=zeros(size(P,1),1);
for i=1:size(P,1)
    A=Point(T(i,1),:);
    B=Point(T(i,2),:);
    C=Point(T(i,3),:);
    AB=B-A;
    BC=C-B;
    c(i,1)=1/2*norm(cross(AB,BC));  %将每微小单元面积存入变量c(:,2)中
end
A_t=sum(c);
A_n=(max(x)-min(x))^2;
end