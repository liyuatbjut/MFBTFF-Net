clearvars -except interpol scale samplePoints SizeTB TBnoon3p TBnoon7p TBnoon19p TBnoon37p TBnight3p TBnight7p TBnight19p TBnight37p dTB3p dTB7p dTB19p dTB37p;

isLOOCV = 1; % whether evaluate the model by LOOCV: 1-yes;0-no
removeMidnight = 1; % whether remove the midnighttime TB channels: 1-yes;0-no
isCNNModel = 1; % whether use neural network models (including MLP & CNN): 1-yes;0-no
load GTpos.mat % load the positions of in-situ measured samples
               % (Zhang et al., Icarus, 2023)

for i = 1:size(GTpos,1)
    if GTpos(i,1)<=0
        samplePoints(i,1) = round((GTpos(i,1)+90)*4*scale+1+floor(scale/2));
    end
    if GTpos(i,1)>0
        samplePoints(i,1) = round((GTpos(i,1)+90)*4*scale+scale+1+floor(scale/2));
    end
end
for i = 1:size(GTpos,1)
    if GTpos(i,2)<=0
        samplePoints(i,2) = round((GTpos(i,2)+180)*4*scale+1+floor(scale/2));
    end
    if GTpos(i,2)>0
        samplePoints(i,2) = round((GTpos(i,2)+180)*4*scale+scale+1+floor(scale/2));
    end
end

samplePointsPlot = samplePoints;
samplePoints = [samplePoints(1:4,:);samplePoints(16,:);samplePoints(36:40,:)];

fTBnoon3p = flipud(TBnoon3p);fTBnoon7p = flipud(TBnoon7p);
fTBnoon19p = flipud(TBnoon19p);fTBnoon37p = flipud(TBnoon37p);
fTBnight3p = flipud(TBnight3p);fTBnight7p = flipud(TBnight7p);
fTBnight19p = flipud(TBnight19p);fTBnight37p = flipud(TBnight37p);
clearvars -except isLOOCV interpol removeMidnight isCNNModel samplePointsPlot isCNNModel scale samplePoints SizeTB fTBnoon3p fTBnoon7p fTBnoon19p fTBnoon37p fTBnight3p fTBnight7p fTBnight19p fTBnight37p dTB3p dTB7p dTB19p dTB37p;

if isCNNModel == 0
for i = 1:size(samplePoints,1)
    dataInv(i,1) = fTBnoon3p(samplePoints(i,1),samplePoints(i,2));
    dataInv(i,2) = fTBnight3p(samplePoints(i,1),samplePoints(i,2));
    dataInv(i,3) = fTBnoon7p(samplePoints(i,1),samplePoints(i,2));
    dataInv(i,4) = fTBnight7p(samplePoints(i,1),samplePoints(i,2));
    dataInv(i,5) = fTBnoon19p(samplePoints(i,1),samplePoints(i,2));
    dataInv(i,6) = fTBnight19p(samplePoints(i,1),samplePoints(i,2));
    dataInv(i,7) = fTBnoon37p(samplePoints(i,1),samplePoints(i,2));
    dataInv(i,8) = fTBnight37p(samplePoints(i,1),samplePoints(i,2));
    dataInv(i,9) = dTB3p(samplePoints(i,1),samplePoints(i,2));
    dataInv(i,10) = dTB7p(samplePoints(i,1),samplePoints(i,2));
    dataInv(i,11) = dTB19p(samplePoints(i,1),samplePoints(i,2));
    dataInv(i,12) = dTB37p(samplePoints(i,1),samplePoints(i,2));
end
for i = 1:size(samplePointsPlot,1)
    dataInvPlot(i,1) = fTBnoon3p(samplePointsPlot(i,1),samplePointsPlot(i,2));
    dataInvPlot(i,2) = fTBnight3p(samplePointsPlot(i,1),samplePointsPlot(i,2));
    dataInvPlot(i,3) = fTBnoon7p(samplePointsPlot(i,1),samplePointsPlot(i,2));
    dataInvPlot(i,4) = fTBnight7p(samplePointsPlot(i,1),samplePointsPlot(i,2));
    dataInvPlot(i,5) = fTBnoon19p(samplePointsPlot(i,1),samplePointsPlot(i,2));
    dataInvPlot(i,6) = fTBnight19p(samplePointsPlot(i,1),samplePointsPlot(i,2));
    dataInvPlot(i,7) = fTBnoon37p(samplePointsPlot(i,1),samplePointsPlot(i,2));
    dataInvPlot(i,8) = fTBnight37p(samplePointsPlot(i,1),samplePointsPlot(i,2));
    dataInvPlot(i,9) = dTB3p(samplePointsPlot(i,1),samplePointsPlot(i,2));
    dataInvPlot(i,10) = dTB7p(samplePointsPlot(i,1),samplePointsPlot(i,2));
    dataInvPlot(i,11) = dTB19p(samplePointsPlot(i,1),samplePointsPlot(i,2));
    dataInvPlot(i,12) = dTB37p(samplePointsPlot(i,1),samplePointsPlot(i,2));
