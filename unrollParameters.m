function [X Theta] = unrollParameters(init, m, n, feat)
  
  %% This function unrolls the parameters and returns the contents of the resultant 
  %% matrices, in this case, X and Theta.
  
  X = reshape(init(1:n*feat), n, feat);
  Theta = reshape(init(n*feat+1:end), m, feat);
endfunction
