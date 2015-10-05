function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

c_vec = [0.01 0.03 0.1 0.3 1 3 10 30]';
sigma_vec = [0.01 0.03 0.1 0.3 1 3 10 30]';
x1 = [1 2 1]; x2 = [0 4 -1];
count = 1;
for i = 1:length(c_vec);
	for j = 1:length(sigma_vec);
           C = c_vec(i);
	   sigma = sigma_vec(j);
%           % Compute train / val errors when training linear 
%           % regression with regularization parameter lambda
%           % You should store the result in error_train(i)
%           % and error_val(i)
%           ....
	   model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
	   predictions =  svmPredict(model, Xval);
           prederror(count,1) = C;
	   prederror(count,2) = sigma;
	   prederror(count,3) = mean(double(predictions ~= yval));
	   count = count + 1;
   	end;
end;
[temp,p] = min(prederror(:,3));
C = prederror(p,1)
sigma = prederror(p,2)
% =========================================================================

end
