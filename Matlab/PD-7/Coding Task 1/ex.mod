/* PREÁMBULO */ 

var p, m; 

varexo u; 

parameters alpha, beta, lambda1, lambda2, mbar; 

alpha = 0.5; 

beta = 0.5; 

mbar = 2.0; 

lambda1 = 0.9; 

lambda2 = -0.1; 

/* MODELO */ 

model(linear); 

p = 0.5*alpha*p(+1) + 0.5*alpha*p(-1) + beta*m; 

m = mbar + lambda1*m(-1) + lambda2*m(-2) + u; 

end; 

/* VALORES INICIALES */ 

/* ESTADO ESTACIONARIO */ 

steady; 

/* DEFINIR LOS SHOCKS */ 

shocks; 

var u = 0.1; 

end; 

/* CÁLCULO DE LA SOLUCIÓN ESTOCÁSTICA */ 

stoch_simul(graph, irf = 10); 

irfs_re_ae_3 = oo_.irfs; 

save('irfs_re_ae_3.mat', 'irfs_re_ae_3'); 