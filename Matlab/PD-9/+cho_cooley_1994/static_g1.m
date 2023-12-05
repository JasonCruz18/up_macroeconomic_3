function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = cho_cooley_1994.static_g1_tt(T, y, x, params);
end
g1 = zeros(7, 7);
g1(1,1)=y(3)/y(5)*(1-params(7))*(-1)/(y(1)*y(1));
g1(1,3)=T(1)*1/y(5);
g1(1,5)=T(1)*(-y(3))/(y(5)*y(5))-params(4)*y(6)*getPowerDeriv(y(5),params(1),1);
g1(1,6)=(-(params(4)*T(2)));
g1(2,1)=y(3)/y(6)*(1-params(7))*(-1)/(y(1)*y(1));
g1(2,3)=T(1)*1/y(6);
g1(2,5)=(-(params(4)/(1+params(1))*getPowerDeriv(y(5),1+params(1),1)));
g1(2,6)=T(1)*(-y(3))/(y(6)*y(6))-params(5)*getPowerDeriv(y(6),params(6),1);
g1(3,1)=(-1)/(y(1)*y(1))-T(4)*params(2)*(-1)/(y(1)*y(1));
g1(3,3)=(-(1/y(1)*params(2)*params(7)*T(3)));
g1(3,4)=(-(1/y(1)*params(2)*params(7)*y(3)*getPowerDeriv(y(4),(-1),1)));
g1(4,1)=(-1);
g1(4,2)=(-1);
g1(4,3)=1;
g1(5,3)=1;
g1(5,4)=(-(T(6)*exp(y(7))*getPowerDeriv(y(4),params(7),1)));
g1(5,5)=(-(T(5)*y(6)*T(7)));
g1(5,6)=(-(T(5)*y(5)*T(7)));
g1(5,7)=(-(T(5)*T(6)));
g1(6,2)=(-1);
g1(6,4)=1-(1-params(8));
g1(7,7)=1-params(9);
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
