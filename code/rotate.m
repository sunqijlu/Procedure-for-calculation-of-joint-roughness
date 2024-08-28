function [X,O,Y,Z] = rotate(joint)
%求点云平面的旋转基准点

%% 
%计算结构面的法向量n
k=nihe(joint);%主要是调用拟合函数：原理是最小二乘法求ABD
A=k(1,1);
B=k(2,1);
D=k(3,1);
n=[-A;-B;1];
n=n/norm(n);%向量归一化

%% 
%已知结构面法向量n，和平面向量n_0，平面的走向向量n_trend必然垂直这两个向量n和n_0
n_0=[0;0;1]; %平面的法向量
n_trend=cross(n_0,n);
n_trend=n_trend/norm(n_trend);
%% 
%求平面的倾向向量n_dips
n_dips=cross(n_trend,n);
if n_dips(3,1)>0
    n_dips=-n_dips;  
end
n_dips=n_dips/norm(n_dips);

%% 
%在结构面的最边界取一个点O,
[a,b]=min(joint(:,1));
O(1,1)=floor(a)-1;    % O的x坐标
O(2,1)=floor(joint(b,2))-1;    % O的y坐标
O(3,1)=A*O(1,1)+B*O(2,1)+D;
%在结构面的最边界取一个点X,
X=O-n_dips*3;
%在结构面的最边界取一个点Y,
Y=O+n_trend*6;

%% 
Z=[X';O';Y'];
end