end
val = [fTBnoon3p(:),fTBnight3p(:),fTBnoon7p(:),fTBnight7p(:),...
    fTBnoon19p(:),fTBnight19p(:),fTBnoon37p(:),fTBnight37p(:),...
    dTB3p(:),dTB7p(:),dTB19p(:),dTB37p(:)];
end

if isCNNModel == 1
    for i = 1:size(samplePointsPlot,1)
    dataInvPlot(:,:,1,i) = fTBnoon3p(samplePointsPlot(i,1)-floor(scale/2):samplePointsPlot(i,1)+floor(scale/2),samplePointsPlot(i,2)-floor(scale/2):samplePointsPlot(i,2)+floor(scale/2));
    dataInvPlot(:,:,2,i) = fTBnight3p(samplePointsPlot(i,1)-floor(scale/2):samplePointsPlot(i,1)+floor(scale/2),samplePointsPlot(i,2)-floor(scale/2):samplePointsPlot(i,2)+floor(scale/2));
    dataInvPlot(:,:,3,i) = fTBnoon7p(samplePointsPlot(i,1)-floor(scale/2):samplePointsPlot(i,1)+floor(scale/2),samplePointsPlot(i,2)-floor(scale/2):samplePointsPlot(i,2)+floor(scale/2));
    dataInvPlot(:,:,4,i) = fTBnight7p(samplePointsPlot(i,1)-floor(scale/2):samplePointsPlot(i,1)+floor(scale/2),samplePointsPlot(i,2)-floor(scale/2):samplePointsPlot(i,2)+floor(scale/2));
    dataInvPlot(:,:,5,i) = fTBnoon19p(samplePointsPlot(i,1)-floor(scale/2):samplePointsPlot(i,1)+floor(scale/2),samplePointsPlot(i,2)-floor(scale/2):samplePointsPlot(i,2)+floor(scale/2));
    dataInvPlot(:,:,6,i) = fTBnight19p(samplePointsPlot(i,1)-floor(scale/2):samplePointsPlot(i,1)+floor(scale/2),samplePointsPlot(i,2)-floor(scale/2):samplePointsPlot(i,2)+floor(scale/2));
    dataInvPlot(:,:,7,i) = fTBnoon37p(samplePointsPlot(i,1)-floor(scale/2):samplePointsPlot(i,1)+floor(scale/2),samplePointsPlot(i,2)-floor(scale/2):samplePointsPlot(i,2)+floor(scale/2));
    dataInvPlot(:,:,8,i) = fTBnight37p(samplePointsPlot(i,1)-floor(scale/2):samplePointsPlot(i,1)+floor(scale/2),samplePointsPlot(i,2)-floor(scale/2):samplePointsPlot(i,2)+floor(scale/2));
    dataInvPlot(:,:,9,i) = dTB3p(samplePointsPlot(i,1)-floor(scale/2):samplePointsPlot(i,1)+floor(scale/2),samplePointsPlot(i,2)-floor(scale/2):samplePointsPlot(i,2)+floor(scale/2));
    dataInvPlot(:,:,10,i) = dTB7p(samplePointsPlot(i,1)-floor(scale/2):samplePointsPlot(i,1)+floor(scale/2),samplePointsPlot(i,2)-floor(scale/2):samplePointsPlot(i,2)+floor(scale/2));
    dataInvPlot(:,:,11,i) = dTB19p(samplePointsPlot(i,1)-floor(scale/2):samplePointsPlot(i,1)+floor(scale/2),samplePointsPlot(i,2)-floor(scale/2):samplePointsPlot(i,2)+floor(scale/2));
    dataInvPlot(:,:,12,i) = dTB37p(samplePointsPlot(i,1)-floor(scale/2):samplePointsPlot(i,1)+floor(scale/2),samplePointsPlot(i,2)-floor(scale/2):samplePointsPlot(i,2)+floor(scale/2));
    end
    for i = 1:size(samplePoints,1)
    dataInv(:,:,1,i) = fTBnoon3p(samplePoints(i,1)-floor(scale/2):samplePoints(i,1)+floor(scale/2),samplePoints(i,2)-floor(scale/2):samplePoints(i,2)+floor(scale/2));
    dataInv(:,:,2,i) = fTBnight3p(samplePoints(i,1)-floor(scale/2):samplePoints(i,1)+floor(scale/2),samplePoints(i,2)-floor(scale/2):samplePoints(i,2)+floor(scale/2));
    dataInv(:,:,3,i) = fTBnoon7p(samplePoints(i,1)-floor(scale/2):samplePoints(i,1)+floor(scale/2),samplePoints(i,2)-floor(scale/2):samplePoints(i,2)+floor(scale/2));
    dataInv(:,:,4,i) = fTBnight7p(samplePoints(i,1)-floor(scale/2):samplePoints(i,1)+floor(scale/2),samplePoints(i,2)-floor(scale/2):samplePoints(i,2)+floor(scale/2));
    dataInv(:,:,5,i) = fTBnoon19p(samplePoints(i,1)-floor(scale/2):samplePoints(i,1)+floor(scale/2),samplePoints(i,2)-floor(scale/2):samplePoints(i,2)+floor(scale/2));
    dataInv(:,:,6,i) = fTBnight19p(samplePoints(i,1)-floor(scale/2):samplePoints(i,1)+floor(scale/2),samplePoints(i,2)-floor(scale/2):samplePoints(i,2)+floor(scale/2));
    dataInv(:,:,7,i) = fTBnoon37p(samplePoints(i,1)-floor(scale/2):samplePoints(i,1)+floor(scale/2),samplePoints(i,2)-floor(scale/2):samplePoints(i,2)+floor(scale/2));
    dataInv(:,:,8,i) = fTBnight37p(samplePoints(i,1)-floor(scale/2):samplePoints(i,1)+floor(scale/2),samplePoints(i,2)-floor(scale/2):samplePoints(i,2)+floor(scale/2));
    dataInv(:,:,9,i) = dTB3p(samplePoints(i,1)-floor(scale/2):samplePoints(i,1)+floor(scale/2),samplePoints(i,2)-floor(scale/2):samplePoints(i,2)+floor(scale/2));
    dataInv(:,:,10,i) = dTB7p(samplePoints(i,1)-floor(scale/2):samplePoints(i,1)+floor(scale/2),samplePoints(i,2)-floor(scale/2):samplePoints(i,2)+floor(scale/2));
    dataInv(:,:,11,i) = dTB19p(samplePoints(i,1)-floor(scale/2):samplePoints(i,1)+floor(scale/2),samplePoints(i,2)-floor(scale/2):samplePoints(i,2)+floor(scale/2));
    dataInv(:,:,12,i) = dTB37p(samplePoints(i,1)-floor(scale/2):samplePoints(i,1)+floor(scale/2),samplePoints(i,2)-floor(scale/2):samplePoints(i,2)+floor(scale/2));
    end
    countVal = 1;
    for i = 1:scale:SizeTB(1)
        for j = 1:scale:SizeTB(2)
            val(:,:,1,countVal) = fTBnoon3p(i:i+scale-1,j:j+scale-1);
            val(:,:,2,countVal) = fTBnight3p(i:i+scale-1,j:j+scale-1);
            val(:,:,3,countVal) = fTBnoon7p(i:i+scale-1,j:j+scale-1);
            val(:,:,4,countVal) = fTBnight7p(i:i+scale-1,j:j+scale-1);
            val(:,:,5,countVal) = fTBnoon19p(i:i+scale-1,j:j+scale-1);
            val(:,:,6,countVal) = fTBnight19p(i:i+scale-1,j:j+scale-1);
            val(:,:,7,countVal) = fTBnoon37p(i:i+scale-1,j:j+scale-1);
            val(:,:,8,countVal) = fTBnight37p(i:i+scale-1,j:j+scale-1);
            val(:,:,9,countVal) = dTB3p(i:i+scale-1,j:j+scale-1);
            val(:,:,10,countVal) = dTB7p(i:i+scale-1,j:j+scale-1);
            val(:,:,11,countVal) = dTB19p(i:i+scale-1,j:j+scale-1);
            val(:,:,12,countVal) = dTB37p(i:i+scale-1,j:j+scale-1);
            countVal = countVal+1;
        end
    end
end

clearvars -except interpol isLOOCV removeMidnight isCNNModel dataInvPlot dataInv val scale SizeTB;
clc;close all;
load mineralAbundNum.mat % load in-situ measured samples data as ground truth 
                         % (Zhang et al., Icarus, 2023)
MareHighlandMarker = [1;0;1;0;0;0;0;0;0;0;0;0;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1];
MareHighlandMarkerPlot = [MareHighlandMarker(1:4);MareHighlandMarker(16);MareHighlandMarker(36:40)];
mineralAbundNumPlot = mineralAbundNum;
mineralAbundNum = [mineralAbundNum(1:4,:);mineralAbundNum(16,:);mineralAbundNum(36:40,:)];
MarkerWidth = 1.2;
