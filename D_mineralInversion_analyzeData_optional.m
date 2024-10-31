close all;clc;

% this code is optional
% to run this code, "interpol = 0" MUST be set in "A_loadTB.m"
% AND "isCNNModel = 0" MUST be set in "C_mineralInversion_preparation.m"
if interpol == 0 && isCNNModel == 0
    sz = 10;

    figure();
    p011 = polyfit(dataInv(:,1),mineralAbundNum(:,1),3);
    yp1 = polyval(p011,dataInv(:,1));
    sort = sortrows([dataInv(:,1),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'r--','LineWidth',0.8);
    hold on
    p012 = polyfit(dataInv(:,1),mineralAbundNum(:,2),3);
    yp1 = polyval(p012,dataInv(:,1));
    sort = sortrows([dataInv(:,1),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'g--','LineWidth',1.0);
    hold on
    p013 = polyfit(dataInv(:,1),mineralAbundNum(:,3),3);
    yp1 = polyval(p013,dataInv(:,1));
    sort = sortrows([dataInv(:,1),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'b--','LineWidth',1.0);
    hold on
    p014 = polyfit(dataInv(:,1),mineralAbundNum(:,4),3);
    yp1 = polyval(p014,dataInv(:,1));
    sort = sortrows([dataInv(:,1),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'c--','LineWidth',1.0);
    hold on
    p015 = polyfit(dataInv(:,1),mineralAbundNum(:,5),3);
    yp1 = polyval(p015,dataInv(:,1));
    sort = sortrows([dataInv(:,1),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'LineStyle','--','Color',[1,0.8,0],'LineWidth',1.0);
    hold on
    for i = 1:size(MareHighlandMarkerPlot,1)
        if MareHighlandMarkerPlot(i) == 1
            scatter(dataInv(i,1),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,1),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,1),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,1),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,1),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
        else
            scatter(dataInv(i,1),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,1),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,1),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,1),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,1),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
        end
    end
    xlabel('3.0 GHz Noon nT_B Value');ylabel('Measured Oxides Abundance');
    legend('Al_2O_3','CaO','FeO','MgO','TiO_2');

    figure();
    p021 = polyfit(dataInv(:,2),mineralAbundNum(:,1),2);
    yp1 = polyval(p021,dataInv(:,2));
    sort = sortrows([dataInv(:,2),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'r--','LineWidth',0.8);
    hold on
    p022 = polyfit(dataInv(:,2),mineralAbundNum(:,2),2);
    yp1 = polyval(p022,dataInv(:,2));
    sort = sortrows([dataInv(:,2),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'g--','LineWidth',1.0);
    hold on
    p023 = polyfit(dataInv(:,2),mineralAbundNum(:,3),2);
    yp1 = polyval(p023,dataInv(:,2));
    sort = sortrows([dataInv(:,2),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'b--','LineWidth',1.0);
    hold on
    p024 = polyfit(dataInv(:,2),mineralAbundNum(:,4),2);
    yp1 = polyval(p024,dataInv(:,2));
    sort = sortrows([dataInv(:,2),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'c--','LineWidth',1.0);
    hold on
    p025 = polyfit(dataInv(:,2),mineralAbundNum(:,5),2);
    yp1 = polyval(p025,dataInv(:,2));
    sort = sortrows([dataInv(:,2),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'LineStyle','--','Color',[1,0.8,0],'LineWidth',1.0);
    hold on
    for i = 1:size(MareHighlandMarkerPlot,1)
        if MareHighlandMarkerPlot(i) == 1
            scatter(dataInv(i,2),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,2),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,2),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,2),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,2),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
        else
            scatter(dataInv(i,2),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,2),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,2),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,2),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,2),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
        end
    end
    xlabel('3.0 GHz Midnight nT_B Value');ylabel('Measured Oxides Abundance');
    legend('Al_2O_3','CaO','FeO','MgO','TiO_2');

    figure();
    p031 = polyfit(dataInv(:,3),mineralAbundNum(:,1),3);
    yp1 = polyval(p031,dataInv(:,3));
    sort = sortrows([dataInv(:,3),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'r--','LineWidth',0.8);
    hold on
    p032 = polyfit(dataInv(:,3),mineralAbundNum(:,2),2);
    yp1 = polyval(p032,dataInv(:,3));
    sort = sortrows([dataInv(:,3),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'g--','LineWidth',1.0);
    hold on
    p033 = polyfit(dataInv(:,3),mineralAbundNum(:,3),2);
    yp1 = polyval(p033,dataInv(:,3));
    sort = sortrows([dataInv(:,3),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'b--','LineWidth',1.0);
    hold on
    p034 = polyfit(dataInv(:,3),mineralAbundNum(:,4),3);
    yp1 = polyval(p034,dataInv(:,3));
    sort = sortrows([dataInv(:,3),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'c--','LineWidth',1.0);
    hold on
    p035 = polyfit(dataInv(:,3),mineralAbundNum(:,5),2);
    yp1 = polyval(p035,dataInv(:,3));
    sort = sortrows([dataInv(:,3),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'LineStyle','--','Color',[1,0.8,0],'LineWidth',1.0);
    hold on
    for i = 1:size(MareHighlandMarkerPlot,1)
        if MareHighlandMarkerPlot(i) == 1
            scatter(dataInv(i,3),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,3),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,3),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,3),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,3),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
        else
            scatter(dataInv(i,3),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,3),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,3),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,3),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,3),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
        end
    end
    xlabel('7.8 GHz Noon nT_B Value');ylabel('Measured Oxides Abundance');
    legend('Al_2O_3','CaO','FeO','MgO','TiO_2');

    figure();
    p041 = polyfit(dataInv(:,4),mineralAbundNum(:,1),2);
    yp1 = polyval(p041,dataInv(:,4));
    sort = sortrows([dataInv(:,4),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'r--','LineWidth',0.8);
    hold on
    p042 = polyfit(dataInv(:,4),mineralAbundNum(:,2),2);
    yp1 = polyval(p042,dataInv(:,4));
    sort = sortrows([dataInv(:,4),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'g--','LineWidth',1.0);
    hold on
    p043 = polyfit(dataInv(:,4),mineralAbundNum(:,3),2);
    yp1 = polyval(p043,dataInv(:,4));
    sort = sortrows([dataInv(:,4),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'b--','LineWidth',1.0);
    hold on
    p044 = polyfit(dataInv(:,4),mineralAbundNum(:,4),2);
    yp1 = polyval(p044,dataInv(:,4));
    sort = sortrows([dataInv(:,4),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'c--','LineWidth',1.0);
    hold on
    p045 = polyfit(dataInv(:,4),mineralAbundNum(:,5),2);
    yp1 = polyval(p045,dataInv(:,4));
    sort = sortrows([dataInv(:,4),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'LineStyle','--','Color',[1,0.8,0],'LineWidth',1.0);
    hold on
    for i = 1:size(MareHighlandMarkerPlot,1)
        if MareHighlandMarkerPlot(i) == 1
            scatter(dataInv(i,4),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,4),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,4),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,4),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,4),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
        else
            scatter(dataInv(i,4),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,4),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,4),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,4),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,4),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
        end
    end
    xlabel('7.8 GHz Midnight nT_B Value');ylabel('Measured Oxides Abundance');
    legend('Al_2O_3','CaO','FeO','MgO','TiO_2');

    figure();
    p051 = polyfit(dataInv(:,5),mineralAbundNum(:,1),3);
    yp1 = polyval(p051,dataInv(:,5));
    sort = sortrows([dataInv(:,5),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'r--','LineWidth',0.8);
    hold on
    p052 = polyfit(dataInv(:,5),mineralAbundNum(:,2),2);
    yp1 = polyval(p052,dataInv(:,5));
    sort = sortrows([dataInv(:,5),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'g--','LineWidth',1.0);
    hold on
    p053 = polyfit(dataInv(:,5),mineralAbundNum(:,3),2);
    yp1 = polyval(p053,dataInv(:,5));
    sort = sortrows([dataInv(:,5),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'b--','LineWidth',1.0);
    hold on
    p054 = polyfit(dataInv(:,5),mineralAbundNum(:,4),3);
    yp1 = polyval(p054,dataInv(:,5));
    sort = sortrows([dataInv(:,5),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'c--','LineWidth',1.0);
    hold on
    p055 = polyfit(dataInv(:,5),mineralAbundNum(:,5),2);
    yp1 = polyval(p055,dataInv(:,5));
    sort = sortrows([dataInv(:,5),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'LineStyle','--','Color',[1,0.8,0],'LineWidth',1.0);
    hold on
    for i = 1:size(MareHighlandMarkerPlot,1)
        if MareHighlandMarkerPlot(i) == 1
            scatter(dataInv(i,5),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,5),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,5),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,5),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,5),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
        else
            scatter(dataInv(i,5),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,5),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,5),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,5),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,5),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
        end
    end
    xlabel('19.35 GHz Noon nT_B Value');ylabel('Measured Oxides Abundance');
    legend('Al_2O_3','CaO','FeO','MgO','TiO_2');

    figure();
    p061 = polyfit(dataInv(:,6),mineralAbundNum(:,1),2);
    yp1 = polyval(p061,dataInv(:,6));
    sort = sortrows([dataInv(:,6),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'r--','LineWidth',0.8);
    hold on
    p062 = polyfit(dataInv(:,6),mineralAbundNum(:,2),2);
    yp1 = polyval(p062,dataInv(:,6));
    sort = sortrows([dataInv(:,6),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'g--','LineWidth',1.0);
    hold on
    p063 = polyfit(dataInv(:,6),mineralAbundNum(:,3),2);
    yp1 = polyval(p063,dataInv(:,6));
    sort = sortrows([dataInv(:,6),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'b--','LineWidth',1.0);
    hold on
    p064 = polyfit(dataInv(:,6),mineralAbundNum(:,4),2);
    yp1 = polyval(p064,dataInv(:,6));
    sort = sortrows([dataInv(:,6),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'c--','LineWidth',1.0);
    hold on
    p065 = polyfit(dataInv(:,6),mineralAbundNum(:,5),2);
    yp1 = polyval(p065,dataInv(:,6));
    sort = sortrows([dataInv(:,6),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'LineStyle','--','Color',[1,0.8,0],'LineWidth',1.0);
    hold on
    for i = 1:size(MareHighlandMarkerPlot,1)
        if MareHighlandMarkerPlot(i) == 1
            scatter(dataInv(i,6),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,6),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,6),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,6),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,6),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
        else
            scatter(dataInv(i,6),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,6),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,6),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,6),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,6),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
        end
    end
    xlabel('19.35 GHz Midnight nT_B Value');ylabel('Measured Oxides Abundance');
    legend('Al_2O_3','CaO','FeO','MgO','TiO_2');

    figure();
    p071 = polyfit(dataInv(:,7),mineralAbundNum(:,1),2);
    yp1 = polyval(p071,dataInv(:,7));
    sort = sortrows([dataInv(:,7),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'r--','LineWidth',0.8);
    hold on
    p072 = polyfit(dataInv(:,7),mineralAbundNum(:,2),2);
    yp1 = polyval(p072,dataInv(:,7));
    sort = sortrows([dataInv(:,7),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'g--','LineWidth',1.0);
    hold on
    p073 = polyfit(dataInv(:,7),mineralAbundNum(:,3),2);
    yp1 = polyval(p073,dataInv(:,7));
    sort = sortrows([dataInv(:,7),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'b--','LineWidth',1.0);
    hold on
    p074 = polyfit(dataInv(:,7),mineralAbundNum(:,4),2);
    yp1 = polyval(p074,dataInv(:,7));
    sort = sortrows([dataInv(:,7),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'c--','LineWidth',1.0);
    hold on
    p075 = polyfit(dataInv(:,7),mineralAbundNum(:,5),2);
    yp1 = polyval(p075,dataInv(:,7));
    sort = sortrows([dataInv(:,7),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'LineStyle','--','Color',[1,0.8,0],'LineWidth',1.0);
    hold on
    for i = 1:size(MareHighlandMarkerPlot,1)
        if MareHighlandMarkerPlot(i) == 1
            scatter(dataInv(i,7),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,7),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,7),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,7),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,7),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
        else
            scatter(dataInv(i,7),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,7),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,7),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,7),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,7),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
        end
    end
    xlabel('37.0 GHz Noon nT_B Value');ylabel('Measured Oxides Abundance');
    legend('Al_2O_3','CaO','FeO','MgO','TiO_2');

    figure();
    p081 = polyfit(dataInv(:,8),mineralAbundNum(:,1),2);
    yp1 = polyval(p081,dataInv(:,8));
    sort = sortrows([dataInv(:,8),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'r--','LineWidth',0.8);
    hold on
    p082 = polyfit(dataInv(:,8),mineralAbundNum(:,2),2);
    yp1 = polyval(p082,dataInv(:,8));
    sort = sortrows([dataInv(:,8),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'g--','LineWidth',1.0);
    hold on
    p083 = polyfit(dataInv(:,8),mineralAbundNum(:,3),2);
    yp1 = polyval(p083,dataInv(:,8));
    sort = sortrows([dataInv(:,8),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'b--','LineWidth',1.0);
    hold on
    p084 = polyfit(dataInv(:,8),mineralAbundNum(:,4),2);
    yp1 = polyval(p084,dataInv(:,8));
    sort = sortrows([dataInv(:,8),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'c--','LineWidth',1.0);
    hold on
    p085 = polyfit(dataInv(:,8),mineralAbundNum(:,5),2);
    yp1 = polyval(p085,dataInv(:,8));
    sort = sortrows([dataInv(:,8),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'LineStyle','--','Color',[1,0.8,0],'LineWidth',1.0);
    hold on
    for i = 1:size(MareHighlandMarkerPlot,1)
        if MareHighlandMarkerPlot(i) == 1
            scatter(dataInv(i,8),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,8),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,8),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,8),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,8),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
        else
            scatter(dataInv(i,8),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,8),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,8),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,8),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,8),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
        end
    end
    xlabel('37.0 GHz Midnight nT_B Value');ylabel('Measured Oxides Abundance');
    legend('Al_2O_3','CaO','FeO','MgO','TiO_2');

    figure();
    p091 = polyfit(dataInv(:,9),mineralAbundNum(:,1),2);
    yp1 = polyval(p091,dataInv(:,9));
    sort = sortrows([dataInv(:,9),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'r--','LineWidth',0.8);
    hold on
    p092 = polyfit(dataInv(:,9),mineralAbundNum(:,2),2);
    yp1 = polyval(p092,dataInv(:,9));
    sort = sortrows([dataInv(:,9),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'g--','LineWidth',1.0);
    hold on
    p093 = polyfit(dataInv(:,9),mineralAbundNum(:,3),2);
    yp1 = polyval(p093,dataInv(:,9));
    sort = sortrows([dataInv(:,9),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'b--','LineWidth',1.0);
    hold on
    p094 = polyfit(dataInv(:,9),mineralAbundNum(:,4),2);
    yp1 = polyval(p094,dataInv(:,9));
    sort = sortrows([dataInv(:,9),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'c--','LineWidth',1.0);
    hold on
    p095 = polyfit(dataInv(:,9),mineralAbundNum(:,5),2);
    yp1 = polyval(p095,dataInv(:,9));
    sort = sortrows([dataInv(:,9),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'LineStyle','--','Color',[1,0.8,0],'LineWidth',1.0);
    hold on
    for i = 1:size(MareHighlandMarkerPlot,1)
        if MareHighlandMarkerPlot(i) == 1
            scatter(dataInv(i,9),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,9),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,9),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,9),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,9),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
        else
            scatter(dataInv(i,9),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,9),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,9),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,9),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,9),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
        end
    end
    xlabel('3.0 GHz ndT_B Value');ylabel('Measured Oxides Abundance');
    legend('Al_2O_3','CaO','FeO','MgO','TiO_2');

    figure();
    p101 = polyfit(dataInv(:,10),mineralAbundNum(:,1),3);
    yp1 = polyval(p101,dataInv(:,10));
    sort = sortrows([dataInv(:,10),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'r--','LineWidth',0.8);
    hold on
    p102 = polyfit(dataInv(:,10),mineralAbundNum(:,2),2);
    yp1 = polyval(p102,dataInv(:,10));
    sort = sortrows([dataInv(:,10),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'g--','LineWidth',1.0);
    hold on
    p103 = polyfit(dataInv(:,10),mineralAbundNum(:,3),2);
    yp1 = polyval(p103,dataInv(:,10));
    sort = sortrows([dataInv(:,10),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'b--','LineWidth',1.0);
    hold on
    p104 = polyfit(dataInv(:,10),mineralAbundNum(:,4),2);
    yp1 = polyval(p104,dataInv(:,10));
    sort = sortrows([dataInv(:,10),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'c--','LineWidth',1.0);
    hold on
    p105 = polyfit(dataInv(:,10),mineralAbundNum(:,5),2);
    yp1 = polyval(p105,dataInv(:,10));
    sort = sortrows([dataInv(:,10),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'LineStyle','--','Color',[1,0.8,0],'LineWidth',1.0);
    hold on
    for i = 1:size(MareHighlandMarkerPlot,1)
        if MareHighlandMarkerPlot(i) == 1
            scatter(dataInv(i,10),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,10),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,10),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,10),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,10),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
        else
            scatter(dataInv(i,10),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,10),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,10),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,10),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,10),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
        end
    end
    xlabel('7.8 GHz ndT_B Value');ylabel('Measured Oxides Abundance');
    legend('Al_2O_3','CaO','FeO','MgO','TiO_2');

    figure();
    p111 = polyfit(dataInv(:,11),mineralAbundNum(:,1),2);
    yp1 = polyval(p111,dataInv(:,11));
    sort = sortrows([dataInv(:,11),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'r--','LineWidth',0.8);
    hold on
    p112 = polyfit(dataInv(:,11),mineralAbundNum(:,2),2);
    yp1 = polyval(p112,dataInv(:,11));
    sort = sortrows([dataInv(:,11),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'g--','LineWidth',1.0);
    hold on
    p113 = polyfit(dataInv(:,11),mineralAbundNum(:,3),2);
    yp1 = polyval(p113,dataInv(:,11));
    sort = sortrows([dataInv(:,11),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'b--','LineWidth',1.0);
    hold on
    p114 = polyfit(dataInv(:,11),mineralAbundNum(:,4),2);
    yp1 = polyval(p114,dataInv(:,11));
    sort = sortrows([dataInv(:,11),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'c--','LineWidth',1.0);
    hold on
    p115 = polyfit(dataInv(:,11),mineralAbundNum(:,5),2);
    yp1 = polyval(p115,dataInv(:,11));
    sort = sortrows([dataInv(:,11),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'LineStyle','--','Color',[1,0.8,0],'LineWidth',1.0);
    hold on
    for i = 1:size(MareHighlandMarkerPlot,1)
        if MareHighlandMarkerPlot(i) == 1
            scatter(dataInv(i,11),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,11),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,11),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,11),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,11),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
        else
            scatter(dataInv(i,11),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,11),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,11),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,11),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,11),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
        end
    end
    xlabel('19.35 GHz ndT_B Value');ylabel('Measured Oxides Abundance');
    legend('Al_2O_3','CaO','FeO','MgO','TiO_2');

    figure();
    p121 = polyfit(dataInv(:,12),mineralAbundNum(:,1),2);
    yp1 = polyval(p121,dataInv(:,12));
    sort = sortrows([dataInv(:,12),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'r--','LineWidth',0.8);
    hold on
    p122 = polyfit(dataInv(:,12),mineralAbundNum(:,2),2);
    yp1 = polyval(p122,dataInv(:,12));
    sort = sortrows([dataInv(:,12),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'g--','LineWidth',1.0);
    hold on
    p123 = polyfit(dataInv(:,12),mineralAbundNum(:,3),3);
    yp1 = polyval(p123,dataInv(:,12));
    sort = sortrows([dataInv(:,12),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'b--','LineWidth',1.0);
    hold on
    p124 = polyfit(dataInv(:,12),mineralAbundNum(:,4),2);
    yp1 = polyval(p124,dataInv(:,12));
    sort = sortrows([dataInv(:,12),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'c--','LineWidth',1.0);
    hold on
    p125 = polyfit(dataInv(:,12),mineralAbundNum(:,5),2);
    yp1 = polyval(p125,dataInv(:,12));
    sort = sortrows([dataInv(:,12),yp1]);
    xq = linspace(min(sort(:,1)),max(sort(:,1)),100);
    vq2 = interp1(sort(:,1),sort(:,2),xq,'spline');
    plot(xq,vq2,'LineStyle','--','Color',[1,0.8,0],'LineWidth',1.0);
    hold on
    for i = 1:size(MareHighlandMarkerPlot,1)
        if MareHighlandMarkerPlot(i) == 1
            scatter(dataInv(i,12),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,12),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,12),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,12),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
            scatter(dataInv(i,12),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','^')
            box on
            hold on
        else
            scatter(dataInv(i,12),mineralAbundNum(i,1),sz,'filled','MarkerEdgeColor','r','MarkerFaceColor','r','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,12),mineralAbundNum(i,2),sz,'filled','MarkerEdgeColor','g','MarkerFaceColor','g','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,12),mineralAbundNum(i,3),sz,'filled','MarkerEdgeColor','b','MarkerFaceColor','b','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,12),mineralAbundNum(i,4),sz,'filled','MarkerEdgeColor','c','MarkerFaceColor','c','LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
            scatter(dataInv(i,12),mineralAbundNum(i,5),sz,'filled','MarkerEdgeColor',[1,0.8,0],'MarkerFaceColor',[1,0.8,0],'LineWidth',MarkerWidth,'Marker','o')
            box on
            hold on
        end
    end
    xlabel('37.0 GHz ndT_B Value');ylabel('Measured Oxides Abundance');
    legend('Al_2O_3','CaO','FeO','MgO','TiO_2');
end