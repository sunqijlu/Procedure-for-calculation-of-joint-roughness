%% 
%MATLAB读取结构面数据
joint=load('D:\桌面\小论文\小论文数据\数据38.txt');
[X,O,Y,Z] = rotate(joint);
joint=[joint;Z];
save('D:\桌面\小论文\小论文数据\数据38+锚点.txt','joint','-ascii')

%% 
%使用ployworks进行锚定输出数据
joint=load('D:\桌面\小论文\小论文数据\数据38+锚点+旋转.txt');
joint(:,1)=joint(:,1)-min(joint(:,1));
joint(:,2)=joint(:,2)-min(joint(:,2));
scatter3(joint(:,1),joint(:,2),joint(:,3));
axis equal
xlabel('X')
ylabel('Y')
save('D:\桌面\小论文\小论文数据\数据38+锚点+旋转+最终.txt','joint','-ascii')

%% 
joint=load('D:\桌面\小论文\小论文数据\最终数据\数据1+锚点+旋转+最终.txt');
a=size(joint,1);
joint(a-2:a,:)=[];
joint(:,1)=joint(:,1)-min(joint(:,1));
joint(:,2)=joint(:,2)-min(joint(:,2));
scatter3(joint(:,1),joint(:,2),joint(:,3));
axis equal
if max(joint(:,1))>20||max(joint(:,2))>20
    set(gca,'XLim',[0 30]);%X轴的数据显示范围
    set(gca,'XTick',[0:1:30]);%设置要显示坐标刻度
    set(gca,'XTickLabel',[0:1:30]);%给坐标加标签
    set(gca,'YLim',[0 30]);%X轴的数据显示范围
    set(gca,'YTick',[0:1:30]);%设置要显示坐标刻度
    set(gca,'YTickLabel',[0:1:30]);%给坐标加标签
    
else if (max(joint(:,1))<20&&max(joint(:,1))>10)||(max(joint(:,2))<20&&max(joint(:,2))>10)
        
        set(gca,'XLim',[0 20]);%X轴的数据显示范围
        set(gca,'XTick',[0:1:20]);%设置要显示坐标刻度
        set(gca,'XTickLabel',[0:1:20]);%给坐标加标签
        set(gca,'YLim',[0 20]);%X轴的数据显示范围
        set(gca,'YTick',[0:1:20]);%设置要显示坐标刻度
        set(gca,'YTickLabel',[0:1:20]);%给坐标加标签
    else
        set(gca,'XLim',[0 10]);%X轴的数据显示范围
        set(gca,'XTick',[0:1:10]);%设置要显示坐标刻度
        set(gca,'XTickLabel',[0:1:10]);%给坐标加标签
        set(gca,'YLim',[0 10]);%X轴的数据显示范围
        set(gca,'YTick',[0:1:10]);%设置要显示坐标刻度
        set(gca,'YTickLabel',[0:1:10]);%给坐标加标签
    end
end
xlabel('X')
ylabel('Y')
set(gca,'FontSize',8)