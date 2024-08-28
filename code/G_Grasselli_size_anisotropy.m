function [D1,D2] = G_Grasselli_size_anisotropy(joint)
%可使用尺寸效应和间距效应程序的计算程序
% joint为三维矩阵，该处的点云精度为0.001m即1mm，size为样本尺寸
sizes=50;   %设置采样尺寸
center_point=(size(joint,1)+1)/2;%求矩阵中心点
x_left=(1:sizes:center_point)';
x_right=abs((-size(joint,1):sizes:-center_point)');
y_left=(1:sizes:center_point)';
y_right=abs((-size(joint,1):sizes:-center_point)');
for i=1:size(x_left,1)
    if x_left(i,1)==x_right(i,1)
        break
    else
        x=(x_left(i,1):1:x_right(i,1));
        y=(y_left(i,1):1:y_right(i,1));
        joint_rescon=joint(x,y,:);
        [C1,C2] = G_Grasselli_anisotropy(joint_rescon);
        D1(:,(i*3-2):i*3)=C1;
        D2(:,i)=C2;
    end
end