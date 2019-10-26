# Alleviating Label Switching with Optimal Transport


## Description

Label switching is a phenomenon arising in mixture model posterior inference that prevents one from meaningfully assessing posterior statistics using standard Monte Carlo procedures. This issue arises due to invariance of the posterior under actions of a group; for example, permuting the ordering of mixture components has no effect on posterior likelihood. 

We propose a resolution to label switching that leverages machinery from optimal transport. 
Our algorithm efficiently computes posterior statistics in the quotient space of the 
symmetry group. We demonstrate here the performance of our SGD algorithm..

## Code

One Jupyter notebook and a Stan code are provided to present our code. The first uses the Stan probabilistic
software and therefore requires the Pystan library. The first time this code is used, one should compile the Stan code and record it in a .pkl file (code is provided). For our SGD algorithm, we used the POT library to compute the transport plan.
