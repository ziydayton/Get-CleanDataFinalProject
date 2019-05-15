## GetAndCleanDataFinalProject

##REFERENCES USED/SOURCES:
### - Codebook example from: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
### - Guidance from: https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
### - Original data, original data codebook, original data readme from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
### - Original data code book from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##OVERVIEW:

###     This repository is composed of four primary files.  The first file is the README.md that provides an overview and instruction on the repository composition.  

###     The second file is the run_analysis.R script.  This script reads in and combines the primary data from the UCI data set that was already downloaded and unzipped to the working directory.  From the original data, the experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The data for the training and test sets are combined.  Then the data is summarized by Subject and Activity.  The script produces the output,AverageMeasures.txt.

###     The third file of interest is the AverageMeasures.txt.  The measures from the "Human Activity Recognition Using Smartphones Data Set" were filtered by those measure that were means or standard deviations.  The script "run_analysis.R" merges the test and train data sets and then finds the average of the 86 mean and standard deviation (std) variable for a Subject and their respective Activity. This code book summarizes the variables (columns) in the tidy data produced by the run_analysis.R script.  NOTE:  The assertation that the produced data, "AverageMeasures.txt", is tidy because it fulfills the the 4 applicable traits of a tidy data set; (1) Each measured variable is in one column, (2) Each different observation of that variable is in a different row, (3) Each kind of variable can form its own table, and (4) There are column(s) in the table that link to variables. [Criteria derived from the Coursera, Get & Clean Data, course material.]

###     The fourth file is the CodeBook.txt.  This code book summarized the data/variables in the AverageMeasures.txt to aid further development or use of this summarized data.
