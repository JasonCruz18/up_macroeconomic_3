%__________________________________________________________________________
%                           MACROECONOMÍA III
%                    Laboratorio #2: Coding Task 2
%__________________________________________________________________________
%            La Demanda de Dinero durante las Hiperinflaciones
%                     bajo Expectaticas Racionales
%__________________________________________________________________________

%.........................................................................
% Autor: Jason Cruz
%.........................................................................

%.........................................................................
% Program (script): sargent_77.mod
%  - First Created: 18/10/23
%  - Last Updated:  20/10/23
%.........................................................................


%%--------------------------------------------------------------------------
%% Sargent (1977)
%%--------------------------------------------------------------------------

// Este programa resuelve y simula el modelo de
// "The Demand for Money during Hyperinflations under Rational Expectations: I" de (Sargent, 1977).
// Este programa sirve principalmente como proceso de generación de datos para la estimación del modelo en sargent_77_ml.mod y sargent_77_bayesiano.mod.
// Las variables se definen como sigue:
// x = p_t - p_{t-1}, siendo p el logaritmo del nivel de precios.
// mu = m_t - m_{t-1}, siendo m el logaritmo de la oferta monetaria.
// Nótese que, a diferencia del paper, eta y epsilon tienen varianza 1 (se multiplican por las desviaciones típicas).


%**************************************************************************
% 1. Variables endógenas, exógenas y parámetros                                                        
%**************************************************************************

var % comando de entrada para establecer las variables endógenas

x   % tasa de inflación
mu  % tasa porcentual de incremento de la oferta monetaria
a_1  % variable aleatoria (error de previsión con un período de antelación para x)
a_2  % variable aleatoria (error de previsión con un período de antelación para x)
; 

varexo  % comando de entrada para establecer las variables exógenas

epsilon % término de error de la inflación
eta     % término de error del incremento monetario
;

parameters % comando de entrada para establecer las variables exógenas

alpha   
lambda
sigma_eta
sigma_epsilon
;


%--------------------------------------------------------------------------
% Definimos los parámetros
%--------------------------------------------------------------------------

lambda = .5921;
alpha = -2.344;
sigma_eta = .001;
sigma_epsilon = .001;


%..........................................................................
% Nota: Alternativamente, para definir los parámetros, puede usar el comando
% params. Un uso de este sería algo como: params.alpha = 0.5;
%..........................................................................


%**************************************************************************
% 2. El modelo                                                        
%**************************************************************************

// Se tomaron las ecuaciones (27) y (28) de la página 69 del paper.
// Corresponden a las ecuaciones (7) y (8) de la Coding Task 2 de la PD#7.

model;
x = x(-1)-lambda*a_1(-1)+(1/(lambda+alpha*(1-lambda)))*sigma_epsilon*epsilon-(1/(lambda+alpha*(1-lambda)))*sigma_eta*eta;
mu = (1-lambda)*x(-1)+lambda*mu(-1)-lambda*a_2(-1)+(1+alpha*(1-lambda))/(lambda+alpha*(1-lambda))*sigma_epsilon*epsilon-(1-lambda)/(lambda+alpha*(1-lambda))*sigma_eta*eta;
a_1 = (1/(lambda+alpha*(1-lambda)))*sigma_epsilon*epsilon-(1/(lambda+alpha*(1-lambda)))*sigma_eta*eta;
a_2 = (1+alpha*(1-lambda))/(lambda+alpha*(1-lambda))*sigma_epsilon*epsilon-(1-lambda)/(lambda+alpha*(1-lambda))*sigma_eta*eta;
end;

%**************************************************************************
% 3. Estado estacionario                                                       
%**************************************************************************

steady;


%**************************************************************************
% 4. Shocks
%**************************************************************************

shocks;

var eta;
stderr 1;
var epsilon;
stderr 1;
end;

%**************************************************************************
% 5. Simulación estocástica del modelo                                               
%**************************************************************************

// Calculamos la solución estocástica de la inflación y el crecimiento monetario 

stoch_simul(drop=0, order=1, periods=33, irf= 0);
%stoch_simul(graph, irf= 33);

%**************************************************************************
% 6. Guardando la data
%**************************************************************************

save data_hyperinflation.mat x mu;

