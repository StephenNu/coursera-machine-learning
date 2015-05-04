function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%
J = (1/m)*(sum((-y([1:m]).*log(sigmoid(X*theta)) - (1 - y([1:m])).*log(1 - sigmoid(X*theta)))));
for l = 1:length(grad)
	grad(l) = (1/m)*(sum((sigmoid(X([1:m],:)*theta) - y([1:m]))'*X([1:m],l)));
end

	%grad = (1/m)*(X'*(sigmoid(X*theta) - y));

% 0.693147
% Gradient at initial theta (zeros): 
%	  -0.100000 
%	    -12.009217 
%	    -11.262842 




% =============================================================

end
