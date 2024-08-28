clear; %清除工作空间的所有变量，函数，和MEX文件
clc;%清除命令窗口的内容
close;


xx=[0,7.5,15,22.5,30];%弧度坡面
% xx=[0,3,6,9,12];
yy=[30,35,40,50,60];
zz1=[20,10,8,5,3,1,1,0];
zz=[zz1;zz1-2;zz1-4;zz1-8;zz1-5;zz1-3;zz1];
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