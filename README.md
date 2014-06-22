Getting-and-Cleaning-data-course-project
========================================

The script run_analysis.R calculates the averages and standard deviations of specified parameters measured using accelerometers contained within Samsung smartphones. 



To begin download the data folder Human Activity Recognition Dataset Version 1.0.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

unzip the zip file and set the working directory in R to the parent directory of the unzipped folder

The text files for training and test datasets are read from the working directory. As are the corresponding text files containgin the variable names and subject ids. The training and the test sets are then merged, and the mean and standard deviation are calculated for each measurement. 
Variable names are then renamed according to the corresponding activity described within the activities data set. The variable names are then cleaned to make the dataset more easy to read before a 
second, 'tidy' dataframe is created with the average of each variable grouped for each activity and each subject. 

Refer to the codebook.md for clarification on the variables in the dataset and the analysis performed.
