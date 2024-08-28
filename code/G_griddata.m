function C = G_griddata(Z)
l=(size(Z,1)-1)/100;
h=0.01;
X=(0:h:l)';
Y=(0:h:l)';
[X,Y]=meshgrid(X,Y);
k=1;
for i=1:size(Z,1)
    for j=1:size(Z,1)
        x(k,1)=X(1,i);
        y(k,1)=Y(j,1);
        z(k,1)=Z(i,j);
        k=k+1;
    end
end
H=0.01*10;
X=(0:H:l)';
Y=(0:H:l)';
[X,Y]=meshgrid(X,Y);
C=griddata(x,y,z,X,Y);
end
