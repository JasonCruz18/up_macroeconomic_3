%%_________________________________________________________________________
%% MACROECONOMÍA III
%% PD #1: Problema 3 (Coding Task)
%%_________________________________________________________________________
%%                  Hechos Estilizados y Correlatos del
%%                          Crecimiento Económico
%%_________________________________________________________________________

%%.........................................................................
%% Autor(es): Jason Cruz & Kevin Risco
%%.........................................................................

%%.........................................................................
%% Program (script): he_correlatos_crecimiento.m
%%  - First Created: 11/08/23
%%  - Last Updated:  17/08/23
%%.........................................................................

%--------------------------------------------------------------------------
% Basado en (Carlos Rojas, 2021)
%--------------------------------------------------------------------------
% Este script contiene la replicación de algunos Hechos Estilizados (HE) y
% correlatos del crecimiento económico. Las novedades respecto del Notebook
% de Python son los CORRELATOS y las densidades del PBI per cápita. Además,
% a diferencia del Notebook, incorporamos un país de la Unión Europea (UE)
% y otro que se retiró. Estamos interesados en explorar las PWT para el
% análisis de los grandes ratios y variables macro.
%--------------------------------------------------------------------------

clear all;
clc;
close all;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Distribuciones
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%**************************************************************************
% 1. Distribución del PIB per capita                                                       
%**************************************************************************

GDP_pc = xlsread('pwt_parsed.xlsx','Graphs','B9:E191');
pts=[0:100:80000];
Dist1960=GDP_pc(:,1);
Dist1960(any(isnan(Dist1960),2), :) = [];
[F60,X60]=ksdensity(Dist1960,pts);
Dist1980=GDP_pc(:,2);
Dist1980(any(isnan(Dist1980),2), :) = [];
[F80,X80]=ksdensity(Dist1980,pts);
Dist2000=GDP_pc(:,3);
Dist2000(any(isnan(Dist2000),2), :) = [];
Dist2000=Dist2000(any(Dist2000,2),:);
[F00,X00]=ksdensity(Dist2000,pts);
Dist2019=GDP_pc(:,4);
Dist2019(any(isnan(Dist2019),2), :) = [];
[F19,X19]=ksdensity(Dist2019,pts);

%----------------------------
% Figura 1
%----------------------------

figure(1)
plot(X60,F60,'Color',[216 , 17, 89]/255,'LineWidth',2.15);
hold on
plot(X80,F80,'Color',[21, 128, 120]/255,'LineWidth',2.15);
plot(X00,F00,'Color',[48, 102, 190]/255,'LineWidth',2.15);
plot(X19,F19,'Color',[9, 12, 155]/255,'LineWidth',2.15);
xticks([0 20000 40000 60000 80000])
xticklabels({'0','20000','40000','60000','80000'})
yticks([])
title('Dist. del $PIB_{pc}$','FontName','Serif','FontSize', 12,'interpreter','latex')
xlabel('US$ 2017','FontName','Serif','FontSize', 12);
ylabel('Densidad','FontName','Serif','FontSize', 12);
legend('1960','1980','2000','2019','FontName','Serif','FontSize', 10,'Location','Northeast','Orientation','vertical')
saveas(gcf,'densidad_pbi_pc','pdf')
saveas(gcf,'densidad_pbi_pc','png');


%**************************************************************************
% 2. Distribución del Log PIB per capita                                                   
%**************************************************************************

pts=[5:0.05:13];
Dist1960=log(Dist1960);
[F60,X60]=ksdensity(Dist1960,pts);
Dist1980=log(Dist1980);
[F80,X80]=ksdensity(Dist1980,pts);
Dist2000=log(Dist2000);
[F00,X00]=ksdensity(Dist2000,pts);
Dist2019=log(Dist2019);
[F19,X19]=ksdensity(Dist2019,pts);

%----------------------------
% Figura 2
%----------------------------

