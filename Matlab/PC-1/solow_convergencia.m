%%_________________________________________________________________________
%% MACROECONOMÍA III
%% PC#1: Problemas Cortos (Coding Task)
%%_________________________________________________________________________
%%                  Convergencia Absoluta y Condicional
%%_________________________________________________________________________

%%.........................................................................
%% Autor(es): Jason Cruz & Kevin Risco
%%.........................................................................

%%.........................................................................
%% Program (script): solow_convergencia.m
%%  - First Created: 29/08/23
%%  - Last Updated:  30/08/23
%%.........................................................................

%--------------------------------------------------------------------------
% Basado en (Carlos Rojas, 2021)
%--------------------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 0. Configuración inicial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;
close all;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1. Parsing Data - Baumol
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------
%   La muestra de Baumol contiene la data del PBI pc para los países:
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% Japan, Finland, Sweden, Norway, Germany, Italy, Austria, France, Canada, 
% Denmark, the United States, the Netherlands, Switzerland, Belgium, 
% the United Kingdom, and Australia
%--------------------------------------------------------------------------

load pbi_pc_1870_2018.mat

%**************************************************************************
% 1.1. Generamos la variable explicativa 1 y explicada 1 para la regresión                                          
%**************************************************************************

t_start = 1870; % año de incio de la muestra
t_end = 1979; % año de fin de la muestra
sample =[35, 20, 56, 44, 14, 32, 4, 21, 8, 15, 63, 43, 9, 5, 22, 3]; % muestra

for i = 1:length(sample) % intervalo desde 1 hasta el tamaño de la muestra
% X axis: log(GDPpc)
X(i,1) = log(BarroEq(sample(i),1)); % definición de la variable explicativa 1

% Y axis: log(GDPpc 2018/GDPpc 1870)
if t_end == 1979
    j=2;
elseif t_end == 2018
    j=3;
else
    disp('Elige entre 1979 y 2018 únicamente');
end
Y(i,1) = log(BarroEq(sample(i),j)./BarroEq(sample(i),1)); % definición de la variable explicada 1
end

%..........................................................................
% 1.1.1. Regresión OLS para Yhat                                         
%..........................................................................

[~, Yhat1] = ols_2(Y, X, 1, 0.05);

%**************************************************************************
% 1.2. Generamos la variable explicativa 2 y explicada 2 para la regresión                                          
%**************************************************************************

t_end = 2018;
for i=1:length(sample)
% X axis: log(GDPpc)
X2(i,1) = log(BarroEq(sample(i),1));

% Y axis: log(GDPpc2018/GDPpc1870)
if t_end == 1979
    j=2;
elseif t_end == 2018
    j=3;
else
    disp('Elige entre 1979 y 2018 únicamente');
end
Y2(i,1) = log(BarroEq(sample(i),j)./BarroEq(sample(i),1));
end

%..........................................................................
% 1.2.1. Regresión OLS para Yhat2                                         
%..........................................................................

[~,Yhat2] = ols_2(Y2,X2,1,0.05);

%----------------------------
% Figura 1
%----------------------------

figure(1)
scatter(X,Y,'MarkerEdgeColor',[9, 12, 155]/255,...
            'MarkerFaceColor',[9, 12, 155]/255,...
            'LineWidth',0.75);
hold on;
scatter(X2,Y2,'MarkerEdgeColor',[216 , 17, 89]/255,...
              'MarkerFaceColor',[216 , 17, 89]/255,...
              'LineWidth',0.75);
