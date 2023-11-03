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
M_.fname = 'sargent_77_bayesiano';
M_.dynare_version = '5.4';
oo_.dynare_version = '5.4';
options_.dynare_version = '5.4';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(2,1);
M_.exo_names_tex = cell(2,1);
M_.exo_names_long = cell(2,1);
M_.exo_names(1) = {'epsilon'};
M_.exo_names_tex(1) = {'epsilon'};
M_.exo_names_long(1) = {'epsilon'};
M_.exo_names(2) = {'eta'};
M_.exo_names_tex(2) = {'eta'};
M_.exo_names_long(2) = {'eta'};
M_.endo_names = cell(4,1);
M_.endo_names_tex = cell(4,1);
M_.endo_names_long = cell(4,1);
M_.endo_names(1) = {'x'};
M_.endo_names_tex(1) = {'x'};
M_.endo_names_long(1) = {'x'};
M_.endo_names(2) = {'mu'};
M_.endo_names_tex(2) = {'mu'};
M_.endo_names_long(2) = {'mu'};
M_.endo_names(3) = {'a_1'};
M_.endo_names_tex(3) = {'a\_1'};
M_.endo_names_long(3) = {'a_1'};
M_.endo_names(4) = {'a_2'};
M_.endo_names_tex(4) = {'a\_2'};
M_.endo_names_long(4) = {'a_2'};
M_.endo_partitions = struct();
M_.param_names = cell(4,1);
M_.param_names_tex = cell(4,1);
M_.param_names_long = cell(4,1);
M_.param_names(1) = {'alpha'};
M_.param_names_tex(1) = {'alpha'};
M_.param_names_long(1) = {'alpha'};
M_.param_names(2) = {'lambda'};
M_.param_names_tex(2) = {'lambda'};
M_.param_names_long(2) = {'lambda'};
M_.param_names(3) = {'sigma_eta'};
M_.param_names_tex(3) = {'sigma\_eta'};
M_.param_names_long(3) = {'sigma_eta'};
M_.param_names(4) = {'sigma_epsilon'};
M_.param_names_tex(4) = {'sigma\_epsilon'};
M_.param_names_long(4) = {'sigma_epsilon'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 4;
M_.param_nbr = 4;
M_.orig_endo_nbr = 4;
M_.aux_vars = [];
options_.varobs = cell(2, 1);
options_.varobs(1)  = {'mu'};
options_.varobs(2)  = {'x'};
options_.varobs_id = [ 2 1  ];
M_ = setup_solvers(M_);
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
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
M_.orig_eq_nbr = 4;
M_.eq_nbr = 4;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 0;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 0;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 1 5;
 2 6;
 3 7;
 4 8;]';
M_.nstatic = 0;
M_.nfwrd   = 0;
M_.npred   = 4;
M_.nboth   = 0;
M_.nsfwrd   = 0;
M_.nspred   = 4;
M_.ndynamic   = 4;
M_.dynamic_tmp_nbr = [2; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'x' ;
  2 , 'name' , 'mu' ;
  3 , 'name' , 'a_1' ;
  4 , 'name' , 'a_2' ;
};
M_.mapping.x.eqidx = [1 2 ];
M_.mapping.mu.eqidx = [2 ];
M_.mapping.a_1.eqidx = [1 3 ];
M_.mapping.a_2.eqidx = [2 4 ];
M_.mapping.epsilon.eqidx = [1 2 3 4 ];
M_.mapping.eta.eqidx = [1 2 3 4 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [1 2 3 4 ];
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 0;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 0;
oo_.steady_state = zeros(4, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(4, 1);
M_.endo_trends = struct('deflator', cell(4, 1), 'log_deflator', cell(4, 1), 'growth_factor', cell(4, 1), 'log_growth_factor', cell(4, 1));
M_.NNZDerivatives = [17; -1; -1; ];
M_.static_tmp_nbr = [0; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(2) = .5921;
lambda = M_.params(2);
M_.params(1) = (-2.344);
alpha = M_.params(1);
M_.params(3) = .001;
sigma_eta = M_.params(3);
M_.params(4) = .001;
sigma_epsilon = M_.params(4);
steady;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1)^2;
options_.drop = 0;
options_.irf = 0;
options_.order = 1;
options_.periods = 33;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
save data_hyperinflation.mat x mu;
estim_params_.var_exo = zeros(0, 10);
estim_params_.var_endo = zeros(0, 10);
estim_params_.corrx = zeros(0, 11);
estim_params_.corrn = zeros(0, 11);
estim_params_.param_vals = zeros(0, 10);
estim_params_.param_vals = [estim_params_.param_vals; 2, NaN, (-Inf), Inf, 5, 0.68, .5, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 1, NaN, (-Inf), Inf, 5, (-5), 2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 3, NaN, (-Inf), Inf, 5, .5, 0.25, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 4, NaN, (-Inf), Inf, 5, .5, 0.25, NaN, NaN, NaN ];
options_.diffuse_filter = 1;
options_.steadystate.nocheck = 1;
options_.mh_jscale = 1;
options_.mh_nblck = 1;
options_.mh_replic = 25000;
options_.mode_compute = 4;
options_.datafile = 'cagan_data';
options_.first_obs = 1;
options_.nobs = 34;
options_.order = 1;
var_list_ = {};
oo_recursive_=dynare_estimation(var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'sargent_77_bayesiano_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'sargent_77_bayesiano_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'sargent_77_bayesiano_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'sargent_77_bayesiano_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'sargent_77_bayesiano_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'sargent_77_bayesiano_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'sargent_77_bayesiano_results.mat'], 'oo_recursive_', '-append');
end
disp('Note: 1 warning(s) encountered in the preprocessor')
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
