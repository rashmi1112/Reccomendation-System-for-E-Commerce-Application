%% Initialization
clear ; close all; clc

pkg load statistics;

%% Load the dataset
M = load('dataset.txt');

m = 943;          %% No. of Users in training set
n = 1682;         %% No. of Items in training set

Users = M(:,1);
Items = M(:,2);
Rating = M(:,3);

%% Fills the matrix with the ratings given in the dataset 
ActualMatrix = FillMatrix([Users  Items],Rating,n,m);

%% Calculates the 
mean_user = calculateMeanRatingUser(ActualMatrix);


%% Initializing parameters required for our algorithm. 
%% lambda is regularization parameter that helps reducing the overfitting. 
%% features is a vector associated with every item that when a way determines the 
%%    rating of a user for that item.
%% k is the number of bags we are using for the bagging process in this model.


lambda = 10
features = 30
k = 8
Per = 0.7;

%% Splitting the train and the test data in a way that 70% of each user's data
%% is split into training set and the remaining 30% into the testing set. 

[train test] = setTrainData(M,Per);

%% A process usually used in Random Forests, called bagging (ensembling) has been applied here 
%% in order to improve the prediction accuracy. Instead of predicting using single set of 
%% random initializations, bagging does it k different times, every time with different subset
%% of training data and thereby predicting for the test set by taking the majority voting
%% for each predicted value from all the k bags. This makes the prediction robust and 
%% avoids overfitting of data. 

[bag,bag_test] = bagging(train, k);

%% Training the model for all the k bags

for z = 1:k
  fprintf('\nTraining for bag: %d\n',z);
  
  bag_mat = bag{z};
  bag_matTest = bag_test{z};
  size_bagmat_test = size(bag_matTest);
  
  
  X_train = bag_mat(:,1:end-1);
  Y_train = bag_mat(:,end);
  
  X_test = bag_matTest(:,1:end-1);
  Y_test = bag_matTest(:,end);
  
  Train_RatingMatrix = FillMatrix(X_train,Y_train,n,m);
  
  %% Create a binary matrix of the training data for zth bag. 
  Bin_Matrix = createBinMatrix(Train_RatingMatrix);
  
  %% Randomly initialize the parameters Theta and X for passing as initial parameters
  %% to the advanced optimization algorithm fmincg()
  [X,Theta] = randomInitialize(n,m,features);
  
  initialParameters = [X(:);Theta(:)];
  options = optimset('GradObj', 'on', 'MaxIter', 100);
  
  %% Normalize the given ratings, a step in pre-processinig the data
  [norm,row_mean,newBinMat] = normalizeRatings(Train_RatingMatrix,Bin_Matrix,mean_user);
  
  %% Calculate the cost function with the normalized matrix and other initialized parameters
  cost = @(j) costFunction(j,norm,newBinMat,m,n,features,lambda);
  
  %% Minimize the cost using fmincg
  [Parameters, finalCost] = fmincg(cost, initialParameters,options);
  
  %% Unroll the parameters returned by fmincg() into X matrix and Theta matrix  
  [X Theta] = unrollParameters(Parameters,m,n,features);
  
  %% Calculating the prediction matrix by using the dot product of X and Theta transpose. 
  predVec = X*Theta';
  
  %% Forming the final matrox with original values from training set and predicted values 
  %% from the matrix predVec
  Y{z,1} = predictionMatrix(Bin_Matrix,Train_RatingMatrix,predVec,row_mean);
  
  t = size(bag_matTest,1);
  pred = zeros(t,1);
  
  %% Forming a vector of the predicted matrix for values present in test set for error calculation
  for i = 1:t
    pred(i,1) = Y{z,1}(X_test(i,2),X_test(i,1));
  end
  
  %% Calculating the RMSE for each bag with respective test set
  RMSE = sqrt((sum(pred(:,1)-Y_test).^2)/t)  
end
fprintf('\nTraining for all bags complete!\n');

fprintf(['\nCalculating the final predictions.\n\nPlease wait, this may take a few minutes'... 
        ' (around 10-12 mins approx) because of the ensemble learning teachnique used but it works. Hold tight...\n']);

%% Calculate the final prediction for the original test set
Yboost = boostPredict(Y,ActualMatrix);  

finalX_test = test(:,1:end-1);
finalY_test = test(:,end);

[r,c] = size(test);

finalPred = zeros(size(finalY_test));

%% Taking the final prediction from the Yboost matrix into a vector finalPred 
%% for the values present in original test data set
for i = 1:r
  finalPred(i,1) = round(Yboost(finalX_test(i,2),finalX_test(i,1)));
end


%% Calculate the RMSE for final test set predictions
RMSE = sqrt((sum(finalPred-finalY_test).^2)/r);

fprintf('\nRMSE: %.2f%%\n', double(RMSE));

finalMatrix = fillFinalMatrix(ActualMatrix,Yboost);

%% Convert the matrix into required form of rows and columns (Used Item Rating)
printMatrix = userItemRatings(finalMatrix);

fprintf('\nWriting the output to the file output.txt!\n');
%% Write the out put into the file

dlmwrite('output.txt',printMatrix,' ');
fprintf('\nDone! \n');