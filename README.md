# Getting-and-Cleaning-Data-Assignment
Assignment for the course on  'Getting and Cleaning Data', offered by Johns Hopkins University

## Details of the files in this Repo

* 'CodeBook.md' contains details of the variables and identifiers of the tidydata.txt
* 'tidydata.txt' contains a clean version of the data provided in this link - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip The description of the data is provided here -http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* 'run_analysis.R' gives an outline of the code that extracts data from the given link, and creates the tidy data

## Details of the working of run_analysis.R

* Download and unzip the folder if it does not exist
* Load train and test data
* Merge the training and the test sets to create one data set
* Load the variable Labels
* Load only the measurements of the mean and the SD of each measurement
* Assign Appropriate names to the variables of the merged data set
* Creat a tidy data set by grouping, and finding the average of each variable for each activity and each subject.
* The code extracts only the measurements on the mean and standard deviation for each measurement.
