%% 
for i=1:49
    [max_1,max_dex]=max(XXXX(((i*25-24):i*25),:,:),[],1);
    [min_1,min_dex]=min(XXXX(((i*25-24):i*25),:,:),[],1);
    mean_1(i,:,:)=nanmean(XXXX(((i*25-24):i*25),:,:),1);
    radio(i,:,:)=min_1./max_1;
    max_angle(i,:,:)=(max_dex-1)*15;
    min_angle(i,:,:)=(min_dex-1)*15;
end
%% 

radio_1=reshape(radio,[],22);
mean_2=reshape(mean_1,[],22);
%% 

for i=1:1660
    x=int;
    y=radio_2(i,:);
    isvalid = isfinite(x) & isfinite(y);
    p= polyfit(log(x(isvalid)),log(y(isvalid)),1);
    f = polyval(p,log(x));
    [r2,rmse] = rsquare(log(y),f);
    p1(i,1:2)=p;
    p1(i,3)=r2;
end
%% 
for i=1:1660
    x=int;
    y=mean_3(i,:);
    isvalid = isfinite(x) & isfinite(y);
    p = polyfit(log(x(isvalid)),log(y(isvalid)),1);
    f = polyval(p,log(x));
    [r2,rmse] = rsquare(log(y),f);
    p2(i,1:2)=p;
    p2(i,3)=r2;
end
%% 
for i=1:1660
    x=int;
    y=radio_2(i,:);
    isvalid = isfinite(x) & isfinite(y);
    p= polyfit(x(isvalid),y(isvalid),1);
    f = polyval(p,x);
    [r2,rmse] = rsquare(y,f);
    p3(i,1:2)=p;
    p3(i,3)=r2;
end
%% 
for i=1:49
    max_1=[];
    max_dex=[];
    min_1=[];
    min_dex=[];
    [max_1,max_dex]=max(a(((i*25-24):i*25),:),[],1);
    [min_1,min_dex]=min(a(((i*25-24):i*25),:),[],1);
    radio(i,:)=min_1./max_1;
    max_angle(i,:)=(max_dex-1)*15;
    min_angle(i,:)=(min_dex-1)*15;
    mean_1(i,:)=nanmean(a(((i*25-24):i*25),:),1);
end