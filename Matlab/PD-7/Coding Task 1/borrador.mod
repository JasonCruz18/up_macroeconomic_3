/* PREAMBULO */ 

var p, m; 

varexo u; 

parameters alpha, beta, lambda, mbar; 

alpha = 0.5; 

beta = 0.5; 

mbar = 2.0; 

lambda = 0.9; 

/* MODELO */ 

model(linear); 

p = alpha*p(+1) + beta*m; 

m = mbar + lambda*m(-1) + u; 

end; 

/* VALORES INICIALES */ 

initval; 

p = 8; 

m = 4; 

end; 

/* ESTADO ESTACIONARIO */ 

steady; 

/* DEFINIR LOS SHOCKS */ 

shocks; 

var u = 0.1; 

end; 

/* CÁLCULO DE LA SOLUCIÓN ESTOCÁSTICA */ 

stoch_simul(graph, irf = 10); 

irfs_re_1 = oo_.irfs; 

save('irfs_re_1.mat', 'irfs_re_1'); 

 