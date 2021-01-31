  function Rij_Matrix = createBinMatrix(InitMatrix)
    
  %% This function creates a binary matrix for the given matrix with value 1 for
  %% the non zero elements of the matrix and zero for others.
  
    Rij_Matrix = (InitMatrix~=0);
  endfunction
