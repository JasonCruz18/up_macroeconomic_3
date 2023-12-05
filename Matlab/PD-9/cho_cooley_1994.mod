%%_________________________________________________________________________
%%                             MACROECONOMÍA III
%%                             PD #9: Problema 2
%%_________________________________________________________________________
%%    Employment and hours over the business cycle (Cho y Cooley, 1994)
%%_________________________________________________________________________

%%.........................................................................
%% Autor: Jason Cruz
%%.........................................................................

%%.........................................................................
%% Program (script): cho_cooley_1994.mod
%%  - First Created: 09/11/23
%%  - Last Updated:  10/11/23
%%.........................................................................


%--------------------------------------------------------------------------
% Cho & Cooley, (1994)
%--------------------------------------------------------------------------
% Este es un modelo RBC con choque tecnológico y dos variables de oferta de
% de trabajo como la novedad: n (horas de trabajo) y e (tasa de empleo);
% margen intensivo y extensivo, respectivamente.
% Consideramos el modelo en su forma no-lineal en niveles (NO en logaritmo).
% El choque es: \lambda_t = \mu \lambda_{t-1} + v_t (donde v es iid).
% Para los efectos del choque tecnológico consideramos que la volatilidad
% es tal que: v = 0.00925 (0.925%) 
%--------------------------------------------------------------------------

%..........................................................................
% Nota: Como lo asumen Cho & Cooley, dado el equilibrio se trata
% indistintamente a las variables agragadas y sus contrapartes individuales.
% En este script consideramos todas como individuales (en minúsculas).
%..........................................................................


%**************************************************************************
% 1. Variables endógenas y exógenas                                                        
%**************************************************************************

var         % comando de entrada para establecer las variables endógenas

c           % consumo
i           % inversión
y           % producto
k           % capital
n           % horas de trabajo (margen intensivo)
e           % tasa de empleo (margen extensivo)
lambda      % choque tecnológico
;

varexo v    % comando de entrada para establecer las variables exógenas
;


%**************************************************************************
% 2. Parámetros                                                                   
%**************************************************************************

// El orden en que aparecen corresponde al orden de la calibración

parameters  % comando de entrada para establecer los parámetros

gamma       % participación de las horas de trabajo sobre la oferta laboral
beta        % factor de descuento (parámetro de impaciencia)
rho
a           % parámetro del margen intensivo

b           % parámetro del margen extensivo
tau         % participación de la tasa de empleo sobre la oferta laboral
alpha 	    % participación del capital en la producción total
delta       % tasa de depreciación del stock de capital

eta         % persistencia del choque
sigma_v     % desviación estándar del choque
lambda_ss

p           % auxiliar para n y e de estado estacionario
q           % auxiliar para n y e de estado estacionario
r           % auxiliar para n y e de estado estacionario

y_ss 
c_ss 
i_ss
k_ss
n_ss
e_ss
;


%**************************************************************************
% 3. Calibración                                                              
%**************************************************************************

%--------------------------------------------------------------------------
% 3.1. Parámetros de utilidad (especificación de preferencias)
%--------------------------------------------------------------------------

gamma = 2;                 % tomará dos valores: 1 y 2
beta = 0.99;               % dado por el ejercicio (PC 2)
rho = 1/beta - 1;
a = 13.5;                  % obtenido de la Tabla 3 en (Cooley & Cho, 1994)

%--------------------------------------------------------------------------
% 3.2. Parámetros de producción y costos (especificación de tecnología)
%--------------------------------------------------------------------------

b = 1.75;                  % obtenido de la Tabla 3 en (Cooley & Cho, 1994)
tau = 5/3;                 % dado por el ejercicio (PC 2)
alpha = 0.3;               % dado por el ejercicio (PC 2)
delta = 0.025;             % dado por el ejercicio (PC 2)

%--------------------------------------------------------------------------
% 3.3. Parámetros del choque (persistencia y variabilidad)
%--------------------------------------------------------------------------

eta = 0.95;             % obtenido de la Tabla 2 en (Cooley & Cho, 1994)
sigma_v = 0.00925;        % dado por el ejercicio
lambda_ss = 0;          

