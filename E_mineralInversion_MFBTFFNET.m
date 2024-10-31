close all;clc;
% please MAKE SURE "interpol = 1" and "isCNNModel = 1" when using MFBTFF-Net
if removeMidnight
    traindata03 = arrayDatastore(cat(3,dataInv(:,:,1,:),dataInv(:,:,9,:)),IterationDimension=4);
    traindata07 = arrayDatastore(cat(3,dataInv(:,:,3,:),dataInv(:,:,10,:)),IterationDimension=4);
    traindata19 = arrayDatastore(cat(3,dataInv(:,:,5,:),dataInv(:,:,11,:)),IterationDimension=4);
    traindata37 = arrayDatastore(cat(3,dataInv(:,:,7,:),dataInv(:,:,12,:)),IterationDimension=4);
    traindata03P = arrayDatastore(cat(3,dataInvPlot(:,:,1,:),dataInvPlot(:,:,9,:)),IterationDimension=4);
    traindata07P = arrayDatastore(cat(3,dataInvPlot(:,:,3,:),dataInvPlot(:,:,10,:)),IterationDimension=4);
    traindata19P = arrayDatastore(cat(3,dataInvPlot(:,:,5,:),dataInvPlot(:,:,11,:)),IterationDimension=4);
    traindata37P = arrayDatastore(cat(3,dataInvPlot(:,:,7,:),dataInvPlot(:,:,12,:)),IterationDimension=4);
    inputChannel = 2;
else
    traindata03 = arrayDatastore(cat(3,dataInv(:,:,1,:),dataInv(:,:,2,:),dataInv(:,:,9,:)),IterationDimension=4);
    traindata07 = arrayDatastore(cat(3,dataInv(:,:,3,:),dataInv(:,:,4,:),dataInv(:,:,10,:)),IterationDimension=4);
    traindata19 = arrayDatastore(cat(3,dataInv(:,:,5,:),dataInv(:,:,6,:),dataInv(:,:,11,:)),IterationDimension=4);
    traindata37 = arrayDatastore(cat(3,dataInv(:,:,7,:),dataInv(:,:,8,:),dataInv(:,:,12,:)),IterationDimension=4);
    traindata03P = arrayDatastore(cat(3,dataInvPlot(:,:,1,:),dataInvPlot(:,:,2,:),dataInvPlot(:,:,9,:)),IterationDimension=4);
    traindata07P = arrayDatastore(cat(3,dataInvPlot(:,:,3,:),dataInvPlot(:,:,4,:),dataInvPlot(:,:,10,:)),IterationDimension=4);
    traindata19P = arrayDatastore(cat(3,dataInvPlot(:,:,5,:),dataInvPlot(:,:,6,:),dataInvPlot(:,:,11,:)),IterationDimension=4);
    traindata37P = arrayDatastore(cat(3,dataInvPlot(:,:,7,:),dataInvPlot(:,:,8,:),dataInvPlot(:,:,12,:)),IterationDimension=4);
    inputChannel = 3;
end

minAbun1 = arrayDatastore(mineralAbundNum(:,1)); minAbun11 = arrayDatastore(mineralAbundNumPlot(:,1));
minAbun2 = arrayDatastore(mineralAbundNum(:,2)); minAbun22 = arrayDatastore(mineralAbundNumPlot(:,2));
minAbun3 = arrayDatastore(mineralAbundNum(:,3)); minAbun33 = arrayDatastore(mineralAbundNumPlot(:,3));
minAbun4 = arrayDatastore(mineralAbundNum(:,4)); minAbun44 = arrayDatastore(mineralAbundNumPlot(:,4));
minAbun5 = arrayDatastore(mineralAbundNum(:,5)); minAbun55 = arrayDatastore(mineralAbundNumPlot(:,5));

Train1 = combine(traindata03,traindata07,traindata19,traindata37,minAbun1);
Train2 = combine(traindata03,traindata07,traindata19,traindata37,minAbun2);
Train3 = combine(traindata03,traindata07,traindata19,traindata37,minAbun3);
Train4 = combine(traindata03,traindata07,traindata19,traindata37,minAbun4);
Train5 = combine(traindata03,traindata07,traindata19,traindata37,minAbun5);

