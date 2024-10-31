clear all;clc;close all;

load TBmoon  % Load CELMS TB data (Meng et al., IEEE TGRS, 2023)
             % format of the data:
             % row: from 90°„S to 90°„N
             % column: from 180°„W to 180°„E
             % spatial resolution: 0.25°„ per pixel
             % number of channels: 8
             % including noontime and midnighttime TB
             % size: 721°¡1441
             % data MUST be inputted in above format

interpol = 1; % interpolation: 1-yes;0-no
              % pixel-based inversion models: 0
              % region-based CNN models (including MFBTFF-Net): 1
scale = 1;
if interpol ==1
    scale = 5;  % times of enlargement by interpolation
                % NOT recommended to modify
    TBnoon3 = imresize(TBnoon3,scale,'bicubic');
    TBnight3 = imresize(TBnight3,scale,'bicubic');
    TBnoon7 = imresize(TBnoon7,scale,'bicubic');
    TBnight7 = imresize(TBnight7,scale,'bicubic');
    TBnoon19 = imresize(TBnoon19,scale,'bicubic');
    TBnight19 = imresize(TBnight19,scale,'bicubic');
    TBnoon37 = imresize(TBnoon37,scale,'bicubic');
    TBnight37 = imresize(TBnight37,scale,'bicubic');
end
%%
% TB 3Hz 
figure();
imagesc(flipud(TBnoon3));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',1:120*scale:721*scale);
set(gca,'YTicklabel',{'90°„N','60°„N','30°„N','0°„','30°„S','60°„S','90°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string','K')
xlabel('Longitude');ylabel('Latitude');
title('T_B 3.0GHz (noon)');

figure();
imagesc(flipud(TBnight3));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',1:120*scale:721*scale);
set(gca,'YTicklabel',{'90°„N','60°„N','30°„N','0°„','30°„S','60°„S','90°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string','K')
xlabel('Longitude');ylabel('Latitude');
title('T_B 3.0GHz (night)');

%%
% TB 7.8Hz
figure();
imagesc(flipud(TBnoon7));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',1:120*scale:721*scale);
set(gca,'YTicklabel',{'90°„N','60°„N','30°„N','0°„','30°„S','60°„S','90°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string','K')
xlabel('Longitude');ylabel('Latitude');
title('T_B 7.8GHz (noon)');

figure();
imagesc(flipud(TBnight7));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',1:120*scale:721*scale);
set(gca,'YTicklabel',{'90°„N','60°„N','30°„N','0°„','30°„S','60°„S','90°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string','K')
xlabel('Longitude');ylabel('Latitude');
title('T_B 7.8GHz (night)');

%%
% TB 19.35Hz 
figure();
imagesc(flipud(TBnoon19));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',1:120*scale:721*scale);
set(gca,'YTicklabel',{'90°„N','60°„N','30°„N','0°„','30°„S','60°„S','90°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string','K')
xlabel('Longitude');ylabel('Latitude');
title('T_B 19.35GHz (noon)');

figure();
imagesc(flipud(TBnight19));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',1:120*scale:721*scale);
set(gca,'YTicklabel',{'90°„N','60°„N','30°„N','0°„','30°„S','60°„S','90°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string','K')
xlabel('Longitude');ylabel('Latitude');
title('T_B 19.35GHz (night)');

%%
% TB 37Hz
figure();
imagesc(flipud(TBnoon37));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',1:120*scale:721*scale);
set(gca,'YTicklabel',{'90°„N','60°„N','30°„N','0°„','30°„S','60°„S','90°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string','K')
xlabel('Longitude');ylabel('Latitude');
title('T_B 37.0GHz (noon)');

figure();
imagesc(flipud(TBnight37));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',1:120*scale:721*scale);
set(gca,'YTicklabel',{'90°„N','60°„N','30°„N','0°„','30°„S','60°„S','90°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string','K')
xlabel('Longitude');ylabel('Latitude');
title('T_B 37.0GHz (night)');

%%
% dTB 3Hz 
figure();
dTB3 = flipud(TBnoon3-TBnight3);
imagesc(dTB3(81*scale:641*scale,:));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',40*scale:120*scale:641*scale);
set(gca,'YTicklabel',{'60°„N','30°„N','0°„','30°„S','60°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string','K')
xlabel('Longitude');ylabel('Latitude');
title('dT_B 3.0GHz');

%%
% dTB 7.8Hz
figure();
dTB7 = flipud(TBnoon7-TBnight7);
imagesc(dTB7(81*scale:641*scale,:));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',40*scale:120*scale:641*scale);
set(gca,'YTicklabel',{'60°„N','30°„N','0°„','30°„S','60°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string','K')
xlabel('Longitude');ylabel('Latitude');
title('dT_B 7.8GHz');

%%
% dTB 19.35Hz 
figure();
dTB19 = flipud(TBnoon19-TBnight19);
imagesc(dTB19(81*scale:641*scale,:));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',40*scale:120*scale:641*scale);
set(gca,'YTicklabel',{'60°„N','30°„N','0°„','30°„S','60°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string','K')
xlabel('Longitude');ylabel('Latitude');
title('dT_B 19.35GHz');

%%
% dTB 37.0Hz
figure();
dTB37 = flipud(TBnoon37-TBnight37);
imagesc(dTB37(81*scale:641*scale,:));
set(gca,'XTick',1:240*scale:1441*scale);
set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
set(gca,'YTick',40*scale:120*scale:641*scale);
set(gca,'YTicklabel',{'60°„N','30°„N','0°„','30°„S','60°„S'})
colormap jet
h = colorbar();
set(get(h,'Title'),'string','K')
xlabel('Longitude');ylabel('Latitude');
title('dT_B 37.0GHz');
