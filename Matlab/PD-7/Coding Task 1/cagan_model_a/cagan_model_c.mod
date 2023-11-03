%__________________________________________________________________________
%                           MACROECONOMÍA III
%                   Laboratorio #2 (PD#7): Coding Task 1 c)
%__________________________________________________________________________
%           Modelo de Cagan: expectativas adaptativas y racionales
%__________________________________________________________________________

%.........................................................................
% Program (script): cagan_a.mod
%  - First Created: 23/10/23
%  - Last Updated:  23/10/23
%.........................................................................

%%--------------------------------------------------------------------------
%% Cagan (1956)
%%--------------------------------------------------------------------------

// Este programa resuelve y simula la coding task 1 de la PD#7 bajo el modelo
// de Cagan incluyendo expectativas adaptativas y racionales. Este programa
// está basado en las notas de clase "Rational Expectations" del profesor
// Gonzalo Llosa.


%**************************************************************************
% 1. Variables endógenas, exógenas y parámetros                                                        
%**************************************************************************

var % Comando de entrada para establecer las variables endógenas.

p   % Logaritmo del nivel de precios.
m   % Logaritmo del stock de dinero (oferta monetaria).
;

varexo  % Comando de entrada para establecer las variables exógenas.

u;  % Variable aleatoria (ruido blanco).

parameters  % Comando para establecer los parámetros.

alpha       % Parámetro del logaritmo del nivel de precios esperados.
beta        % Parámetro del logaritmo del stock de dinero.
mbar        % Constante del proceso AR(1) del logaritmo del stock de dinero.
lambda_1    % Parámetro del proceso AR(1) asociado al primer rezago.
lambda_2    % Parámetro del proceso AR(1) asociado al primer rezago.
;


%--------------------------------------------------------------------------
% Definimos los parámetros
%--------------------------------------------------------------------------

alpha = 0.5;
beta = 0.5;
mbar = 2.0;
lambda_1 = 0.9;     % (Se cumple que |lambda|<1).
lambda_2 = -0.1;    % (Se cumple que |lambda|<1).


%**************************************************************************
% 2. El modelo                                                        
%**************************************************************************

// Corresponden a las ecuaciones (1) y (2) de la Coding Task 1 de la PD#7.

model(linear);  % Resuelve el model (opción lineal o no lineal).
p = 0.5*alpha*p(+1) + 0.5*alpha*p(-1) + beta*m; 
m = mbar + lambda_1*m(-1) + lambda_2*m(-2) + u; 
end;

%--------------------------------------------------------------------------
% Nota: En el caso no lineal, dynare recurrirá a métodos numéricos sofisticados.
%--------------------------------------------------------------------------


%**************************************************************************
% 3. Valores Iniciales
%**************************************************************************

initval;    % Comando que declara los valores iniciales para que dynare solucione el modelo.
p = 8;       
m = 4;      
end;

%--------------------------------------------------------------------------
% Nota: Una alternativa a "initval" es resolver el estado estacionario de las
//      variables a mano y ponerlos como valores iniciales. Se verá más adelante.
%--------------------------------------------------------------------------


%**************************************************************************
% 4. Estado estacionario                                                       
%**************************************************************************

steady; 

%--------------------------------------------------------------------------
% Nota: Para que Dynare calcule el estado estacionario por el método de Newton
//      se coloca el comando "steady" después del bloque del modelo. Para ello
//      considera como punto inicial los valores que se indiquen en la sección
//      initval. Dynare aplica el método de Newton al modelo estático para 
//      encontrar el estado estacionario.
%--------------------------------------------------------------------------


%**************************************************************************
% 5. Shocks
%**************************************************************************

shocks; % Define los shocks del modelo.

var     % Comando para establecer la variable asociada al shock.
u = 1;  
end;    


%**************************************************************************
% 5. Simulación estocástica del modelo                                               
%**************************************************************************

stoch_simul(graph, irf = 10);   % Obtiene las funciones de política y de estado (transición) del modelo.
irf_c = oo_.irfs;               % Las IRF se guardan en "oo_.irfs", este comando está tomando la IRF generada. 
save('irf_c.mat', 'irf_c');     % Guardamos las IRF.

%--------------------------------------------------------------------------
% Nota: El código “stoch_simul” brinda las funciones de política y de estado
//      (conocidas también como reglas de decisión), cuyos coeficientes se
//      guardan en “oo_.dr” (dr es un diminutivo para decision rules).
%--------------------------------------------------------------------------