Train11 = combine(traindata03P,traindata07P,traindata19P,traindata37P,minAbun11);
Train22 = combine(traindata03P,traindata07P,traindata19P,traindata37P,minAbun22);
Train33 = combine(traindata03P,traindata07P,traindata19P,traindata37P,minAbun33);
Train44 = combine(traindata03P,traindata07P,traindata19P,traindata37P,minAbun44);
Train55 = combine(traindata03P,traindata07P,traindata19P,traindata37P,minAbun55);

if removeMidnight
    testdata03 = arrayDatastore(cat(3,val(:,:,1,:),val(:,:,9,:)),IterationDimension=4);
    testdata07 = arrayDatastore(cat(3,val(:,:,3,:),val(:,:,10,:)),IterationDimension=4);
    testdata19 = arrayDatastore(cat(3,val(:,:,5,:),val(:,:,11,:)),IterationDimension=4);
    testdata37 = arrayDatastore(cat(3,val(:,:,7,:),val(:,:,12,:)),IterationDimension=4);
else
    testdata03 = arrayDatastore(cat(3,val(:,:,1,:),val(:,:,2,:),val(:,:,9,:)),IterationDimension=4);
    testdata07 = arrayDatastore(cat(3,val(:,:,3,:),val(:,:,4,:),val(:,:,10,:)),IterationDimension=4);
    testdata19 = arrayDatastore(cat(3,val(:,:,5,:),val(:,:,6,:),val(:,:,11,:)),IterationDimension=4);
    testdata37 = arrayDatastore(cat(3,val(:,:,7,:),val(:,:,8,:),val(:,:,12,:)),IterationDimension=4);
end
Test = combine(testdata03,testdata07,testdata19,testdata37);

