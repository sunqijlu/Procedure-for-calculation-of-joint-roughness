function D = Fractal(joint)
%基于分型理论的JRC算法
Point=reshape(joint,[],3);
x=Point(:,1);
y=Point(:,2);
z=Point(:,3);
a=max(x);
X=0:0.001:a;
Y=0:0.001:a;
[X,Y]=meshgrid(X,Y);
Z=griddata(x,y,z,X,Y,'cubic');
b=size(Z,1);
%% 盒子大小0.001
Z_rescon=[];
rectangle=[];
X=1:1:b;
Y=1:1:b;
Z_rescon=Z(X,Y,:);
N_1=0;
for i=1:(size(Z_rescon,1)-1)
    for j=1:(size(Z_rescon,1)-1)
        rectangle=[Z_rescon(i,j),Z_rescon(i,j+1),Z_rescon(i+1,j),Z_rescon(i+1,j+1)];
        N_1=N_1+floor((max(rectangle)-min(rectangle))/0.001+1);
    end
end
%% 盒子大小0.002
Z_rescon=[];
rectangle=[];
X=1:2:b;
Y=1:2:b;
Z_rescon=Z(X,Y,:);
N_2=0;
for i=1:(size(Z_rescon,1)-1)
    for j=1:(size(Z_rescon,1)-1)
        rectangle=[Z_rescon(i,j),Z_rescon(i,j+1),Z_rescon(i+1,j),Z_rescon(i+1,j+1)];
        N_2=N_2+floor((max(rectangle)-min(rectangle))/0.002+1);
    end
end
%% 盒子大小0.004
Z_rescon=[];
rectangle=[];
X=1:4:b;
Y=1:4:b;
Z_rescon=Z(X,Y,:);
N_3=0;
for i=1:(size(Z_rescon,1)-1)
    for j=1:(size(Z_rescon,1)-1)
        rectangle=[Z_rescon(i,j),Z_rescon(i,j+1),Z_rescon(i+1,j),Z_rescon(i+1,j+1)];
        N_3=N_3+floor((max(rectangle)-min(rectangle))/0.004+1);
    end
end
%% 盒子大小0.008
Z_rescon=[];
rectangle=[];
X=1:8:b;
Y=1:8:b;
Z_rescon=Z(X,Y,:);
N_4=0;
for i=1:(size(Z_rescon,1)-1)
    for j=1:(size(Z_rescon,1)-1)
        rectangle=[Z_rescon(i,j),Z_rescon(i,j+1),Z_rescon(i+1,j),Z_rescon(i+1,j+1)];
        N_4=N_4+floor((max(rectangle)-min(rectangle))/0.008+1);
    end
end
%% 盒子大小0.016
Z_rescon=[];
X=1:16:b;
Y=1:16:b;
Z_rescon=Z(X,Y,:);
N_5=0;
for i=1:(size(Z_rescon,1)-1)
    for j=1:(size(Z_rescon,1)-1)
        N_5=N_5+floor((max(rectangle)-min(rectangle))/0.016+1);
    end
end
%% 盒子大小0.032
Z_rescon=[];
rectangle=[];
X=1:32:b;
Y=1:32:b;
Z_rescon=Z(X,Y,:);
N_6=0;
for i=1:(size(Z_rescon,1)-1)
    for j=1:(size(Z_rescon,1)-1)
        rectangle=[Z_rescon(i,j),Z_rescon(i,j+1),Z_rescon(i+1,j),Z_rescon(i+1,j+1)];
        N_6=N_6+floor((max(rectangle)-min(rectangle))/0.032+1);
    end
end
%% 盒子大小0.064
Z_rescon=[];
rectangle=[];
X=1:64:b;
Y=1:64:b;
Z_rescon=Z(X,Y,:);
N_7=0;
for i=1:(size(Z_rescon,1)-1)
    for j=1:(size(Z_rescon,1)-1)
        rectangle=[Z_rescon(i,j),Z_rescon(i,j+1),Z_rescon(i+1,j),Z_rescon(i+1,j+1)];
        N_7=N_7+floor((max(rectangle)-min(rectangle))/0.064+1);
    end
end
%% 盒子大小0.128
Z_rescon=[];
rectangle=[];
X=1:128:b;
Y=1:128:b;
Z_rescon=Z(X,Y,:);
N_8=0;
for i=1:(size(Z_rescon,1)-1)
    for j=1:(size(Z_rescon,1)-1)
        rectangle=[Z_rescon(i,j),Z_rescon(i,j+1),Z_rescon(i+1,j),Z_rescon(i+1,j+1)];
        N_8=N_8+floor((max(rectangle)-min(rectangle))/0.128+1);
    end
end
x=[];
y=[];
x=[0.001,0.002,0.004,0.008,0.016,0.032,0.064,0.128];
y=[N_1,N_2,N_3,N_4,N_5,N_6,N_7,N_8];
% D_1=[log(x);log(y)];
D = polyfit(log(x),log(y),1);