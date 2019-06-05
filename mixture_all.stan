data {
 int D; //number of dimensions
 int K; //number of gaussians
 int N; //number of data
 vector[D] y[N]; //data
 vector<lower=0>[K] alpha; // alpha for dirichlet
// simplex[K] theta; // FIX theta
}

parameters {
 simplex[K] theta; //mixing proportions
 vector[D] mu[K]; //mixture component means
 cholesky_factor_corr[D] L[K]; //cholesky factor of correlation
 vector<lower=0,upper=1>[D] sigma[K];
}

model {
 real ps[K];
 theta ~ dirichlet(alpha);
 for(k in 1:K){
 mu[k] ~ normal(0,3);
 sigma[k] ~ cauchy(0, 0.5);
 L[k] ~ lkj_corr_cholesky(5);
 }
 

 for (n in 1:N){
 for (k in 1:K){
 ps[k] = log(theta[k]) + multi_normal_cholesky_lpdf(y[n] | mu[k], diag_pre_multiply(sigma[k], L[k])); //increment log probability of the gaussian
 }
 target += log_sum_exp(ps);
 }

}

generated quantities {
  matrix[D,D] Omega[K];
  matrix[D,D] Sigma[K];
  for(k in 1:K){
  Omega[k] = multiply_lower_tri_self_transpose(L[k]);
  Sigma[k] = quad_form_diag(Omega[k], sigma[k]);
  }
}