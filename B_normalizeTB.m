close all

nploy = 7; % orders of polynomial fitting of standard TB

SizeTB= size(TBnoon3);

averTB = zeros(721*scale,12);

sTBlineMask = imread('masksNormTBRegion.bmp');% load standard TB masking

sTBlineMask = double(sTBlineMask)/255;
sTBlineMask = imresize(sTBlineMask,[size(TBnoon3,1) size(TBnoon3,2)],'nearest');
sTBLocation1 = sTBlineMask.*TBnoon3;sTBLocation1(sTBLocation1==0)=NaN;
averTB(:,1) = mean(sTBLocation1,2,'omitnan');
sTBLocation2 = sTBlineMask.*TBnight3;sTBLocation2(sTBLocation2==0)=NaN;
averTB(:,2) = mean(sTBLocation2,2,'omitnan');
sTBLocation3 = sTBlineMask.*TBnoon7;sTBLocation3(sTBLocation3==0)=NaN;
averTB(:,3) = mean(sTBLocation3,2,'omitnan');
sTBLocation4 = sTBlineMask.*TBnight7;sTBLocation4(sTBLocation4==0)=NaN;
averTB(:,4) = mean(sTBLocation4,2,'omitnan');
sTBLocation5 = sTBlineMask.*TBnoon19;sTBLocation5(sTBLocation5==0)=NaN;
averTB(:,5) = mean(sTBLocation5,2,'omitnan');
sTBLocation6 = sTBlineMask.*TBnight19;sTBLocation6(sTBLocation6==0)=NaN;
averTB(:,6) = mean(sTBLocation6,2,'omitnan');
sTBLocation7 = sTBlineMask.*TBnoon37;sTBLocation7(sTBLocation7==0)=NaN;
averTB(:,7) = mean(sTBLocation7,2,'omitnan');
sTBLocation8 = sTBlineMask.*TBnight37;sTBLocation8(sTBLocation8==0)=NaN;
averTB(:,8) = mean(sTBLocation8,2,'omitnan');
sTBLocation9 = sTBlineMask.*dTB3;sTBLocation9(sTBLocation9==0)=NaN;
averTB(:,9) = mean(sTBLocation9,2,'omitnan');
sTBLocation10 = sTBlineMask.*dTB7;sTBLocation10(sTBLocation10==0)=NaN;
averTB(:,10) = mean(sTBLocation10,2,'omitnan');
sTBLocation11 = sTBlineMask.*dTB19;sTBLocation11(sTBLocation11==0)=NaN;
averTB(:,11) = mean(sTBLocation11,2,'omitnan');
sTBLocation12 = sTBlineMask.*dTB37;sTBLocation12(sTBLocation12==0)=NaN;
averTB(:,12) = mean(sTBLocation12,2,'omitnan');

for i= 1:floor(size(averTB,1)/2)
    averTB(i,:) = averTB(size(averTB,1)-i+1,:);
end

averTB = flipud(averTB);

%%
% TB noon 3.0GHz
xp1 = linspace(-90,90,721*scale);
xp1 = xp1';
figure();plot(xp1,averTB(:,1),'LineWidth',0.01,'Marker','o','Color',[0,0.85,0.9]);
xlim([0 90]);
set(gca,'XTick',-90:30:90);
set(gca,'xticklabel',{'90°„S','60°„S','30°„S','0°„','30°„N','60°„N','90°„N'})
hold on
p1 = polyfit(xp1,averTB(:,1),nploy);
yp1 = polyval(p1,xp1);
plot(xp1,yp1,'LineWidth',1.5,'Color',[1,0,0]);
xlabel('Latitude');ylabel('Brightness Temperature(K)');
legend('Measured T_B','Fitted T_B');
title('T_B 3.0GHz (noon)');
for i = 1:size(TBnoon3,2)
    TBnoon3p(:,i) = TBnoon3(:,i)./yp1;
end

