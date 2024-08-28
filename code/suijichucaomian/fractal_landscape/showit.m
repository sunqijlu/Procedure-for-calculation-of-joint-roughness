function showit(x,step,maxstep,scan,maxscan,phase)
y = zeros(2^(maxstep-1)+1);
insertlocations = linspace(1,2^(maxstep-1)+1,2^(step-1)+1);
y(insertlocations,insertlocations)=x;
subplot(211)
surf(y);
colormap gray
zlim([-1 1])
title(sprintf('Surface Plot, Step: %d/%d Scan: %3d/%3d, Phase: %9s',step,maxstep,scan,maxscan,phase));
set(gca,'box','off');
set(gca,'xcolor','w','ycolor','w','xtick',[],'ytick',[],'ztick',[]);
axis off;
view(60,50)

subplot(212)
imagesc(y')
axis equal
set(gca,'box','off');
set(gca,'xcolor','w','ycolor','w','xtick',[],'ytick',[],'ztick',[]);
axis off;colormap gray
title(sprintf('Projection  , Step: %d/%d Scan: %3d/%3d, Phase: %9s',step,maxstep,scan,maxscan,phase));
pause(0.01)
end