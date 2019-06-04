# Alleviating Label Switching with Optimal Transport

Code accompanying (put the arkiv link)

## Description

Label switchingis a phenomenon arising in mixture model posterior inference that prevents one from meaningfully assessing posterior statistics using standard Monte Carlo procedures. This issue arises due to invariance of the posterior under actions of a group; for example, permuting the ordering of mixture components has no effect on posterior likelihood. 

We propose a resolution to label switching that leverages machinery from optimal transport. 
Our algorithm efficiently computes posterior statistics in the quotient space of the 
symmetry group. We demonstrate here the performances of our SGD algorithm, even in the
case of multi-reference alignment.

## Code

Two jupyter notebooks are provided to present our code. The first uses the Stan probabilistic
software and therefore requires the Pystan librairy. For our SGD algorithm, we used the POT 
librairy to compute the transport plan implied in our study.