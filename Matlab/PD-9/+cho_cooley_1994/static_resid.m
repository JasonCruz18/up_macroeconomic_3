function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
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
%   residual
%

if T_flag
    T = cho_cooley_1994.static_resid_tt(T, y, x, params);
end
residual = zeros(7, 1);
lhs = T(1)*y(3)/y(5);
rhs = params(4)*y(6)*T(2);
residual(1) = lhs - rhs;
lhs = T(1)*y(3)/y(6);
rhs = params(4)/(1+params(1))*y(5)^(1+params(1))+params(5)*y(6)^params(6);
residual(2) = lhs - rhs;
lhs = 1/y(1);
rhs = 1/y(1)*params(2)*T(4);
residual(3) = lhs - rhs;
lhs = y(3);
rhs = y(1)+y(2);
residual(4) = lhs - rhs;
lhs = y(3);
rhs = T(5)*T(6);
residual(5) = lhs - rhs;
lhs = y(4);
rhs = y(2)+y(4)*(1-params(8));
residual(6) = lhs - rhs;
lhs = y(7);
rhs = y(7)*params(9)+x(1);
residual(7) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
