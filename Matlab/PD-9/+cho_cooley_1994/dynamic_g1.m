function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = cho_cooley_1994.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(7, 12);
g1(1,3)=y(5)/y(7)*(1-params(7))*(-1)/(y(3)*y(3));
g1(1,5)=T(1)*1/y(7);
g1(1,7)=T(1)*(-y(5))/(y(7)*y(7))-params(4)*y(8)*getPowerDeriv(y(7),params(1),1);
g1(1,8)=(-(params(4)*T(2)));
g1(2,3)=y(5)/y(8)*(1-params(7))*(-1)/(y(3)*y(3));
g1(2,5)=T(1)*1/y(8);
g1(2,7)=(-(params(4)/(1+params(1))*getPowerDeriv(y(7),1+params(1),1)));
g1(2,8)=T(1)*(-y(5))/(y(8)*y(8))-params(5)*getPowerDeriv(y(8),params(6),1);
g1(3,3)=(-1)/(y(3)*y(3));
g1(3,10)=(-(T(4)*params(2)*(-1)/(y(10)*y(10))));
g1(3,11)=(-(params(2)*1/y(10)*params(7)*T(3)));
g1(3,6)=(-(params(2)*1/y(10)*params(7)*y(11)*getPowerDeriv(y(6),(-1),1)));
g1(4,3)=(-1);
g1(4,4)=(-1);
g1(4,5)=1;
g1(5,5)=1;
g1(5,1)=(-(T(6)*exp(y(9))*getPowerDeriv(y(1),params(7),1)));
g1(5,7)=(-(T(5)*y(8)*T(7)));
g1(5,8)=(-(T(5)*y(7)*T(7)));
g1(5,9)=(-(T(5)*T(6)));
g1(6,4)=(-1);
g1(6,1)=(-(1-params(8)));
g1(6,6)=1;
g1(7,2)=(-params(9));
g1(7,9)=1;
g1(7,12)=(-1);

end
