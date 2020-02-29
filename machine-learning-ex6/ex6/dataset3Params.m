function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.1;

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

loop_vec = [0.01 0.03 0.1 0.3 1 3 10 30]';
m = length(loop_vec);
err_min = 0;

for i = 1:m
    C_i = loop_vec(i);
    fprintf('C = %f\n', C_i);
    for j = 1:m
        sigma_j = loop_vec(j);
        fprintf('sigma = %f\n', sigma_j);
        model = svmTrain(X, y, C_i, @(x1, x2) gaussianKernel(x1, x2, sigma_j));
        predictions = svmPredict(model, Xval);
        err = mean(double(predictions ~= yval));
        if (err_min == 0 | err < err_min)
            err_min = err;
            C = C_i;
            sigma = sigma_j;
        endif
    endfor
endfor


% =========================================================================
    
end
