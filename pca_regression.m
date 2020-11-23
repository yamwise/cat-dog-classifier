%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the PCA basis. 
%It also takes in a data matrix Xrun and a dimension k
%and uses the top-k vectors in the PCA basis to reduce the 
%dimension of Xtrain and Xrun. Finally, it uses the reduced data
%as inputs to the linear_regression function to produce 
%a vector of label guesses yguess.
function yguess = pca_regression(Xtrain,ytrain,Xtest,k)


v = pca(Xtrain);

vk = v(:,1:k);

ntest = size(Xtest, 1);
yguess = zeros(ntest, 1);
ntrain = size(Xtrain, 1);
entest = ones(ntest, 1);
entrain = ones(ntrain, 1);

xarrowtest = (1/ntest) * Xtest' * entest;
xarrowtrain = (1/ntrain) * Xtrain' * entrain;

Xctest = Xtest - (entest * xarrowtest');
Xctrain = Xtrain - (entrain * xarrowtrain');

Xrtest = Xctest * vk;
Xrtrain = Xctrain * vk;

yguess = linear_regression(Xrtrain, ytrain, Xrtest);





end