figure(2)
plot(X60,F60,'Color',[216 , 17, 89]/255,'LineWidth',2.15);
hold on
plot(X80,F80,'Color',[21, 128, 120]/255,'LineWidth',2.15);
plot(X00,F00,'Color',[48, 102, 190]/255,'LineWidth',2.15);
plot(X19,F19,'Color',[9, 12, 155]/255,'LineWidth',2.15);
xticks([6 8 10 12])
xticklabels({'6','8','10','12'})
yticks([])
title('Dist. del $\log(PIB_{pc})$','FontName','Serif','FontSize', 12,'interpreter','latex')
xlabel('$\log(PIB_{pc})$','FontName','Serif','FontSize', 12,'interpreter','latex');
ylabel('Densidad','FontName','Serif','FontSize', 12);
legend('1960','1980','2000','2019','FontName','Serif','FontSize', 10,'Location','Northeast','Orientation','vertical')
saveas(gcf,'densidad_log_pbi_pc','pdf')
saveas(gcf,'densidad_log_pbi_pc','png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Correlatos del crecimiento económico
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%**************************************************************************
% 3. PBI y Consumo                                               
%**************************************************************************

clear all;
clc;

IW_pc = xlsread('pwt_parsed.xlsx','Graphs','J9:K191');
GDP=IW_pc(:,1);
Consump=IW_pc(:,2);

[~,Yhat]=ols_2(Consump,GDP,1,0.05); % regresión OLS

%----------------------------
% Figura 3
%----------------------------

figure(3)
scatter(GDP,Consump,'MarkerEdgeColor',[9, 12, 155]/255,...
            'MarkerFaceColor',[9, 12, 155]/255,...
            'LineWidth',0.75);
hold on;
plot(GDP,Yhat,'k','LineWidth',0.75);
hold off;
xlabel('$\log(PIB_{pc})$, 2019','FontName','Serif','FontSize', 12,'interpreter','latex')
ylabel('$\log(Consumo_{pc})$, 2019','FontName','Serif','FontSize', 12,'interpreter','latex')
title('Ingreso y bienestar (consumo)','FontName','Serif','FontSize', 12)
saveas(gcf,'pbi_pc_consumo','pdf')
saveas(gcf,'pbi_pc_consumo','png');

%**************************************************************************
% 4. PBI e Inversión                                              
%**************************************************************************

clear all;
clc;

Base = xlsread('pwt_parsed.xlsx','Graphs','AJ9:AP191');
IY19=Base(:,[2,6]);
IY19(any(isnan(IY19),2), :) = [];
HC19=Base(:,[4,6]);
HC19(any(isnan(HC19),2), :) = [];
SY=[Base(:,[6,7])];
SY(any(isnan(SY),2), :) = [];

[~,Yhat]=ols_2(IY19(:,2),IY19(:,1),1,0.05); % regresión OLS

%----------------------------
% Figura 4
%----------------------------

figure(4)
SS=scatter(IY19(:,1),IY19(:,2),'MarkerEdgeColor',[9, 12, 155]/255,...
            'MarkerFaceColor',[9, 12, 155]/255,...
            'LineWidth',0.75);
hold on;
plot(IY19(:,1),Yhat,'k','LineWidth',0.75);
hold off;
xlabel('$\left(\frac{I}{Y}\right)$, promedio 1960-2019','FontName','Serif','FontSize', 12,'interpreter','latex')
ylabel('$\Delta PIB_{pc}$, promedio 1960-2019','FontName','Serif','FontSize', 12,'interpreter','latex')
title('Factores correlacionados, inversion','FontName','Serif','FontSize', 12)
saveas(gcf,'pbi_pc_inversion','pdf')
saveas(gcf,'pbi_pc_inversion','png');

%**************************************************************************
% 5. PBI y Capital Humano                                             
%**************************************************************************

[~,Yhat]=ols_2(HC19(:,2),HC19(:,1),1,0.05); % regresión OLS

%----------------------------
% Figura 5
%----------------------------

figure(5)
SS=scatter(HC19(:,1),HC19(:,2),'MarkerEdgeColor',[9, 12, 155]/255,...
            'MarkerFaceColor',[9, 12, 155]/255,...
            'LineWidth',0.75);
hold on;
plot(HC19(:,1),Yhat,'k','LineWidth',0.75);
hold off;
xlabel('$HC$, promedio 1960-2019','FontName','Serif','FontSize', 12,'interpreter','latex')
ylabel('$\Delta PIB_{pc}$, promedio 1960-2019','FontName','Serif','FontSize', 12,'interpreter','latex')
title('Factores correlacionados, capital humano','FontName','Serif','FontSize', 12)
saveas(gcf,'pbi_pc_capital_humano','pdf')
saveas(gcf,'pbi_pc_capital_humano','png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Evolución del PIB per cápita según pwt_parsed 10.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

Countries={'United States' 'United Kingdom' 'Spain' 'Brazil' 'South Korea' 'Peru' 'Chile' 'China'};
Identifiers={'USA', 'UK', 'ESP', 'BRA', 'KOR', 'PER', 'CHI', 'CHN'};
GDP_pc = xlsread('pwt_parsed.xlsx','EvolutionPWT','B6:I65');
[T,N]=size(GDP_pc);
sample=[1960:1:1960+T-1];

%----------------------------
% Figura 6
%----------------------------

figure(6)
plot(sample,GDP_pc(:,1),'Color',[216 , 17, 89]/255,'LineWidth',2.15)
hold on;
plot(sample,GDP_pc(:,2), 'Color',[21, 128, 120]/255,'LineWidth',2.15)
plot(sample,GDP_pc(:,3), '-.', 'Color',[21, 128, 120]/255,'LineWidth',2.15)
plot(sample,GDP_pc(:,4), 'Color',[48, 102, 190]/255,'LineWidth',2.15)
plot(sample,GDP_pc(:,5), 'Color',[9, 12, 155]/255,'LineWidth',2.15)
plot(sample,GDP_pc(:,6), 'Color',[180, 197, 228]/255,'LineWidth',2.15)
plot(sample,GDP_pc(:,7), '-.', 'Color',[48, 102, 190]/255,'LineWidth',2.15)
plot(sample,GDP_pc(:,8), '-.', 'Color',[9, 12, 155]/255,'LineWidth',2.15)
title('Evolución del PIB pc','FontName','Serif','FontSize', 14)
xlabel('Años','FontName','Serif','FontSize', 14);
ylabel('Log PIB pc','FontName','Serif','FontSize', 14);
legend(Identifiers(1,[1:8]),'FontName','Serif','FontSize', 10,'Location','southoutside','Orientation','horizontal','NumColumns',5)
saveas(gcf,'evolucion_pbi_pc_pwt_parsed','pdf')
saveas(gcf,'evolucion_pbi_pc_pwt_parsed','png');

%__________________________________________________________________________
% FIN
%..........................................................................


R = [4 7; 5 8; 9 3; 12 0; 1 5];
lagmatrix(R ,1:3)
