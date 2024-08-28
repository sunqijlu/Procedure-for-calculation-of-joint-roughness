function a= MSS(x,y,z)
A1=[];
B1=[];
A1(:,1)=x;
A1(:,2)=y;
A1(:,3)=z;
for i1=1:size(A1,1)
    for j1=1:size(A1,1)
        C1=[A1(i1,:);A1(j1,:)];
        B1(i1,j1)=pdist(C1);
    end
end
B1(B1<0.0000001)=9999999;
for k1=1:size(B1,2)
    c1(1,k1)=min(B1(:,k1));
end
a=c1';
a=mean(a);
end
