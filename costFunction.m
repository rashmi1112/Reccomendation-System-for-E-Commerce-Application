function [J,grad] = costFunction(Parameters,M,R,m,n,feat,lambda)
  %% For calculating the cost function, we sum the Error over all the users i 
  %%        who have given a rating R(i,j) for the item j, with the regularization 
  %%        term in order to avoid overfitting of the data. 
  %%
  %% Error is defined by the difference between the calculated prediction using the
  %%        given X and Theta values and the actual prediction. 
  %%
  %% Lambda is the regularization parameter.  
  
  size_x = n*feat;
  size_theta = n*(feat+1);
  size_parameters_inside = size(Parameters);
  [X Theta] = unrollParameters(Parameters,m,n,feat);
  H = X*Theta';
  delta = (H-M);
  J = (1/2) * sum(sum(R.*(delta.^2))) + [(lambda/2) * sum(sum(X'*X))] + [(lambda/2) * sum(sum((Theta)'*(Theta)))];
  X_grad = R.*(H - M) * Theta + lambda * X;
  Theta_grad = (R.*(H - M))' * X + lambda * Theta;
  grad = [X_grad(:); Theta_grad(:)];
endfunction
