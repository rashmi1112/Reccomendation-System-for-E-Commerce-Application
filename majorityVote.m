function finalVote = majorityVote(input)
  
  %% This function iterates over all the values of the input vector and calculates 
  %% maximum occurence of a value in the vector, thereby calculating the moajority
  %% vote of a user-item rating from all the bags.
  
  unique_elem = unique(input);
  init =1;
  
  for i = unique_elem
    temp_vec = find(input==i);
    occ_vec(init,1) = size(temp_vec,2);
    init+=1;
  end
  
  [max_occ_val max_occ_val_idx] = max(occ_vec);
  
  finalVote = input(1,max_occ_val_idx);
endfunction
