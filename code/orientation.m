function dips = orientation(x)
%产状计算程序 a=倾角 b=倾向
k=nihe(x);%调用拟合程序，
A=k(1,1);
B=k(2,1);
if A==0
    a=abs(atand(A));
    if B<0
        b=90;
    else 
        b=135;
    end
else
    a=abs(atand((A^2+B^2)^0.5));
    if A<0&&B<=0
        b=atand(B/A);
    elseif A<0&&B>0
        b=atand(B/A)+360;
    else
        b=atand(B/A)+180;
    end
end
dips=[a,b];
end
