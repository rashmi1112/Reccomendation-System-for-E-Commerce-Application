function [norm,row_mean,new_Rij] = normalizeRatings(Rating, Rij,mean_user)
  
  %% This function pre-process the data by subtracting the mean rating for every
  %% item. It returns the mean after normalization in row_mean and the normalized 
  %% matrix in norm. It also returns the new binary matrix of the newly formed
  %% normalized matrix.
  
  [m, n] = size(Rating);
  
  for j = 1:m
    row_ratings = sum(Rij(j,:));
    if(row_ratings==0)
    Rating(j,:) = mean_user;
  end
end

new_Rij = createBinMatrix(Rating);
row_mean = zeros(m, 1);
norm = zeros(size(Rating));

for i = 1:m
  idx = find(new_Rij(i, :) == 1);
  row_mean(i) = mean(Rating(i, idx));
  norm(i, idx) = Rating(i, idx) - row_mean(i);
end
end

