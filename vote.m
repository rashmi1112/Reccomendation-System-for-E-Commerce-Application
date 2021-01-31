function vote_vec = vote(matrix)
  
  %% This function iterates over all the rows of the matrix and passes each row as
  %% an input for the majorityVote() function. 
  %%
  %% This function returns the vector with majority predictions for each column of
  %% the matrix
  
  for i = 1:size(matrix,1)
    vote_vec(i,1) = majorityVote(matrix(i,:));
  endfor
endfunction