%--------------------------------------------------------------------------
% 3.4. Parámetros auxiliares
%--------------------------------------------------------------------------

p = ((rho+delta)/(alpha));
q = ((1+gamma)/gamma)*(b/a);
r = (1-alpha);


%**************************************************************************
% 4. Estado Estacionario                                                    
%**************************************************************************

e_ss = ((r/(1-delta*p))^((1+gamma-tau)/(1+gamma)))/(a*(q^(1/(1+gamma))));
n_ss = q^(1/(1+gamma))*(r/(1-delta*p))^(tau/(1+gamma));
k_ss = ((p)^(1/(alpha-1)))*(n_ss*e_ss);
y_ss = exp(lambda_ss)*(k_ss^alpha)*(n_ss*e_ss)^(1-alpha);
i_ss = delta*k_ss;
c_ss = y_ss - i_ss;


%**************************************************************************
% 5. El Modelo (Solución Centralizada)                                                     
%**************************************************************************

model; 

%--------------------------------------------------------------------------
% 5.1. Condiciones principales que caracterizan el modelo
%--------------------------------------------------------------------------

(1/c)*(1-alpha)*(y/n) = a*e*n^(gamma);                             % CPO: n
(1/c)*(1-alpha)*(y/e) = ((a/(1+gamma))*n^(1+gamma) + b*e^(tau));   % CPO: e
(1/c) = beta*(1/c(+1))*(alpha*y(+1)*k^(-1)+(1-delta));             % Euler

%--------------------------------------------------------------------------
% 5.2. Condiciones adicionales (aplicada la ley de Walras)
%--------------------------------------------------------------------------

y = c + i;                                      % restricción de recursos
y = exp(lambda)*(k(-1)^alpha)*(n*e)^(1-alpha);  % tecnología
k = (1-delta)*k(-1)+i;                          % movimiento del capital

%--------------------------------------------------------------------------
% 5.3. Condición de comportamiento del choque tecnológico
%--------------------------------------------------------------------------

lambda = eta*lambda(-1) + v;        % proceso AR(1) con v ~ iid(0, var(v))
end;


%**************************************************************************
% 6. Valores iniciales (guess)
%**************************************************************************

initval;        % comando de entrada para establecer valores iniciales

lambda = 0;
e = 0.75;       % sugerido por el ejercicio (PC 2)
n = 0.3;        % sugerido por el ejercicio (PC 2)
y = y_ss;       
c = c_ss;
i = i_ss;
k = k_ss;
end;
resid(1);
steady;


%**************************************************************************
% 7. El choque                                                                
%**************************************************************************

shocks;
var v = (sigma_v)^2;
end;

check;

%stoch_simul(order = 1);


%**************************************************************************
% 8. Simulación 
%**************************************************************************

%--------------------------------------------------------------------------
% 8.1. Comparando 2 escenarios
%--------------------------------------------------------------------------

// Esto se hace también en Cho y Cooley, (1994). El resumen se encuentra
// en las tablas 2 y 3 del paper. 

% Escenario 1 (solicitado en la PC)
%..........................................................................

// Considerando los valores del ejercicio. Aquellos establecidos en este
// script: 
// gamma = 2, eta = 0.95, sigma_v = 0.00925

stoch_simul(order=1);
oo_ghh_log1 = oo_; 
save('oo_ghh_log1.mat', 'oo_ghh_log1'); 
% el primero es el nombre del archivo, 
% el segundo es la variable que se desea guardar

% Escenario 2 (visto en Cho & Cooley, (1994))
%..........................................................................

// Comparamos este escenario con otro donde hay menos persistencia del
// choque. Asimismo, consideramos otro valor para gamma, mencionado también
// en Cho & Cooley (1994). Finalmente, modifcamos la desviación del choque,
// siguiendo la sugerencia de (Prescott, 1986):
// gamma = 1, eta = 0.51, sigma_v = 0.00825 

gamma = 1;
eta = 0.51; 
M.Sigma_v = 0.00825^2;
stoch_simul(order=1);
oo_ghh_log2 = oo_; 
save('oo_ghh_log2.mat', 'oo_ghh_log2');


%_________________________________FIN______________________________________
%..........................................................................

