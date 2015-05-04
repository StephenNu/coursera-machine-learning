function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

copy = ones(size(z))*e;
copy = copy .^ (-z);
copy = copy + ones(size(z));
g = ones(size(z)) ./ copy;


% =============================================================

end
