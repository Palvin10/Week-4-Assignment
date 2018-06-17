# Week-4-Assignment
Peer-graded Assignment: Getting and Cleaning Data Course Project
# This project includes four files: README.md, Codebook.md, run_analysis.R, tidy.txt
# Followings are done (run_analysis.R):
1.	Download the dataset to working directory and unzip.
2.	Load the following datasets: X_train.txt, X_test.txt, Y_train.txt, Y_test.txt, subject_train.txt, subject_test.txt, features.txt,       activity_labels.txt.
3.	Extract the variables that contains the measurements on mean and standard deviation of the respective activity performed by subject     for train and test dataset.
4.	Combine the activity and subject columns for both train and test dataset respectively.
5.	Merge train and test dataset. 
6.	Uses descriptive activity names to name the activities in the data set.
7.	Appropriately labels the data set with descriptive variable names.
8.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
9.	Processed data is stored in tidy.txt file.
10.	More details on what the dataset comprises of is found in Codebook.md.




Information below provides an understanding of the UCI HAR dataset being used for this project.
==================================================================================================================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


