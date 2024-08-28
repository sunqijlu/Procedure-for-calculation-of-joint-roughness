function [C1,C2] = tian_Grasselli(Z)
%输入的Z（高度）矩阵
l=(size(Z,1)-1)/100;
k=1;
h=0.01;
X=(0:h:l)';
Y=(0:h:l)';
[X,Y]=meshgrid(X,Y);
for i=1:size(Z,1)
    for j=1:size(Z,1)
        x(k,1)=X(1,i);
        y(k,1)=Y(j,1);
        z(k,1)=Z(i,j);
        k=k+1;
    end
end
ZZ=[x,y,z];
X=ZZ(:,1);
Y=ZZ(:,2);
Z=ZZ(:,3);
Xb=[X,Y,Z];
DT=delaunayTriangulation(X,Y);%重复点最少
T=DT.ConnectivityList;%三角形顶点索引矩阵
TR = triangulation(T,Xb);
F = incenter(TR);%
P= faceNormal(TR);%法向量

%求每个三角形的视倾角
% k=1;
for k=1:12
    angle=k*30;
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
    for i=1:size(T,1)
        A=ZZ(T(i,1),:);
        B=ZZ(T(i,2),:);
        C=ZZ(T(i,3),:);
        AB=B-A;
        BC=C-B;
        c(i,2)=1/2*norm(cross(AB,BC));  %取模
    end
    
    %求A0
    A_0=0;
    for i=1:size(c,1)
        if c(i,1)>0||c(i,1)==0
            A_0=A_0+c(i,2);
        end
    end
    
    %求临界视倾角面积
    A_theta=[];
    theta_max=max(c(:,1));
    theta=linspace(0,theta_max,50)';
    for i=1:50
        A_1=0;
        for j=1:size(c,1)
            if c(j,1)>theta(i)
                A_1=A_1+c(i,2);
            end
        end
        A_theta(i,1)=theta(i);
        A_theta(i,2)=A_1;
    end
        
    % 制作输入数据，y = a*x + b
    x = log(1-theta(1:40,1)./90);
    y = log(A_theta(1:40,2)./A_0);
    p = polyfit(x,y,1);
    C1(k,1)=p(1,1);
    C1(k,2)=p(1,2);
    C1(k,3)=theta_max;
    C2(k,1)=theta_max/(p(1,1)+1);
end
end













