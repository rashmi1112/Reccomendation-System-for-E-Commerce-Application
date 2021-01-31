  function [X, Theta] = randomInitialize(n,m,feat)
  
  %% This function randomly initializes the parameters between -1 to 1
  %% given the dimension of the matrix and the number of features. 
  
  E_INIT = 1;
  X = rand(n,feat)*(2*E_INIT) - E_INIT;
  Theta = rand(m,feat)*(2*E_INIT) - E_INIT;
  end
  
