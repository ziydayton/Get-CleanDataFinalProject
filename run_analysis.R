
#Library calls
library(dplyr)

# You should create one R script called run_analysis.R that does the following.
# 
### 1 - Merges the training and the test sets to create one data set.
##Read in Data
activity <- read.table(file = "./UCI_HAR_Dataset/activity_labels.txt", 
                       header = FALSE, row.names = 1, 
                       stringsAsFactors = FALSE)
features <- read.table(file = "./UCI_HAR_Dataset/features.txt", 
                       header = FALSE, row.names = 1, 
                       stringsAsFactors = FALSE)
##Test Data
#Read data files for test
subject_test <- read.table(file = "./UCI_HAR_Dataset/test/subject_test.txt",
                           header = FALSE, 
                           stringsAsFactors = FALSE)
xtest <- read.table(file = "./UCI_HAR_Dataset/test/X_test.txt",
                    stringsAsFactors = FALSE)
ytest <- read.table(file = "./UCI_HAR_Dataset/test/y_test.txt",
                    stringsAsFactors = FALSE)

#Combine and label test data
test <- cbind(subject_test, ytest, xtest)
colnames(test) <- c("Subject", "Activity", c(features$V2))

#Remove raw data files for test
rm(subject_test, ytest, xtest)

##Train Data
#Read data files for train
subject_train <- read.table(file = "./UCI_HAR_Dataset/train/subject_train.txt",
                            header = FALSE, 
                            stringsAsFactors = FALSE)
xtrain <- read.table(file = "./UCI_HAR_Dataset/train/X_train.txt",
                     stringsAsFactors = FALSE)
ytrain <- read.table(file = "./UCI_HAR_Dataset/train/y_train.txt",
                     stringsAsFactors = FALSE)

#Combine and label train data
train <- cbind(subject_train, ytrain, xtrain)
colnames(train) <- c("Subject", "Activity", c(features$V2))

#Remove raw data files for train & features
rm(subject_train, ytrain, xtrain, features)

#Combine (Merge) the test and train data
fullData <- rbind(train, test)  ##<- Merged test and train data sets
rm(test, train)


# 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
#Find the indexes for mean and std of each measurement -- keep all instances
#Also keep first two columns for subject and activity
keep.index <- sort(c(1, 2, 
           grep("mean", names(fullData)),
           grep("Mean", names(fullData)),
           grep("std", names(fullData))), decreasing = FALSE)

#Creates data frame to include mean and standard deviation measurements
df.mu <- fullData[, keep.index] #<- data frame of mean & std measurements
rm(keep.index)

# 3 - Uses descriptive activity names to name the activities in the data set
df.mu$Activity <- activity[df.mu$Activity, 1] #<- Activities updated from integers to c("STANDING", "SITTING", "LAYING", WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS")
rm(activity)

# 4 - Appropriately labels the data set with descriptive variable names.
features <- names(df.mu)
features <- gsub("()", "", features, fixed = TRUE)
features <- gsub(")", "", features, fixed = TRUE)
features <- gsub("(", "_", features, fixed = TRUE)
features <- gsub(",", "_", features, fixed = TRUE)
names(df.mu) <- features  #<- reassignes updated descriptive names
rm(features)


# 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
df.ave <- df.mu %>% 
  group_by(Subject, Activity) %>% 
  summarize_all(funs(mean))

