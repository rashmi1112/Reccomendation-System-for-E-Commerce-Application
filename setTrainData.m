function [train test] = setTrainData(M,Per) 
  
  %% This function splits the given dataset randomly into training and testing set. 
  %% In order to avoid all the user rating biased towards a particular set 
  %% (train or test), the data is seperated in a way that makes sure that if a user 
  %% has given preferences, atleast 30% of those are directed in the test set. 
  
  users = unique(M(:,1));
  train = zeros(size(M));
  test = zeros(size(M));
  for i = 1:size(users,1)
    idx = find(M(:,1)==i);
    num_train = round(numel(idx)*Per);
    rand_idx = randperm(numel(idx));
    rows = idx(rand_idx,1);
    train_idx = rows(1:num_train);
    test_idx = rows(num_train+1:end,:);
    train_split = M(train_idx,:);
    test_split = M(test_idx,:);
    if(train == 0)
    train = train_split;
    test = test_split;
  else
    train = [train;train_split];
    test = [test;test_split];
  endif
end
end 


















