subplot(2,2,1);
surf(joint_rescon_1(:,:,1),joint_rescon_1(:,:,2),joint_rescon_1(:,:,3),'FaceColor','interp','FaceLighting','phong');
axis([0 5 0 5 -0.1 0.1]);
set(gca,'xtick',0:1:5)
set(gca,'ytick',0:1:5)
set(gca,'ztick',-0.1:0.05:0.1)
set(gca,'FontSize',10,'LineWidth',1);
shading interp
colormap('jet');
camlight left;
pause(1);
subplot(2,2,2);
surf(joint_rescon_2(:,:,1),joint_rescon_2(:,:,2),joint_rescon_2(:,:,3),'FaceColor','interp','FaceLighting','phong');
axis([0 5 0 5 -0.1 0.1]);
set(gca,'xtick',0:1:5)
set(gca,'ytick',0:1:5)
set(gca,'ztick',-0.1:0.05:0.1)
set(gca,'FontSize',10,'LineWidth',1);
shading interp
colormap('jet');
camlight left;
pause(1);
subplot(2,2,3);
surf(joint_rescon_3(:,:,1),joint_rescon_3(:,:,2),joint_rescon_3(:,:,3),'FaceColor','interp','FaceLighting','phong');
axis([0 5 0 5 -0.1 0.1]);
set(gca,'xtick',0:1:5)
set(gca,'ytick',0:1:5)
set(gca,'ztick',-0.1:0.05:0.1)
set(gca,'FontSize',10,'LineWidth',1);
shading interp
colormap('jet');
camlight left;
pause(1);
subplot(2,2,4);
surf(joint_rescon_4(:,:,1),joint_rescon_4(:,:,2),joint_rescon_4(:,:,3),'FaceColor','interp','FaceLighting','phong');
axis([0 5 0 5 -0.1 0.1]);
set(gca,'xtick',0:1:5)
set(gca,'ytick',0:1:5)
set(gca,'ztick',-0.1:0.05:0.1)
set(gca,'FontSize',10,'LineWidth',1);
shading interp
colormap('jet');
camlight left;
pause(1);

