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
M_.fname = 'cho_cooley_1994';
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
M_.exo_names(1) = {'v'};
M_.exo_names_tex(1) = {'v'};
M_.exo_names_long(1) = {'v'};
M_.endo_names = cell(7,1);
M_.endo_names_tex = cell(7,1);
M_.endo_names_long = cell(7,1);
M_.endo_names(1) = {'c'};
M_.endo_names_tex(1) = {'c'};
M_.endo_names_long(1) = {'c'};
M_.endo_names(2) = {'i'};
M_.endo_names_tex(2) = {'i'};
M_.endo_names_long(2) = {'i'};
M_.endo_names(3) = {'y'};
M_.endo_names_tex(3) = {'y'};
M_.endo_names_long(3) = {'y'};
M_.endo_names(4) = {'k'};
M_.endo_names_tex(4) = {'k'};
M_.endo_names_long(4) = {'k'};
M_.endo_names(5) = {'n'};
M_.endo_names_tex(5) = {'n'};
M_.endo_names_long(5) = {'n'};
M_.endo_names(6) = {'e'};
M_.endo_names_tex(6) = {'e'};
M_.endo_names_long(6) = {'e'};
M_.endo_names(7) = {'lambda'};
M_.endo_names_tex(7) = {'lambda'};
M_.endo_names_long(7) = {'lambda'};
M_.endo_partitions = struct();
M_.param_names = cell(20,1);
M_.param_names_tex = cell(20,1);
M_.param_names_long = cell(20,1);
M_.param_names(1) = {'gamma'};
M_.param_names_tex(1) = {'gamma'};
M_.param_names_long(1) = {'gamma'};
M_.param_names(2) = {'beta'};
M_.param_names_tex(2) = {'beta'};
M_.param_names_long(2) = {'beta'};
M_.param_names(3) = {'rho'};
M_.param_names_tex(3) = {'rho'};
M_.param_names_long(3) = {'rho'};
M_.param_names(4) = {'a'};
M_.param_names_tex(4) = {'a'};
M_.param_names_long(4) = {'a'};
M_.param_names(5) = {'b'};
M_.param_names_tex(5) = {'b'};
M_.param_names_long(5) = {'b'};
M_.param_names(6) = {'tau'};
M_.param_names_tex(6) = {'tau'};
M_.param_names_long(6) = {'tau'};
M_.param_names(7) = {'alpha'};
M_.param_names_tex(7) = {'alpha'};
M_.param_names_long(7) = {'alpha'};
M_.param_names(8) = {'delta'};
M_.param_names_tex(8) = {'delta'};
M_.param_names_long(8) = {'delta'};
M_.param_names(9) = {'eta'};
M_.param_names_tex(9) = {'eta'};
M_.param_names_long(9) = {'eta'};
M_.param_names(10) = {'sigma_v'};
M_.param_names_tex(10) = {'sigma\_v'};
M_.param_names_long(10) = {'sigma_v'};
M_.param_names(11) = {'lambda_ss'};
M_.param_names_tex(11) = {'lambda\_ss'};
M_.param_names_long(11) = {'lambda_ss'};
M_.param_names(12) = {'p'};
M_.param_names_tex(12) = {'p'};
M_.param_names_long(12) = {'p'};
M_.param_names(13) = {'q'};
M_.param_names_tex(13) = {'q'};
M_.param_names_long(13) = {'q'};
M_.param_names(14) = {'r'};
M_.param_names_tex(14) = {'r'};
M_.param_names_long(14) = {'r'};
M_.param_names(15) = {'y_ss'};
M_.param_names_tex(15) = {'y\_ss'};
M_.param_names_long(15) = {'y_ss'};
M_.param_names(16) = {'c_ss'};
M_.param_names_tex(16) = {'c\_ss'};
M_.param_names_long(16) = {'c_ss'};
M_.param_names(17) = {'i_ss'};
M_.param_names_tex(17) = {'i\_ss'};
M_.param_names_long(17) = {'i_ss'};
M_.param_names(18) = {'k_ss'};
M_.param_names_tex(18) = {'k\_ss'};
M_.param_names_long(18) = {'k_ss'};
M_.param_names(19) = {'n_ss'};
M_.param_names_tex(19) = {'n\_ss'};
M_.param_names_long(19) = {'n_ss'};
M_.param_names(20) = {'e_ss'};
M_.param_names_tex(20) = {'e\_ss'};
M_.param_names_long(20) = {'e_ss'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 7;
M_.param_nbr = 20;
M_.orig_endo_nbr = 7;
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
M_.orig_eq_nbr = 7;
M_.eq_nbr = 7;
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
 0 3 10;
 0 4 0;
 0 5 11;
 1 6 0;
 0 7 0;
 0 8 0;
 2 9 0;]';
