function Yboost = boostPredict(Y,Rating)
  
  %% This function iterates over all the bags and selects a column from each bag 
  %% and pass it to the vote() function for majority vote calculation for each 
  %% prediction out of all the bags. 
  %%
  %% This function returns a final matrix with majority predictions from all the
  %% bags for all the matrix values.
  
  temp_vec = zeros(size(Rating,1),size(Y,1));
  for i = 1:size(Rating,2)
    for j = 1:size(Y,1)
      temp_vec(:,j) = Y{j,1}(:,i);
    end
    Yboost(:,i) = vote(temp_vec);
  endfor
  size_yboost = size(Yboost)
endfunction