figure();
imagesc(flipud(TBnoon3p(161*scale:561*scale,:)));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',1:40*scale:601*scale);
set(gca,'YTicklabel',{'50°„N','40°„N','30°„N','20°„N','10°„N','0°„','10°„S','20°„S','30°„S','40°„S','50°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string',' ')
xlabel('Longitude');ylabel('Latitude');
title('nT_B 3.0GHz (noon)');

%%
% TB night 3.0GHz
xp2 = linspace(-90,90,721*scale);
xp2 = xp2';
figure();plot(xp2,averTB(:,2),'LineWidth',0.01,'Marker','o','Color',[0,0.85,0.9]);
xlim([0 90]);
set(gca,'XTick',-90:30:90);
set(gca,'xticklabel',{'90°„S','60°„S','30°„S','0°„','30°„N','60°„N','90°„N'})
hold on
p2 = polyfit(xp2,averTB(:,2),nploy);
yp2 = polyval(p2,xp2);
plot(xp2,yp2,'LineWidth',1.5,'Color',[1,0,0]);
xlabel('Latitude');ylabel('Brightness Temperature(K)');
legend('Measured T_B','Fitted T_B');
title('T_B 3.0GHz (night)');
for i = 1:size(TBnight3,2)
    TBnight3p(:,i) = TBnight3(:,i)./yp2;
end

figure();
imagesc(flipud(TBnight3p(161*scale:561*scale,:)));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',1:40*scale:601*scale);
set(gca,'YTicklabel',{'50°„N','40°„N','30°„N','20°„N','10°„N','0°„','10°„S','20°„S','30°„S','40°„S','50°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string',' ')
xlabel('Longitude');ylabel('Latitude');
title('nT_B 3.0GHz (night)');

%%
% TB noon 7.8GHz
xp3 = linspace(-90,90,721*scale);
xp3 = xp3';
figure();plot(xp3,averTB(:,3),'LineWidth',0.01,'Marker','o','Color',[0,0.85,0.9]);
xlim([0 90]);
set(gca,'XTick',-90:30:90);
set(gca,'xticklabel',{'90°„S','60°„S','30°„S','0°„','30°„N','60°„N','90°„N'})
hold on
p3 = polyfit(xp3,averTB(:,3),nploy);
yp3 = polyval(p3,xp3);
plot(xp3,yp3,'LineWidth',1.5,'Color',[1,0,0]);
xlabel('Latitude');ylabel('Brightness Temperature(K)');
legend('Measured T_B','Fitted T_B');
title('T_B 7.8GHz (noon)');
for i = 1:size(TBnoon7,2)
    TBnoon7p(:,i) = TBnoon7(:,i)./yp3;
end

figure();
imagesc(flipud(TBnoon7p(161*scale:561*scale,:)));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',1:40*scale:601*scale);
set(gca,'YTicklabel',{'50°„N','40°„N','30°„N','20°„N','10°„N','0°„','10°„S','20°„S','30°„S','40°„S','50°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string',' ')
xlabel('Longitude');ylabel('Latitude');
xlabel('Longitude');ylabel('Latitude');
title('nT_B 7.8GHz (noon)');

%%
% TB night 7.8GHz
xp4 = linspace(-90,90,721*scale);
xp4 = xp4';
figure();plot(xp4,averTB(:,4),'LineWidth',0.01,'Marker','o','Color',[0,0.85,0.9]);
xlim([0 90]);
set(gca,'XTick',-90:30:90);
set(gca,'xticklabel',{'90°„S','60°„S','30°„S','0°„','30°„N','60°„N','90°„N'})
hold on
p4 = polyfit(xp4,averTB(:,4),nploy);
yp4 = polyval(p4,xp4);
plot(xp4,yp4,'LineWidth',1.5,'Color',[1,0,0]);
xlabel('Latitude');ylabel('Brightness Temperature(K)');
legend('Measured T_B','Fitted T_B');
title('T_B 7.8GHz (night)');
for i = 1:size(TBnight7,2)
    TBnight7p(:,i) = TBnight7(:,i)./yp4;
end

figure();
imagesc(flipud(TBnight7p(161*scale:561*scale,:)));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',1:40*scale:601*scale);
set(gca,'YTicklabel',{'50°„N','40°„N','30°„N','20°„N','10°„N','0°„','10°„S','20°„S','30°„S','40°„S','50°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string',' ')
xlabel('Longitude');ylabel('Latitude');
title('nT_B 7.8GHz (night)');

%%
% TB noon 19.35GHz
xp5 = linspace(-90,90,721*scale);
xp5 = xp5';
figure();plot(xp5,averTB(:,5),'LineWidth',0.01,'Marker','o','Color',[0,0.85,0.9]);
xlim([0 90]);
set(gca,'XTick',-90:30:90);
set(gca,'xticklabel',{'90°„S','60°„S','30°„S','0°„','30°„N','60°„N','90°„N'})
hold on
p5 = polyfit(xp5,averTB(:,5),nploy);
yp5 = polyval(p5,xp5);
plot(xp5,yp5,'LineWidth',1.5,'Color',[1,0,0]);
xlabel('Latitude');ylabel('Brightness Temperature(K)');
legend('Measured T_B','Fitted T_B');
title('T_B 19.35GHz (noon)');
for i = 1:size(TBnoon19,2)
    TBnoon19p(:,i) = TBnoon19(:,i)./yp5;
end

figure();
imagesc(flipud(TBnoon19p(161*scale:561*scale,:)));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',1:40*scale:601*scale);
set(gca,'YTicklabel',{'50°„N','40°„N','30°„N','20°„N','10°„N','0°„','10°„S','20°„S','30°„S','40°„S','50°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string',' ')
xlabel('Longitude');ylabel('Latitude');
title('nT_B 19.35GHz (noon)');

%%
% TB night 19.35GHz
xp6 = linspace(-90,90,721*scale);
xp6 = xp6';
figure();plot(xp6,averTB(:,6),'LineWidth',0.01,'Marker','o','Color',[0,0.85,0.9]);
xlim([0 90]);
set(gca,'XTick',-90:30:90);
set(gca,'xticklabel',{'90°„S','60°„S','30°„S','0°„','30°„N','60°„N','90°„N'})
hold on
p6 = polyfit(xp6,averTB(:,6),nploy);
yp6 = polyval(p6,xp6);
plot(xp6,yp6,'LineWidth',1.5,'Color',[1,0,0]);
xlabel('Latitude');ylabel('Brightness Temperature(K)');
legend('Measured T_B','Fitted T_B');
title('T_B 19.35GHz (night)');
for i = 1:size(TBnight19,2)
    TBnight19p(:,i) = TBnight19(:,i)./yp6;
end

figure();
imagesc(flipud(TBnight19p(161*scale:561*scale,:)));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',1:40*scale:601*scale);
set(gca,'YTicklabel',{'50°„N','40°„N','30°„N','20°„N','10°„N','0°„','10°„S','20°„S','30°„S','40°„S','50°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string',' ')
xlabel('Longitude');ylabel('Latitude');
title('nT_B 19.35GHz (night)');

%%
% TB noon 37.0GHz
xp7 = linspace(-90,90,721*scale);
xp7 = xp7';
figure();plot(xp7,averTB(:,7),'LineWidth',0.01,'Marker','o','Color',[0,0.85,0.9]);
xlim([0 90]);
set(gca,'XTick',-90:30:90);
set(gca,'xticklabel',{'90°„S','60°„S','30°„S','0°„','30°„N','60°„N','90°„N'})
hold on
p7 = polyfit(xp7,averTB(:,7),nploy);
yp7 = polyval(p7,xp7);
plot(xp7,yp7,'LineWidth',1.5,'Color',[1,0,0]);
xlabel('Latitude');ylabel('Brightness Temperature(K)');
legend('Measured T_B','Fitted T_B');
title('T_B 37.0GHz (noon)');
for i = 1:size(TBnoon37,2)
    TBnoon37p(:,i) = TBnoon37(:,i)./yp7;
end

figure();
imagesc(flipud(TBnoon37p(161*scale:561*scale,:)));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',1:40*scale:601*scale);
set(gca,'YTicklabel',{'50°„N','40°„N','30°„N','20°„N','10°„N','0°„','10°„S','20°„S','30°„S','40°„S','50°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string',' ')
xlabel('Longitude');ylabel('Latitude');
title('nT_B 37.0GHz (noon)');

%%
% TB night 37.0GHz
xp8 = linspace(-90,90,721*scale);
xp8 = xp8';
figure();plot(xp8,averTB(:,8),'LineWidth',0.01,'Marker','o','Color',[0,0.85,0.9]);
xlim([0 90]);
set(gca,'XTick',-90:30:90);
set(gca,'xticklabel',{'90°„S','60°„S','30°„S','0°„','30°„N','60°„N','90°„N'})
hold on
p8 = polyfit(xp8,averTB(:,8),nploy);
yp8 = polyval(p8,xp8);
plot(xp8,yp8,'LineWidth',1.5,'Color',[1,0,0]);
xlabel('Latitude');ylabel('Brightness Temperature(K)');
legend('Measured T_B','Fitted T_B');
title('T_B 37.0GHz (night)');
for i = 1:size(TBnight37,2)
    TBnight37p(:,i) = TBnight37(:,i)./yp8;
end

figure();
imagesc(flipud(TBnight37p(161*scale:561*scale,:)));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',1:40*scale:601*scale);
set(gca,'YTicklabel',{'50°„N','40°„N','30°„N','20°„N','10°„N','0°„','10°„S','20°„S','30°„S','40°„S','50°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string',' ')
xlabel('Longitude');ylabel('Latitude');
title('nT_B 37.0GHz (night)');

%%
% dTB 3.0GHz
xp9 = linspace(-90,90,721*scale);
xp9 = xp9';
figure();plot(xp9,averTB(:,9),'LineWidth',0.01,'Marker','o','Color',[0,0.85,0.9]);
xlim([0 90]);
set(gca,'XTick',-90:30:90);
set(gca,'xticklabel',{'90°„S','60°„S','30°„S','0°„','30°„N','60°„N','90°„N'})
hold on
p9 = polyfit(xp9,averTB(:,9),nploy);
yp9 = polyval(p9,xp9);
plot(xp9,yp9,'LineWidth',1.5,'Color',[1,0,0]);
xlabel('Latitude');ylabel('Brightness Temperature(K)');legend('Measured T_B','Fitted T_B');
title('dT_B 3.0GHz');
yp9 = yp9+50;dTB3a = dTB3+50;
for i = 1:size(dTB3a,2)
    dTB3p(:,i) = dTB3a(:,i)./yp9;
end

figure();
imagesc(dTB3p(161*scale:561*scale,:));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',1:40*scale:601*scale);
set(gca,'YTicklabel',{'50°„N','40°„N','30°„N','20°„N','10°„N','0°„','10°„S','20°„S','30°„S','40°„S','50°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string',' ')
xlabel('Longitude');ylabel('Latitude');
title('ndT_B 3.0GHz');

%%
% dTB 7.8GHz
xp10 = linspace(-90,90,721*scale);
xp10 = xp10';
figure();plot(xp10,averTB(:,10),'LineWidth',0.01,'Marker','o','Color',[0,0.85,0.9]);
xlim([0 90]);
set(gca,'XTick',-90:30:90);
set(gca,'xticklabel',{'90°„S','60°„S','30°„S','0°„','30°„N','60°„N','90°„N'})
hold on
p10 = polyfit(xp10,averTB(:,10),nploy);
yp10 = polyval(p10,xp10);
plot(xp10,yp10,'LineWidth',1.5,'Color',[1,0,0]);
xlabel('Latitude');ylabel('Brightness Temperature(K)');legend('Measured T_B','Fitted T_B');
title('dT_B 7.8GHz');
yp10 = yp10+50;dTB7a = dTB7+50;
for i = 1:size(dTB7a,2)
    dTB7p(:,i) = dTB7a(:,i)./yp10;
end

figure();
imagesc(dTB7p(161*scale:561*scale,:));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',1:40*scale:601*scale);
set(gca,'YTicklabel',{'50°„N','40°„N','30°„N','20°„N','10°„N','0°„','10°„S','20°„S','30°„S','40°„S','50°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string',' ')
xlabel('Longitude');ylabel('Latitude');
title('ndT_B 7.8GHz');

%%
% dTB 19.35GHz
xp11 = linspace(-90,90,721*scale);
xp11 = xp11';
figure();plot(xp11,averTB(:,11),'LineWidth',0.01,'Marker','o','Color',[0,0.85,0.9]);
xlim([0 90]);
set(gca,'XTick',-90:30:90);
set(gca,'xticklabel',{'90°„S','60°„S','30°„S','0°„','30°„N','60°„N','90°„N'})
hold on
p11 = polyfit(xp11,averTB(:,11),nploy);
yp11 = polyval(p11,xp11);
plot(xp11,yp11,'LineWidth',1.5,'Color',[1,0,0]);
xlabel('Latitude');ylabel('Brightness Temperature(K)');legend('Measured T_B','Fitted T_B');
title('dT_B 19.35GHz');
yp11 = yp11+50;dTB19a = dTB19+50;
for i = 1:size(dTB19a,2)
    dTB19p(:,i) = dTB19a(:,i)./yp11;
end

figure();
imagesc(dTB19p(161*scale:561*scale,:));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',1:40*scale:601*scale);
set(gca,'YTicklabel',{'50°„N','40°„N','30°„N','20°„N','10°„N','0°„','10°„S','20°„S','30°„S','40°„S','50°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string',' ')
xlabel('Longitude');ylabel('Latitude');
title('ndT_B 19.35GHz');

%%
% dTB 37.0GHz
xp12 = linspace(-90,90,721*scale);
xp12 = xp12';
figure();plot(xp12,averTB(:,12),'LineWidth',0.01,'Marker','o','Color',[0,0.85,0.9]);
xlim([0 90]);
set(gca,'XTick',-90:30:90);
set(gca,'xticklabel',{'90°„S','60°„S','30°„S','0°„','30°„N','60°„N','90°„N'})
hold on
p12 = polyfit(xp12,averTB(:,12),nploy);
yp12 = polyval(p12,xp12);
plot(xp12,yp12,'LineWidth',1.5,'Color',[1,0,0]);
xlabel('Latitude');ylabel('Brightness Temperature(K)');legend('Measured T_B','Fitted T_B');
title('dT_B 37.0GHz');
yp12 = yp12+50;dTB37a = dTB37+50;
for i = 1:size(dTB37a,2)
    dTB37p(:,i) = dTB37a(:,i)./yp12;
end

figure();
imagesc(dTB37p(161*scale:561*scale,:));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',1:40*scale:601*scale);
set(gca,'YTicklabel',{'50°„N','40°„N','30°„N','20°„N','10°„N','0°„','10°„S','20°„S','30°„S','40°„S','50°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string',' ')
xlabel('Longitude');ylabel('Latitude');
title('ndT_B 37.0GHz');
