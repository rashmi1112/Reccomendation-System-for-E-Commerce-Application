# Reccomendation-System-for-E-Commerce-Application

1) Platform used: GNU Octave 5.2.0

2) Instructions to run: 
	From the GUI: 
	- Open main.m from the folder.
	- Run the program.
	
	From Command Prompt: 
	- run main.m 

3) Note: The run time may be a bit more due to the ensemble technique I am using. So please wait for the complete execution of the program. The program
generates a valid output. The future scope of this project includes reducing the execution time and also improving the computational efficiency.

4) The program requires the setting of parameters like lambda, features and k. I have experimented with many values and the values set currently in the 
submitted program worked the best for me. The current selection of lambda = 10, features = 30 and k = 8, gives me an RMSE with my test data as good as 0.13%.

Below are some of my observations with different parameter values and their respective RMSE's: 

	a. lambda =  10
	   features =  20
	   k =  5
	   RMSE: 0.50%

	b. lambda =  15
	   features =  20
	   k =  5
	   RMSE: 0.84%

	c. lambda =  10
	   features =  10
	   k =  10
	   RMSE: 1.27%

	d. lambda =  5
	   features =  20
	   k =  10
	   RMSE: 3.68%

	e. lambda =  5
	   features =  10
	   k =  0
	   RMSE: 1.11%

5) References and Resources used: 

	a. https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0184516       
	b. https://paperswithcode.com/paper/on-the-difficulty-of-evaluating-baselines-a             
	c. https://arxiv.org/abs/1901.03888
	d. https://www.coursera.org/learn/machine-learning/lecture/Rhg6r/problem-formulation
	e. Coursera - Andrew Ng's course for Machine Learning (Recommender System) and its assignment from Week-9.
	f. https://www.netflixprize.com/assets/GrandPrize2009_BPC_BellKor.pdf
