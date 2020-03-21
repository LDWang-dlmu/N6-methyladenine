# N6-methyladenine
Two-layer m6A site prediction model


----dev env
MATLAB R2018a

----runtime env
libsvm-3.22
This package of codes private	.		

----usage 
1.	Set up the MATLAB to a correct JDK environment on the windows system. 
2.	This is a code package is used to predict m6A sites and non-m6A sites, with four predictors for different species.
3.	First-layer: contains seven feature extraction methods of the first-layer model.
4.	Second-layer: contains the decision values of the first-layer model output and the four second-layer predictors.
5.	best_svm_1m: is the code for grid parameter optimization of the SVM predictor.
6.	Note that "_dec_" is the decision value output by the first-level predictor.
7.	Related data sets exist under each code folder.
