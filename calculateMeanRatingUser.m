function mean_user = calculateMeanRatingUser(Rating)
  
  %% Function to calculate the overall rating over the matrix formed by 
  %% the given dataset. It takes the Actual matrix as an argument and 
  %% returns the mean over all the user-item ratings. 
  
  
  mean_user = zeros(1,size(Rating,2));
  for i = 1:size(Rating,2)
    total = sum(nonzeros(Rating(:,i)));
    ratings_by_user = nnz(Rating(:,i));
    mean_user(i) = total/ratings_by_user;
  end
  end