plot(X,Yhat1,'k','LineWidth',0.75);
plot(X,Yhat2,'k','LineWidth',0.75);
hold off;
xlabel('Log del PIB en 1870','FontName','Serif','FontSize', 14)
ylabel('Diferencia logarítmica','FontName','Serif','FontSize', 14)
title('Muestra de Baumol','FontName','Serif','FontSize', 14)
legend('1870-1979','1870-2018')
saveas(gcf,'muestra_baumol','pdf')
saveas(gcf,'muestra_baumol','png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2. Parsing Data - De Long
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------
%   La muestra de De Long contiene la data del PBI pc para los países:
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% Finland, Sweden, Norway, Germany, Italy, Austria, France, Canada, 
% Denmark, the United States, the Netherlands, Switzerland, Belgium, 
% the United Kingdom, and Australia
% Argentina, Chile, East Germany, Ireland, New Zealand, Portugal, and Spain.
%--------------------------------------------------------------------------

%**************************************************************************
% 2.1. Generamos la variable explicativa 3 y explicada 3 para la regresión                                          
%**************************************************************************

t_start = 1870;
t_end = 1979;
sample = [20, 56, 44, 14, 32, 4, 21, 8, 15, 63, 43, 9, 5,...
    22, 3, 2, 10, 29, 46, 51, 19]; % 

for i = 1:length(sample)
% X axis: log(GDPpc)
X3(i,1) = log(BarroEq(sample(i),1));

% Y axis: log(GDPpc2018/GDPpc1870)
if t_end == 1979
    j=2;
elseif t_end == 2018
    j=3;
else
    disp('Elige entre 1979 y 2018 únicamente');
end
Y3(i,1) = log(BarroEq(sample(i),j)./BarroEq(sample(i),1));
end

%..........................................................................
% 2.1.1. Regresión OLS para Yhat3                                      
%..........................................................................

[~,Yhat3] = ols_2(Y3,X3,1,0.05);

%**************************************************************************
% 2.2. Generamos la variable explicativa 4 y explicada 4 para la regresión                                          
%**************************************************************************

t_end = 2018;
for i = 1:length(sample)
% X axis: log(GDPpc)
X4(i,1) = log(BarroEq(sample(i),1));

% Y axis: log(GDPpc2018/GDPpc1870)
if t_end == 1979
    j=2;
elseif t_end == 2018
    j=3;
else
    disp('Elige entre 1979 y 2018 únicamente');
end
Y4(i,1) = log(BarroEq(sample(i),j)./BarroEq(sample(i),1));
end

%..........................................................................
% 2.2.1. Regresión OLS para Yhat4                                         
%..........................................................................

[~,Yhat4] = ols_2(Y4,X4,1,0.05);

%----------------------------
% Figura 2
%----------------------------

figure(2)
scatter(X,Y,'MarkerEdgeColor',[9, 12, 155]/255,...
            'MarkerFaceColor',[9, 12, 155]/255,...
            'LineWidth',0.75);
hold on;
scatter(X3,Y3,'MarkerEdgeColor',[9, 12, 155]/255,...
            'LineWidth',0.75);        
scatter(X2,Y2,'MarkerEdgeColor',[216 , 17, 89]/255,...
            'MarkerFaceColor',[216 , 17, 89]/255,...
            'LineWidth',0.75);
scatter(X4,Y4,'MarkerEdgeColor',[216 , 17, 89]/255,...  
              'LineWidth',0.75);        
plot(X3,Yhat3,'k','LineWidth',0.75);
plot(X4,Yhat4,'k','LineWidth',0.75);
hold off;
xlabel('Log del PIB en 1870','FontName','Serif','FontSize', 14)
ylabel('Diferencia logarítmica','FontName','Serif','FontSize', 14)
title('Muestra de De Long','FontName','Serif','FontSize', 14)
legend('1870-1979','1870-1979: nuevos países','1870-2018','1870-2018: nuevos países')
saveas(gcf,'muestra_deLong','pdf')
saveas(gcf,'muestra_deLong','png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 3. Parsing Data - Maddison
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%**************************************************************************
% 3.1. Generamos la variable explicativa 5 y explicada 5 para la regresión                                          
%**************************************************************************

t_start = 1870;
t_end = 1979;
% X axis: log(GDPpc)
X5(:,1) = log(BarroEq(:,1));
% Y axis: log(GDPpc2018/GDPpc1870)
Y5(:,1) = log(BarroEq(:,2)./BarroEq(:,1));

%..........................................................................
% 3.1.1. Regresión OLS para Yhat5                                  
%..........................................................................

[~,Yhat5] = ols_2(Y5,X5,1,0.05);

%**************************************************************************
% 3.2. Generamos la variable explicativa 6 y explicada 6 para la regresión                                          
%**************************************************************************

t_end = 2018;
% X axis: log(GDPpc)
X6(:,1) = log(BarroEq(:,1));
% Y axis: log(GDPpc2018/GDPpc1870)
Y6(:,1) = log(BarroEq(:,3)./BarroEq(:,1));

%..........................................................................
% 3.2.1. Regresión OLS para Yhat6                                
%..........................................................................

[~,Yhat6] = ols_2(Y6,X6,1,0.05);

%----------------------------
% Figura 3
%----------------------------

figure(3)
scatter(X3,Y3,'MarkerEdgeColor',[9, 12, 155]/255,...
            'MarkerFaceColor',[9, 12, 155]/255,...
            'LineWidth',0.75);
hold on;
scatter(X5,Y5,'MarkerEdgeColor',[9, 12, 155]/255,...
            'LineWidth',0.75);        
scatter(X4,Y4,'MarkerEdgeColor',[216 , 17, 89]/255,...
            'MarkerFaceColor',[216 , 17, 89]/255,...
            'LineWidth',0.75);
scatter(X6,Y6,'MarkerEdgeColor',[216 , 17, 89]/255,...  
              'LineWidth',0.75);        
plot(X5,Yhat5,'k','LineWidth',0.75);
plot(X6,Yhat6,'k','LineWidth',0.75);
hold off;
xlabel('Log del PIB en 1870','FontName','Serif','FontSize', 14)
ylabel('Diferencia logarítmica','FontName','Serif','FontSize', 14)
title('Muestra de Maddison','FontName','Serif','FontSize', 14)
legend('1870-1979','1870-1979: nuevos países','1870-2018','1870-2018: nuevos países')
saveas(gcf,'muestra_maddison','pdf')
saveas(gcf,'muestra_maddison','png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 4. Parsing Data - Economías en desarrollo vs desarrolladas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------
% IMF classification 
% (see: https://en.wikipedia.org/wiki/Developing_country)
% Source: WEO database, october 2018
%--------------------------------------------------------------------------

%__________________________________________________________________________
% Economías en Desarrollo
%__________________________________________________________________________

%**************************************************************************
% 4.1. Generamos la variable explicativa 7 y explicada 7 para la regresión                                          
%**************************************************************************

t_start = 1870;
t_end = 2018;
sample = [1     2     7    10    11    12    16    17    18    23    26   ...
    27    28    30    31    33    34    37    38    39    40    41  ...
    42    45    47    48    49    50    52    53    54    57    58  ...
    59    60    61    62    64    65    67]; % Economías en Desarrollo

for i = 1:length(sample)
% X axis: log(GDPpc)
X7(i,1) = log(BarroEq(sample(i),1));
% Y axis: log(GDPpc2018/GDPpc1870)
if t_end == 1979
    j=2;
elseif t_end == 2018
    j=3;
else
    disp('Elige entre 1979 y 2018 únicamente');
end
Y7(i,1) = log(BarroEq(sample(i),j)./BarroEq(sample(i),1));
end

%..........................................................................
% 4.1.1. Regresión OLS para Yhat7                            
%..........................................................................

[~,Yhat7]=ols_2(Y7,X7,1,0.05);

%__________________________________________________________________________
% Economías Desarrolladas
%__________________________________________________________________________

%**************************************************************************
% 4.2. Generamos la variable explicativa 8 y explicada 8 para la regresión                                          
%**************************************************************************

sample = [3     4     5     6     8     9    13    14    15    19    20   ...
    21    22    24    25    29    32    35    36    43    44    46  ...
    51    55    56    63    66]; % Economías Desarrolladas

for i = 1:length(sample)
% X axis: log(GDPpc)
X8(i,1) = log(BarroEq(sample(i),1));
% Y axis: log(GDPpc2018/GDPpc1870)
if t_end == 1979
    j=2;
elseif t_end == 2018
    j=3;
else
    disp('Elige entre 1979 y 2018 únicamente');
end
Y8(i,1) = log(BarroEq(sample(i),j)./BarroEq(sample(i),1));
end

%..........................................................................
% 4.2.1. Regresión OLS para Yhat8                            
%..........................................................................

[~,Yhat8] = ols_2(Y8,X8,1,0.05);

%----------------------------
% Figura 4
%----------------------------

figure(4)
scatter(X7,Y7,'MarkerEdgeColor',[9, 12, 155]/255,...
            'MarkerFaceColor',[9, 12, 155]/255,...
            'LineWidth',0.75);
hold on;
scatter(X8,Y8,'MarkerEdgeColor',[216 , 17, 89]/255,...
            'MarkerFaceColor',[216 , 17, 89]/255,...
            'LineWidth',0.75);      
plot(X7,Yhat7,'k','LineWidth',0.75);
plot(X8,Yhat8,'k','LineWidth',0.75);
hold off;
xlabel('Logaritmo del PIB per cápita en 1870','FontName','Serif','FontSize', 16)
ylabel('Tasa de crecimiento (1870-2018)','FontName','Serif','FontSize', 16)
title('Economías en Desarrollo vs Desarrolladas','FontName','Serif','FontSize', 24)
legend('En Desarrollo','Desarrolladas', 'FontName','Serif','FontSize', 14,'Location','best','Orientation','horizontal','NumColumns',5)
saveas(gcf,'convergencia_economias_endesarrollo_desarrolladas','pdf')
saveas(gcf,'convergencia_economias_endesarrollo_desarrolladas','png');
    
%__________________________________________________________________________
% FIN
%..........................................................................

