function [D1,D2] = RS_interval(joint,int_set)
%间距效应的计算程序
% joint为三维矩阵，该处的点云精度为0.001m即1mm，int_0为点云精度合集
%% 对于点云的重构建模，主要是使用MATLAB的interp2或者griddata进行插值，插值基础为绘制的等间距网格。
for i=1:size(int_set,1)
    x=(1:int_set(i,1):size(joint,1));
    y=(1:int_set(i,1):size(joint,1));
    joint_rescon=joint(x,y,:);
    [C1,C2] = RS(joint_rescon);
    D1(i,:)=C1;
    D2(i,:)=C2;
end