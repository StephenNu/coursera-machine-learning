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
oddC = 0.01;
evenC = 0.03;
oddS = 0.01;
evenS = 0.03;
lowestC = 0.01;
lowestS = 0.01;
value = Inf;
for i = 1:8
	if !mod(i,2)
		C = evenC;
		evenC *= 10;
	else
		C = oddC;
		oddC *= 10;
	endif
	evenS = 0.03;
	oddS = 0.01;
	for j = 1:8
		if mod(j,2)
			sigma = evenS;
			evenS *= 10;
		else
			sigma = oddS;
			oddS *= 10;
		endif

		model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
		predictions = svmPredict(model, Xval);
		errorVal = mean(double(predictions ~= yval));
		if errorVal < value
			value = errorVal;
			lowestC = C;
			lowestS = sigma;
		endif
	end
end
C = lowestC;
sigma = lowestS;






% =========================================================================

end
