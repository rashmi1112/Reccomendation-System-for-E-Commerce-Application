function Rating_Matrix = FillMatrix(X,Y,n,m)
  
  %% This function returns a matrix filled with ratings based on the given dataset  
  
  Rating_Matrix = zeros(n,m);
  rows = size(X,1);
  
  for j = 1:rows
    Rating_Matrix(X(j,2),X(j,1)) = Y(j,1);
  end
endfunction
