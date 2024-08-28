function [D1,D2] = G_Grasselli_interval_scale(joint,int_set)
%不可用
%间距效应-尺寸效应的计算程序
% joint为三维矩阵，该处的点云精度为0.001m即1mm，int_0为点云精度合集
%% 对于点云的重构建模，主要是使用MATLAB的interp2或者griddata进行插值，插值基础为绘制的等间距网格。
for i=1:size(int_set,1)
    x=(1:int_set(i,1):size(joint,1));
    y=(1:int_set(i,1):size(joint,1));
    if max(x)~=size(joint,1)
        x(size(x,2)+1)=size(joint,1);
    end
    joint_rescon=joint(x,y,:);
    Point=reshape(joint_rescon,[],3);
    x_1=Point(:,1);
    y_1=Point(:,2);
    z_1=Point(:,3);
    X=(0:0.001:(size(joint,1)-1)/1000)';
    Y=(0:0.001:(size(joint,1)-1)/1000)';
    [X,Y]=meshgrid(X,Y);
    Z_rescon=griddata(x_1,y_1,z_1,X,Y,'cubic');
    Z_rescon(isnan(Z_rescon))=0;
    joint_rescon_1(:,:,1)=X;
    joint_rescon_1(:,:,2)=Y;
    joint_rescon_1(:,:,3)=Z_rescon;
    [C1,C2] = G_Grasselli_size(joint_rescon_1);
    D1(i,:)=C1;
    D2(i,:)=C2;
end