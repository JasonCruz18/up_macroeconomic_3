%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'hansen_1985';
M_.dynare_version = '5.4';
oo_.dynare_version = '5.4';
options_.dynare_version = '5.4';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'varepsilon_a'};
M_.exo_names_tex(1) = {'varepsilon\_a'};
M_.exo_names_long(1) = {'varepsilon_a'};
M_.endo_names = cell(9,1);
M_.endo_names_tex = cell(9,1);
M_.endo_names_long = cell(9,1);
M_.endo_names(1) = {'c'};
M_.endo_names_tex(1) = {'c'};
M_.endo_names_long(1) = {'consumo'};
M_.endo_names(2) = {'w'};
M_.endo_names_tex(2) = {'w'};
M_.endo_names_long(2) = {'salario real'};
M_.endo_names(3) = {'r'};
M_.endo_names_tex(3) = {'r'};
M_.endo_names_long(3) = {'tasa de interés real'};
M_.endo_names(4) = {'y'};
M_.endo_names_tex(4) = {'y'};
M_.endo_names_long(4) = {'producto'};
M_.endo_names(5) = {'h'};
M_.endo_names_tex(5) = {'h'};
M_.endo_names_long(5) = {'horas'};
M_.endo_names(6) = {'k'};
M_.endo_names_tex(6) = {'k'};
M_.endo_names_long(6) = {'capital'};
M_.endo_names(7) = {'i'};
M_.endo_names_tex(7) = {'i'};
M_.endo_names_long(7) = {'inversión'};
M_.endo_names(8) = {'lambda'};
M_.endo_names_tex(8) = {'\lambda'};
M_.endo_names_long(8) = {'PTF'};
M_.endo_names(9) = {'productividad'};
M_.endo_names_tex(9) = {'{\frac{y}{h}}'};
M_.endo_names_long(9) = {'productividad'};
M_.endo_partitions = struct();
M_.param_names = cell(8,1);
M_.param_names_tex = cell(8,1);
M_.param_names_long = cell(8,1);
M_.param_names(1) = {'beta'};
M_.param_names_tex(1) = {'\beta'};
M_.param_names_long(1) = {'factor de descuento'};
M_.param_names(2) = {'delta'};
M_.param_names_tex(2) = {'\delta'};
M_.param_names_long(2) = {'tasa de depreciación'};
M_.param_names(3) = {'theta'};
M_.param_names_tex(3) = {'\theta'};
M_.param_names_long(3) = {'capital share'};
M_.param_names(4) = {'gamma'};
M_.param_names_tex(4) = {'\gamma'};
M_.param_names_long(4) = {'coeficiente del AR de PTF'};
M_.param_names(5) = {'A'};
M_.param_names_tex(5) = {'A'};
M_.param_names_long(5) = {'parámetro de desutilidad del trabajo'};
M_.param_names(6) = {'h_0'};
M_.param_names_tex(6) = {'{h_0}'};
M_.param_names_long(6) = {'trabajadores a tiempo completo en situación estable'};
M_.param_names(7) = {'sigma_vareps'};
M_.param_names_tex(7) = {'\sigma_e'};
M_.param_names_long(7) = {'volatilidad del choque de la PTF'};
M_.param_names(8) = {'B'};
M_.param_names_tex(8) = {'B'};
M_.param_names_long(8) = {'parámetro compuesto de desutilidad laboral'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 9;
M_.param_nbr = 8;
M_.orig_endo_nbr = 9;
M_.aux_vars = [];
M_ = setup_solvers(M_);
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
M_.orig_eq_nbr = 9;
M_.eq_nbr = 9;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 3 12;
 0 4 0;
 0 5 13;
 0 6 0;
 0 7 0;
 1 8 0;
 0 9 0;
 2 10 0;
 0 11 0;]';
M_.nstatic = 5;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.dynamic_tmp_nbr = [3; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , '2' ;
  3 , 'name' , 'c' ;
  4 , 'name' , 'k' ;
  5 , 'name' , 'y' ;
  6 , 'name' , 'r' ;
  7 , 'name' , 'w' ;
  8 , 'name' , '8' ;
  9 , 'name' , 'productividad' ;
};
M_.mapping.c.eqidx = [1 2 3 ];
M_.mapping.w.eqidx = [7 ];
M_.mapping.r.eqidx = [1 6 ];
M_.mapping.y.eqidx = [2 3 5 6 7 9 ];
M_.mapping.h.eqidx = [2 5 7 9 ];
M_.mapping.k.eqidx = [3 4 5 6 ];
M_.mapping.i.eqidx = [4 ];
M_.mapping.lambda.eqidx = [5 8 ];
M_.mapping.productividad.eqidx = [9 ];
M_.mapping.varepsilon_a.eqidx = [8 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [6 8 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(9, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(8, 1);
M_.endo_trends = struct('deflator', cell(9, 1), 'log_deflator', cell(9, 1), 'growth_factor', cell(9, 1), 'log_growth_factor', cell(9, 1));
M_.NNZDerivatives = [29; -1; -1; ];
M_.static_tmp_nbr = [3; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(1) = 0.99;
beta = M_.params(1);
M_.params(2) = 0.025;
delta = M_.params(2);
M_.params(3) = 0.36;
theta = M_.params(3);
M_.params(4) = 0.95;
gamma = M_.params(4);
,
M_.params(5) = 2;
A = M_.params(5);
M_.params(7) = 0.00712;
sigma_vareps = M_.params(7);
M_.params(6) = 0.53;
h_0 = M_.params(6);
steady;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (M_.params(7))^2;
oo_.dr.eigval = check(M_,options_,oo_);
steady;
options_.hp_filter = 1600;
options_.irf = 50;
options_.loglinear = true;
options_.order = 1;
var_list_ = {'y';'c';'i';'k';'h';'productividad'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'hansen_1985_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'hansen_1985_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'hansen_1985_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'hansen_1985_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'hansen_1985_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'hansen_1985_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'hansen_1985_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
