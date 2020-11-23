%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the average cat
%and dog vectors. It also takes in a data matrix Xrun and 
%produces a vector of label guesses yguess. Each guess is found
%by searching through Xtrain to find the closest row, and then 
%outputting its label.
function yguess = nearest_neighbor(Xtrain,ytrain,Xrun)


nrun = size(Xrun, 1);
yguess = zeros(nrun, 1);
ntrain = size(Xtrain, 1);

for i = 1:nrun

minIndex = 1;

for j = 1:ntrain
    if norm(Xtrain(j,:) - Xrun(i,:)) < norm(Xtrain(minIndex,:) - Xrun(i,:))
        minIndex = j;
    end
end
yguess(i) = ytrain(minIndex);
end
end

    