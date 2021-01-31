function [bag bag_test] = bagging(D, k)
  pkg load statistics
  
  % This function creates new datasets (D1, D2, ..., Dk) from the input dataset D 
  % by randomly selecting m samples with replacement. All new datasets should have
  % the same dimension as the input dataset D.
  % 
  % D - input dataset matrix 
  % k - number of new dataset to create
  % bag  - return a kx1 cell array. each cell contains a new dataset matrix (Di)
  
  
  m = size(D,1);
  idx = 1:m;
  for i = 1:k
    bag_idx{i,1} = randsample(idx,m,replacement=true);
    temp_mat = bag_idx{i,1};
    elems = unique(temp_mat);
    tf = ismember(idx,elems);
    idx_test{i,1} = find(tf==0);
  end
  size_bag_idx = size(bag_idx,1);
  
  for j = 1:size_bag_idx
    bag{j,1} = D(bag_idx{j,1},:);
  end
  
  for k = 1:size(idx_test,1)
    bag_test{k,1} = D(idx_test{k,1},:);
  end
  
 end