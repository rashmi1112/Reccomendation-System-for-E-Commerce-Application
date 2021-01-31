function Y = predictionMatrix(binMatrix,ratingMatrix,predVec,row_mean)
  
  %% This function creates a complete matrix with the actual values in ratingMatrix  
  %% and the predicted matrix
  
  Y = zeros(size(binMatrix));
  for i = 1:size(binMatrix,2)
    idx_pred = find(binMatrix(:,i)==0);
    idx_actual = find(binMatrix(:,i)==1);
    Y(idx_pred,i) = predVec(idx_pred,i) + row_mean(idx_pred,1);
    Y(idx_actual,i) = ratingMatrix(idx_actual,i);
  end
end