M_.nstatic = 3;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.dynamic_tmp_nbr = [6; 1; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , '2' ;
  3 , 'name' , '3' ;
  4 , 'name' , 'y' ;
  5 , 'name' , '5' ;
  6 , 'name' , 'k' ;
  7 , 'name' , 'lambda' ;
};
M_.mapping.c.eqidx = [1 2 3 4 ];
M_.mapping.i.eqidx = [4 6 ];
M_.mapping.y.eqidx = [1 2 3 4 5 ];
M_.mapping.k.eqidx = [3 5 6 ];
M_.mapping.n.eqidx = [1 2 5 ];
M_.mapping.e.eqidx = [1 2 5 ];
M_.mapping.lambda.eqidx = [5 7 ];
M_.mapping.v.eqidx = [7 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [4 7 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(7, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(20, 1);
M_.endo_trends = struct('deflator', cell(7, 1), 'log_deflator', cell(7, 1), 'growth_factor', cell(7, 1), 'log_growth_factor', cell(7, 1));
M_.NNZDerivatives = [26; -1; -1; ];
M_.static_tmp_nbr = [6; 1; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(1) = 2;
gamma = M_.params(1);
M_.params(2) = 0.99;
beta = M_.params(2);
M_.params(3) = 1/M_.params(2)-1;
rho = M_.params(3);
M_.params(4) = 13.5;
a = M_.params(4);
M_.params(5) = 1.75;
b = M_.params(5);
M_.params(6) = 1.666666666666667;
tau = M_.params(6);
M_.params(7) = 0.3;
alpha = M_.params(7);
M_.params(8) = 0.025;
delta = M_.params(8);
M_.params(9) = 0.95;
eta = M_.params(9);
M_.params(10) = 0.00925;
sigma_v = M_.params(10);
M_.params(11) = 0;
lambda_ss = M_.params(11);
M_.params(12) = (M_.params(3)+M_.params(8))/M_.params(7);
p = M_.params(12);
M_.params(13) = (1+M_.params(1))/M_.params(1)*M_.params(5)/M_.params(4);
q = M_.params(13);
M_.params(14) = 1-M_.params(7);
r = M_.params(14);
M_.params(20) = (M_.params(14)/(1-M_.params(8)*M_.params(12)))^((1+M_.params(1)-M_.params(6))/(1+M_.params(1)))/(M_.params(4)*M_.params(13)^(1/(1+M_.params(1))));
e_ss = M_.params(20);
M_.params(19) = M_.params(13)^(1/(1+M_.params(1)))*(M_.params(14)/(1-M_.params(8)*M_.params(12)))^(M_.params(6)/(1+M_.params(1)));
n_ss = M_.params(19);
M_.params(18) = M_.params(12)^(1/(M_.params(7)-1))*M_.params(19)*M_.params(20);
k_ss = M_.params(18);
M_.params(15) = exp(M_.params(11))*M_.params(18)^M_.params(7)*(M_.params(19)*M_.params(20))^(1-M_.params(7));
y_ss = M_.params(15);
M_.params(17) = M_.params(8)*M_.params(18);
i_ss = M_.params(17);
M_.params(16) = M_.params(15)-M_.params(17);
c_ss = M_.params(16);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(7) = 0;
oo_.steady_state(6) = 0.75;
oo_.steady_state(5) = 0.3;
oo_.steady_state(3) = M_.params(15);
oo_.steady_state(1) = M_.params(16);
oo_.steady_state(2) = M_.params(17);
oo_.steady_state(4) = M_.params(18);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
resid(1);
steady;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(10)^2;
oo_.dr.eigval = check(M_,options_,oo_);
options_.order = 1;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
oo_ghh_log1 = oo_; 
save('oo_ghh_log1.mat', 'oo_ghh_log1'); 
M_.params(1) = 1;
gamma = M_.params(1);
M_.params(9) = 0.51;
eta = M_.params(9);
M.Sigma_v = 0.00825^2;
options_.order = 1;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
oo_ghh_log2 = oo_; 
save('oo_ghh_log2.mat', 'oo_ghh_log2');


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'cho_cooley_1994_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'cho_cooley_1994_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'cho_cooley_1994_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'cho_cooley_1994_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'cho_cooley_1994_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'cho_cooley_1994_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'cho_cooley_1994_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
