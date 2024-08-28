H=0.1;
X=(0:H:2)';
Y=(0:H:2)';
[X,Y]=meshgrid(X,Y);
Z=griddata(x,y,z,X,Y);

k=1;
for i=1:size(Z,1)
    for j=1:size(Z,1)
        y1(k,1)=X(1,i);
        x1(k,1)=Y(j,1);
        z1(k,1)=Z(i,j);
        k=k+1;
    end
end

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

Xb=[x1,y1,z1];
DT=delaunayTriangulation(x1,y1);%重复点最少
T=DT.ConnectivityList;%三角形顶点索引矩阵
TR = triangulation(T,Xb);
F = incenter(TR);%
P= faceNormal(TR);%法向量
trisurf(T,Xb(:,1),Xb(:,2),Xb(:,3),'FaceColor',[123,123,123]/255,'FaceAlpha',0.3,'LineWidth',0.1,'EdgeColor',[123,123,123]/255);%%%三角剖分后的三维可视图

% hold on;
% P = [B,A;C,D];
% X = P([1,4],:);
% Y = P([2,5],:);
% Z = P([3,6],:);
% h = surf(X,Y,Z);
% set(h,'FaceColor',[1,0,0],'FaceAlpha',0.3,'LineWidth',0.1,'EdgeColor',[1,0,0]);
% set(gca,'FontSize',15,'LineWidth',3);
