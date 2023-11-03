%__________________________________________________________________________
%                             MACROECONOMÍA III
%                             PD #8: Problema 1
%__________________________________________________________________________
%          Indivisble Labor and the Business Cycles (Hansen, 1985)
%__________________________________________________________________________

%.........................................................................
% Program (script): hansen_1985.mod
%  - First Created: 01/11/23
%  - Last Updated:  02/11/23
%.........................................................................

%%--------------------------------------------------------------------------
%% Hansen (1985)
%%--------------------------------------------------------------------------

/*
 * Este programa implementa y plotea las IRF's del paper de Hansen, Gary D. (1985):
 * "Indivisible labor and the business cycle", Journal of Monetary Economics 16,
 * pp.309-327.
 *
 * Este programa está basado en las "Notas de Clase sobre Hansen (1985)".
 *
 * Agenda: En GitHub (@JasonCruz18) estará actualizada una versión de este script
 * para replicar los principales resultados del trabajo original, especialmente
 * los que figuran en la Tabla 1 del paper para los modelos de trabajo divisible
 * e indivisible.
 * Esta implementación fue escrita por @JasonCruz18 (GitHub). Si detecta errores,
 * envíeme un correo electrónico a jj.cruza@up.edu.pe
 */


%**************************************************************************
% 1. Variables endógenas, exógenas y parámetros                                                        
%**************************************************************************

var c $c$ (long_name='consumo')                             
    w $w$ (long_name='salario real')
    r $r$ (long_name='tasa de interés real')
    y $y$ (long_name='producto')
    h $h$ (long_name='horas')
    k $k$ (long_name='capital')
    i $i$ (long_name='inversión')
    lambda $\lambda$ (long_name='PTF') % Lo que usualmente lo puede ver vomo "A_{t}".
    productividad ${\frac{y}{h}}$ (long_name='productividad') % Vea su definición en el paper.
    ;

varexo varepsilon_a; % Variable aleatoria (ruido blanco).

parameters beta $\beta$ (long_name='factor de descuento')
           delta $\delta$ (long_name='tasa de depreciación')
           theta $\theta$ (long_name='capital share')
           gamma $\gamma$ (long_name='coeficiente del AR de PTF')
           A $A$ (long_name='parámetro de desutilidad del trabajo')
           h_0 ${h_0}$ (long_name='trabajadores a tiempo completo en situación estable')
           sigma_vareps $\sigma_e$ (long_name='volatilidad del choque de la PTF')
           B $B$ (long_name='parámetro compuesto de desutilidad laboral') % Vea su definición en el paper.
           ;


%--------------------------------------------------------------------------
% Calibración
%--------------------------------------------------------------------------

// Vea la p. 319 para la calibración de Hansen.

beta = 0.99;
delta = 0.025;
theta = 0.36;
gamma = 0.95;,
A = 2; % recuerde que se refiere al parámetro de desutilidad del trabajo.
sigma_vareps = 0.00712;
h_0 = 0.53;


%**************************************************************************
% 2. El modelo                                                        
%**************************************************************************

model;

% 2.1. Ecuación de Euler
%..........................................................................
1/c = beta*((1/c(+1))*(r(+1) +(1-delta)));

% 2.2. FOC del trabajo
%..........................................................................
(1-theta)*(y/h) = B*c;

% 2.3. Restricción de recursos
%..........................................................................
c = y +(1-delta)*k(-1) - k;

% 2.4. Ley de movimiento del capital
%..........................................................................
k = (1-delta)*k(-1) + i;

% 2.5. Función de producción 
%..........................................................................
y = lambda*k(-1)^(theta)*h^(1-theta);

% 2.6. Tasa de interés real 
%..........................................................................
r = theta*(y/k(-1));

% 2.7. Salario real
%..........................................................................
w = (1-theta)*(y/h);

% 2.8. Ley de movimiento de la TFP
%..........................................................................
log(lambda) = gamma*log(lambda(-1))+varepsilon_a;

% 2.9. Productividad
%..........................................................................
productividad = y/h;

end;


%**************************************************************************
% 3. Estado estacionario                                                       
%**************************************************************************

steady_state_model;

B=-A*(log(1-h_0))/h_0; %called psi in footnote
lambda = 1;
h = (1-theta)*(1/beta -(1-delta))/(B*(1/beta -(1-delta)-theta*delta));
k = h*((1/beta -(1-delta))/(theta*lambda))^(1/(theta-1));
i = delta*k;
y = lambda*k^(theta)*h^(1-theta);
c = y-delta*k;
r =  1/beta - (1-delta);
w = (1-theta)*(y/h);
productividad = y/h;

end;

steady;


%**************************************************************************
% 4. Shocks
%**************************************************************************

shocks;

var varepsilon_a; stderr sigma_vareps;

end;


%**************************************************************************
% 5. Simulación estocástica del modelo y IRF's                                              
%**************************************************************************

check; % Revisa que las condiciones se cumplan para la solución numérica.

steady;

stoch_simul(order=1,irf=50,loglinear,hp_filter=1600) y c i k h productividad;

/*
 * Nota: Para que Dynare calcule el estado estacionario por el método de Newton
 *      se coloca el comando "steady" después del bloque del modelo. Para ello
 *      considera como punto inicial los valores que se indiquen en la sección
 *      initval o calibración.
 */

