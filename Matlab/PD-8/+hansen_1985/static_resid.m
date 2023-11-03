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
    T = hansen_1985.static_resid_tt(T, y, x, params);
end
residual = zeros(9, 1);
lhs = 1/y(1);
rhs = params(1)*1/y(1)*(y(3)+1-params(2));
residual(1) = lhs - rhs;
lhs = (1-params(3))*y(4)/y(5);
rhs = y(1)*params(8);
residual(2) = lhs - rhs;
lhs = y(1);
rhs = y(4)+(1-params(2))*y(6)-y(6);
residual(3) = lhs - rhs;
lhs = y(6);
rhs = (1-params(2))*y(6)+y(7);
residual(4) = lhs - rhs;
lhs = y(4);
rhs = T(2)*T(3);
residual(5) = lhs - rhs;
lhs = y(3);
rhs = params(3)*y(4)/y(6);
residual(6) = lhs - rhs;
lhs = y(2);
rhs = (1-params(3))*y(4)/y(5);
residual(7) = lhs - rhs;
lhs = log(y(8));
rhs = log(y(8))*params(4)+x(1);
residual(8) = lhs - rhs;
lhs = y(9);
rhs = y(4)/y(5);
residual(9) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
