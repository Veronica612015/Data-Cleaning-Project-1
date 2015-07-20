# Data-Cleaning-Project-1
Coursera: Getting and Cleaning Data Project 1
Getting and cleaning data
For creating a tidy data set of data wearable  originally from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Files in this repo

README.md -- this file

CodeBook.md -- codebook describing variables and transformations

run_analysis.R --  R script


You should create one R script called run_analysis.R that does the following: 

1. Merges the training and the test sets to create one data set. 
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set 
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script will download a zip file and unzip it. The zip file is from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The output is created in working directory with the name of tidyData.txt

The files used in this project include:


The following section of code reads in 7 files as listed beloww. These files are combined
into a single data frame.
 1. activity - contains the labels identifying the action as a factor. The factor is 
              a key that links this file with 
              the data set code in y_Test.txt and y_Train.txt
 2. xTest -    contains the testing data set..
 3. yTest -    contains a key that links to the activity data frame to identify the 
                activity.
 4. subjectsTest - identifies the subject for each row of data in xTest.
 5. xTrain -   contains the training data set..
 6. yTrain -   contains a key that links to the activity data frame to identify the 
                activity.
 7. subjectsTrain - identifies the subject for each row of data in xTrain.
 8. features   contains the labels for the columns of xTest and xTrain
 9. tidyData    contains the file to be output


Summary of run_analysis.R code:



Step 1:

Read all the files listed above and combine into a single file (allData). The code will read in all the files and then combine the subject files for the testing and training sets. The feature labels are added to the file that combines the testing and training data. This is done so that the labels can be used to melt the data frame. The code will then combine the testing and training data with the newly combines subject file into a single allData data frame.

Step 2:

Grep is used  to limit the names to only those that contain mean()  (note that h=this iincludes meanfreq and mean as argument call (mean) which are not the mean) and std. Use this new set of column names to melt allData.

Step 3:
Use the activity labels from activity_laboels.txt and replace the activity numbers with the text.

Step 4:
Convert all column heading to be lower case and eliminate all nonnumeric data.

Step 5:
Use the aggregate() function to compute the mean and std for each subject/activity combination. Write the new file.
