function [C1,C2,r2,rmse,A_ima,c] = G_Grasselli_ima(x,y,z,ZZ)
%输入的Z（高度）矩阵

H=0.01;
X=(0:H:2)';
Y=(0:H:2)';
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
c(:,2)=c(:,2)/sum(c(:,2));
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
            A_1=A_1+c(j,2);
        end
    end
    A_theta(i,1)=theta(i);
    A_theta(i,2)=A_1;
end

% 制作输入数据，y = a*x + b
x = log(1-A_theta(1:45,1)./theta_max);
y = log(A_theta(1:45,2)./A_0);
p = polyfit(x,y,1);
C1(1,1)=p(1,1);
C1(1,2)=p(1,2);
C1(1,3)=theta_max;
C2(1,1)=theta_max/(p(1,1)+1);
f = polyval(p,x);
[r2,rmse] = rsquare(y,f);
A_2=A_0.*(1-A_theta(:,1)./theta_max).^p(1,1);
A_ima=[A_theta,A_2];
end