lgraph = layerGraph();
%%
% Establishing network struture
layers = [
    imageInputLayer([scale, scale, inputChannel])

    convolution2dLayer([3,3],8,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer

    convolution2dLayer([3,3], 4 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer
    ];
lgraph = addLayers(lgraph,layers);

layers = [
    imageInputLayer([scale, scale, inputChannel])

    convolution2dLayer([3,3],8,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer

    convolution2dLayer([3,3], 4 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer
    ];
lgraph = addLayers(lgraph,layers);

layers = [
    imageInputLayer([scale, scale, inputChannel])

    convolution2dLayer([3,3],8,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer

    convolution2dLayer([3,3], 4 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer
    ];
lgraph = addLayers(lgraph,layers);

layers = [
    imageInputLayer([scale, scale, inputChannel])

    convolution2dLayer([3,3],8,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer

    convolution2dLayer([3,3], 4 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer
    ];
lgraph = addLayers(lgraph,layers);

layers = [
    concatenationLayer(3,2)
    convolution2dLayer([3,3], 8 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer
    convolution2dLayer([3,3], 4 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer];
lgraph = addLayers(lgraph,layers);
layers = [
    concatenationLayer(3,2)
    convolution2dLayer([3,3], 8 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer
    convolution2dLayer([3,3], 4 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer];
lgraph = addLayers(lgraph,layers);
layers = [
    concatenationLayer(3,2)
    convolution2dLayer([3,3], 8 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer
    convolution2dLayer([3,3], 4 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer];
lgraph = addLayers(lgraph,layers);

layers = [
    concatenationLayer(3,2)
    convolution2dLayer([3,3], 8 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer
    convolution2dLayer([3,3], 2 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer];
lgraph = addLayers(lgraph,layers);
layers = [
    concatenationLayer(3,2)
    convolution2dLayer([3,3], 8 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer
    convolution2dLayer([3,3], 2 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer];
lgraph = addLayers(lgraph,layers);
layers = [
    concatenationLayer(3,2)
    convolution2dLayer([3,3], 8 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer
    convolution2dLayer([3,3], 1 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer];
lgraph = addLayers(lgraph,layers);

layers = [
    concatenationLayer(3,2)
    convolution2dLayer([3,3], 8 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer
    convolution2dLayer([3,3], 2 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer];
lgraph = addLayers(lgraph,layers);
layers = [
    concatenationLayer(3,2)
    convolution2dLayer([3,3], 8 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer
    convolution2dLayer([3,3], 2 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer];
lgraph = addLayers(lgraph,layers);

layers = [
    concatenationLayer(3,2)
    convolution2dLayer([3,3], 8 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer
    concatenationLayer(3,3)
    convolution2dLayer([3,3], 6 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer
    concatenationLayer(3,2)
    convolution2dLayer([3,3], 4 ,'Padding','same')
    batchNormalizationLayer
    sigmoidLayer
    dropoutLayer(0.2)
    fullyConnectedLayer(1)
    regressionLayer];
lgraph = addLayers(lgraph,layers);

lgraph = connectLayers(lgraph,"layer_2","concat/in1");
lgraph = connectLayers(lgraph,"layer_4","concat/in2");
lgraph = connectLayers(lgraph,"layer_4","concat_1/in1");
lgraph = connectLayers(lgraph,"layer_6","concat_1/in2");
lgraph = connectLayers(lgraph,"layer_6","concat_2/in1");
lgraph = connectLayers(lgraph,"layer_8","concat_2/in2");

lgraph = connectLayers(lgraph,"layer_2","concat_3/in1");
lgraph = connectLayers(lgraph,"layer_6","concat_3/in2");
lgraph = connectLayers(lgraph,"layer_4","concat_4/in1");
lgraph = connectLayers(lgraph,"layer_8","concat_4/in2");
lgraph = connectLayers(lgraph,"layer_2","concat_5/in1");
lgraph = connectLayers(lgraph,"layer_8","concat_5/in2");

lgraph = connectLayers(lgraph,"layer_10","concat_6/in1");
lgraph = connectLayers(lgraph,"layer_12","concat_6/in2");
lgraph = connectLayers(lgraph,"layer_12","concat_7/in1");
lgraph = connectLayers(lgraph,"layer_14","concat_7/in2");

lgraph = connectLayers(lgraph,"layer_22","concat_8/in1");
lgraph = connectLayers(lgraph,"layer_24","concat_8/in2");
lgraph = connectLayers(lgraph,"layer_16","concat_9/in2");
lgraph = connectLayers(lgraph,"layer_18","concat_9/in3");
lgraph = connectLayers(lgraph,"layer_20","concat_10/in2");

plot(lgraph);analyzeNetwork(lgraph);

%%
% hyper-parameters setting
options = trainingOptions('sgdm', ...
    'MaxEpochs', 1000, ...
    'InitialLearnRate', 1e-3, ...
    'LearnRateSchedule', 'piecewise', ...
    'LearnRateDropFactor', 0.8, ...
    'LearnRateDropPeriod', 200);

if isLOOCV
    for j = 1:size(mineralAbundNumPlot,2)
        switch j
            case 1
                net = trainNetwork(Train11, lgraph, options);
            case 2
                net = trainNetwork(Train22, lgraph, options);
            case 3
                net = trainNetwork(Train33, lgraph, options);
            case 4
                net = trainNetwork(Train44, lgraph, options);
            case 5
                net = trainNetwork(Train55, lgraph, options);
        end
        for i = 1:size(mineralAbundNumPlot,1)
            if removeMidnight
                testdata03tr = arrayDatastore(cat(3,dataInvPlot(:,:,1,i),dataInvPlot(:,:,9,i)),IterationDimension=4);
                testdata07tr = arrayDatastore(cat(3,dataInvPlot(:,:,3,i),dataInvPlot(:,:,10,i)),IterationDimension=4);
                testdata19tr = arrayDatastore(cat(3,dataInvPlot(:,:,5,i),dataInvPlot(:,:,11,i)),IterationDimension=4);
                testdata37tr = arrayDatastore(cat(3,dataInvPlot(:,:,7,i),dataInvPlot(:,:,12,i)),IterationDimension=4);
            else
                testdata03tr = arrayDatastore(cat(3,dataInvPlot(:,:,1,i),dataInvPlot(:,:,2,i),dataInvPlot(:,:,9,i)),IterationDimension=4);
                testdata07tr = arrayDatastore(cat(3,dataInvPlot(:,:,3,i),dataInvPlot(:,:,4,i),dataInvPlot(:,:,10,i)),IterationDimension=4);
                testdata19tr = arrayDatastore(cat(3,dataInvPlot(:,:,5,i),dataInvPlot(:,:,6,i),dataInvPlot(:,:,11,i)),IterationDimension=4);
                testdata37tr = arrayDatastore(cat(3,dataInvPlot(:,:,7,i),dataInvPlot(:,:,8,i),dataInvPlot(:,:,12,i)),IterationDimension=4);
            end
            Testtr = combine(testdata03tr,testdata07tr,testdata19tr,testdata37tr);
            T_sim(i,j) = predict(net, Testtr);
        end
    end

    for j = 1:size(mineralAbundNumPlot,2)
        for i = 1:size(mineralAbundNumPlot,1)
            tr = dataInvPlot;tr(:,:,:,i) = [];te = mineralAbundNumPlot;te(i,:) = [];
            if removeMidnight
                tr03 = arrayDatastore(cat(3,tr(:,:,1,:),tr(:,:,9,:)),IterationDimension=4);
                tr07 = arrayDatastore(cat(3,tr(:,:,3,:),tr(:,:,10,:)),IterationDimension=4);
                tr19 = arrayDatastore(cat(3,tr(:,:,5,:),tr(:,:,11,:)),IterationDimension=4);
                tr37 = arrayDatastore(cat(3,tr(:,:,7,:),tr(:,:,12,:)),IterationDimension=4);
            else
                tr03 = arrayDatastore(cat(3,tr(:,:,1,:),tr(:,:,2,:),tr(:,:,9,:)),IterationDimension=4);
                tr07 = arrayDatastore(cat(3,tr(:,:,3,:),tr(:,:,4,:),tr(:,:,10,:)),IterationDimension=4);
                tr19 = arrayDatastore(cat(3,tr(:,:,5,:),tr(:,:,6,:),tr(:,:,11,:)),IterationDimension=4);
                tr37 = arrayDatastore(cat(3,tr(:,:,7,:),tr(:,:,8,:),tr(:,:,12,:)),IterationDimension=4);
            end
            te = arrayDatastore(te(:,j));
            trc = combine(tr03,tr07,tr19,tr37,te);

            net = trainNetwork(trc, lgraph, options);

            if removeMidnight
                pred03 = arrayDatastore(cat(3,dataInvPlot(:,:,1,i),dataInvPlot(:,:,9,i)),IterationDimension=4);
                pred07 = arrayDatastore(cat(3,dataInvPlot(:,:,3,i),dataInvPlot(:,:,10,i)),IterationDimension=4);
                pred19 = arrayDatastore(cat(3,dataInvPlot(:,:,5,i),dataInvPlot(:,:,11,i)),IterationDimension=4);
                pred37 = arrayDatastore(cat(3,dataInvPlot(:,:,7,i),dataInvPlot(:,:,12,i)),IterationDimension=4);
            else
                pred03 = arrayDatastore(cat(3,dataInvPlot(:,:,1,i),dataInvPlot(:,:,2,i),dataInvPlot(:,:,9,i)),IterationDimension=4);
                pred07 = arrayDatastore(cat(3,dataInvPlot(:,:,3,i),dataInvPlot(:,:,4,i),dataInvPlot(:,:,10,i)),IterationDimension=4);
                pred19 = arrayDatastore(cat(3,dataInvPlot(:,:,5,i),dataInvPlot(:,:,6,i),dataInvPlot(:,:,11,i)),IterationDimension=4);
                pred37 = arrayDatastore(cat(3,dataInvPlot(:,:,7,i),dataInvPlot(:,:,8,i),dataInvPlot(:,:,12,i)),IterationDimension=4);
            end
            tec = combine(pred03,pred07,pred19,pred37);
            T_simLOOCV(i,j) = predict(net, tec);
        end
    end

    % evaluation indices: RMSE R^2 MAPE
    % _1: training set; _2: validation set
    RMSE1=sqrt(sum((mineralAbundNumPlot - T_sim).^2)/size(mineralAbundNumPlot,1));%—µ¡∑ºØRMSE
    RMSE2=sqrt(sum((mineralAbundNumPlot- T_simLOOCV).^2)/size(mineralAbundNumPlot,1));%≤‚ ‘ºØRMSE
    r2_1 = 1 - sum((mineralAbundNumPlot-T_sim).^2)./sum((mineralAbundNumPlot-repmat(mean(mineralAbundNumPlot,1),size(mineralAbundNumPlot,1),1)).^2);
    r2_2 = 1 - sum((mineralAbundNumPlot-T_simLOOCV).^2)./sum((mineralAbundNumPlot-repmat(mean(mineralAbundNumPlot,1),size(mineralAbundNumPlot,1),1)).^2);
    MAPE1 = sum(abs(mineralAbundNumPlot - T_sim)./mineralAbundNumPlot)/size(mineralAbundNumPlot,1)*100;
    MAPE2 = sum(abs(mineralAbundNumPlot - T_simLOOCV)./mineralAbundNumPlot)/size(mineralAbundNumPlot,1)*100;

    figure();
    plot(linspace(10,30,100),linspace(10,30,100),'k--')
    hold on
    for i = 1:size(mineralAbundNumPlot,1)
        if MareHighlandMarker(i) == 1
            plot(mineralAbundNumPlot(i,1),T_sim(i,1),'b^','LineWidth',MarkerWidth)
            hold on
            plot(mineralAbundNumPlot(i,1),T_simLOOCV(i,1),'r^','LineWidth',MarkerWidth)
        else
            plot(mineralAbundNumPlot(i,1),T_sim(i,1),'bo','LineWidth',MarkerWidth)
            hold on
            plot(mineralAbundNumPlot(i,1),T_simLOOCV(i,1),'ro','LineWidth',MarkerWidth)
        end
    end
    xlabel('Al_2O_3 Measured');ylabel('Al_2O_3 Predicted');
    legend('','Training Set (Mare)','Validation Set (Mare)','Training Set (Highland)','Validation Set (Highland)');
    xlim([10 30]);ylim([10 30]);

    figure();
    plot(linspace(9,17,100),linspace(9,17,100),'k--')
    hold on
    for i = 1:size(mineralAbundNumPlot,1)
        if MareHighlandMarker(i) == 1
            plot(mineralAbundNumPlot(i,2),T_sim(i,2),'b^','LineWidth',MarkerWidth)
            hold on
            plot(mineralAbundNumPlot(i,2),T_simLOOCV(i,2),'r^','LineWidth',MarkerWidth)
        else
            plot(mineralAbundNumPlot(i,2),T_sim(i,2),'bo','LineWidth',MarkerWidth)
            hold on
            plot(mineralAbundNumPlot(i,2),T_simLOOCV(i,2),'ro','LineWidth',MarkerWidth)
        end
    end
    xlabel('CaO Measured');ylabel('CaO Predicted');
    legend('','Training Set (Mare)','Validation Set (Mare)','Training Set (Highland)','Validation Set (Highland)');
    xlim([9,17]);ylim([9,17]);

    figure();
    plot(linspace(0,25,100),linspace(0,25,100),'k--')
    hold on
    for i = 1:size(mineralAbundNumPlot,1)
        if MareHighlandMarker(i) == 1
            plot(mineralAbundNumPlot(i,3),T_sim(i,3),'b^','LineWidth',MarkerWidth)
            hold on
            plot(mineralAbundNumPlot(i,3),T_simLOOCV(i,3),'r^','LineWidth',MarkerWidth)
        else
            plot(mineralAbundNumPlot(i,3),T_sim(i,3),'bo','LineWidth',MarkerWidth)
            hold on
            plot(mineralAbundNumPlot(i,3),T_simLOOCV(i,3),'ro','LineWidth',MarkerWidth)
        end
    end
    xlabel('FeO Measured');ylabel('FeO Predicted');
    legend('','Training Set (Mare)','Validation Set (Mare)','Training Set (Highland)','Validation Set (Highland)');
    xlim([0,25]);ylim([0,25]);

    figure();
    plot(linspace(4,12,100),linspace(4,12,100),'k--')
    hold on
    for i = 1:size(mineralAbundNumPlot,1)
        if MareHighlandMarker(i) == 1
            plot(mineralAbundNumPlot(i,4),T_sim(i,4),'b^','LineWidth',MarkerWidth)
            hold on
            plot(mineralAbundNumPlot(i,4),T_simLOOCV(i,4),'r^','LineWidth',MarkerWidth)
        else
            plot(mineralAbundNumPlot(i,4),T_sim(i,4),'bo','LineWidth',MarkerWidth)
            hold on
            plot(mineralAbundNumPlot(i,4),T_simLOOCV(i,4),'ro','LineWidth',MarkerWidth)
        end
    end
    xlabel('MgO Measured');ylabel('MgO Predicted');
    legend('','Training Set (Mare)','Validation Set (Mare)','Training Set (Highland)','Validation Set (Highland)');
    xlim([4,12]);ylim([4,12]);

    figure();
    plot(linspace(0,10,100),linspace(0,10,100),'k--')
    hold on
    for i = 1:size(mineralAbundNumPlot,1)
        if MareHighlandMarker(i) == 1
            plot(mineralAbundNumPlot(i,5),T_sim(i,5),'b^','LineWidth',MarkerWidth)
            hold on
            plot(mineralAbundNumPlot(i,5),T_simLOOCV(i,5),'r^','LineWidth',MarkerWidth)
        else
            plot(mineralAbundNumPlot(i,5),T_sim(i,5),'bo','LineWidth',MarkerWidth)
            hold on
            plot(mineralAbundNumPlot(i,5),T_simLOOCV(i,5),'ro','LineWidth',MarkerWidth)
        end
    end
    xlabel('TiO_2 Measured');ylabel('TiO_2 Predicted');
    legend('','Training Set (Mare)','Validation Set (Mare)','Training Set (Highland)','Validation Set (Highland)');
    xlim([0,10]);ylim([0,10]);
end

options = trainingOptions('sgdm', ...
    'MaxEpochs', 1000, ...
    'InitialLearnRate', 1e-4, ...
    'LearnRateSchedule', 'piecewise', ...
    'LearnRateDropFactor', 0.9, ...
    'LearnRateDropPeriod', 200, ...
    'Plots', 'training-progress');

for i = 1:5
    switch i
        case 1
            [net1,info1] = trainNetwork(Train1, lgraph, options);
            T_sim1 = predict(net1, Test);
        case 2
            [net2,info2] = trainNetwork(Train2, lgraph, options);
            T_sim1 = predict(net2, Test);
        case 3
            [net3,info3] = trainNetwork(Train3, lgraph, options);
            T_sim1 = predict(net3, Test);
        case 4
            [net4,info4] = trainNetwork(Train4, lgraph, options);
            T_sim1 = predict(net4, Test);
        case 5
            [net5,info5] = trainNetwork(Train5, lgraph, options);
            T_sim1 = predict(net5, Test);
    end

    T_sim1 = reshape(T_sim1,[SizeTB(2)/scale,SizeTB(1)/scale]);
    T_sim1 = T_sim1';
    map(:,:,i) = T_sim1;
    clear T_sim1
    figure();
    imagesc((map(121:601,:,i)));
    set(gca,'XTick',1:240:1441);
    set(gca,'XTicklabel',{'180°„W','120°„W','60°„W','0°„','60°„E','120°„E','180°„E'})
    set(gca,'YTick',1:120:601);
    set(gca,'YTicklabel',{'60°„N','30°„N','0°„','30°„S','60°„S'})
    colormap jet
    h = colorbar();
    set(get(h,'Title'),'string','wt.%')
    xlabel('Longitude');ylabel('Latitude');
    switch i
        case 1
            title('Al_2O_3');
        case 2
            title('CaO');
        case 3
            title('FeO');
        case 4
            title('MgO');
        case 5
            title('TiO_2');
    end
end
