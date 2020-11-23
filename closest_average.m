%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the average cat
%and dog vectors. It also takes in a data matrix Xrun and 
%produces a vector of label guesses yguess, corresponding to whether
%each row of Xrun is closer to the average cat or average dog.
function yguess = closest_average(Xtrain,ytrain,Xrun)


[avgcat, avgdog] = average_pet(Xtrain, ytrain);

ntest = size(Xrun, 1);
yguess = zeros(ntest, 1);

for i = 1:ntest
    if (norm(Xrun(i,:) - avgcat) > norm(Xrun(i,:) - avgdog))
        %its a dog
        yguess(i) = 1;
    else
        %its a cat
        yguess(i) = -1;
    end
end
end

        
    
    
    

