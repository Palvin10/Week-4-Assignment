
## Here are the data for the project:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


##You should create one R script called run_analysis.R that does the following.

## 1. Merge the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)
library(data.table)
library(readr)

##1. Download the data files
path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, file.path(path, "dataFiles.zip"))
unzip(zipfile = "dataFiles.zip")



# Load the activity labels + features
activity_labels <- fread(file.path(path, "UCI HAR Dataset/activity_labels.txt") ##extract out activity labels from .txt to R & specifying column names
                        , col.names = c("class_labels", "activity_name"))
features <- fread(file.path(path, "UCI HAR Dataset/features.txt") ## extract out features from .txt to R & specifying column names
                  , col.names = c("index", "feature_names"))
features_interested <- grep("(mean|std)\\(\\)", features[, feature_names]) ##select only those with mean & sd in features name
measurements <- features[features_interested, feature_names] ##combine features wanted and features names
measurements <- gsub('[()]', '', measurements) ## remove () to ''

# Load the train datasets   ## bind subjects, activity and measurements in train datasets together.
train <- fread(file.path(path, "UCI HAR Dataset/train/X_train.txt"))[, features_interested, with = FALSE]   ##select only the relevant columns with with=false 
data.table::setnames(train, colnames(train), measurements) ##set the features names stored in measurements to appropriate columns
train_activities <- fread(file.path(path, "UCI HAR Dataset/train/Y_train.txt")       
                         , col.names = c("Activity"))
train_subjects <- fread(file.path(path, "UCI HAR Dataset/train/subject_train.txt")
                       , col.names = c("SubjectNum"))
train <- cbind(train_subjects, train_activities, train) ##column bind subjects and activities in training set

# Load the test datasets  ## bind subjects, activity and measurements in test datasets together.
test <- fread(file.path(path, "UCI HAR Dataset/test/X_test.txt"))[, features_interested, with = FALSE]
data.table::setnames(test, colnames(test), measurements)
test_activities <- fread(file.path(path, "UCI HAR Dataset/test/Y_test.txt")
                        , col.names = c("Activity"))
test_subjects <- fread(file.path(path, "UCI HAR Dataset/test/subject_test.txt")
                      , col.names = c("SubjectNum"))
test <- cbind(test_subjects, test_activities, test)

# merge train and test datasets 
combined_data <- rbind(train, test)


# Add labels. COnverting the codes 1-6 to activity labels
combined_data[["Activity"]] <- factor(combined_data[, Activity]
                                 , levels = activity_labels[["class_labels"]]
                                 , labels = activity_labels[["activity_name"]])

combined_data[["SubjectNum"]] <- as.factor(combined_data[, SubjectNum])
combined_data <- reshape2::melt(data = combined_data, id = c("SubjectNum", "Activity"))
combined_data <- reshape2::dcast(data = combined_data, SubjectNum + Activity ~ variable, fun.aggregate = mean) ##reshape based on data, subject number and activity

data.table::fwrite(x = combined_data, file = "tidy.txt", quote = FALSE)
