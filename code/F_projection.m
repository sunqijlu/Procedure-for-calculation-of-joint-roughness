function  n_1= F_projection(n,n_0)
%已知结构面法向量n，和平面向量n_0，求法向量在平面的投影向量n_1
n_1=n-(n.*n_0).*n_0;
end

