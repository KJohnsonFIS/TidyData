==================================================================
tidyavgs.txt Dataset
R script-run_analysis.R

==================================================================
Karen Johnson - Getting and Cleaning Data class
============================
This script, run_analysis.R, takes files downloaded from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
(files downloaded and used are- 
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'X_train.txt': Training set.
- 'y_train.txt': Training labels.
- 'X_test.txt': Test set.
- 'y_test.txt': Test labels.
- 'subject_train.txt': Each row identifies the subject who performed the activity 
- 'subject_test.txt': Each row identifies the subject who performed the activity 
 )
The files that are used are then copied to the working directory "C:/Users/user/My Documents/Coursera/Data"
The script combines the labels, subject files to the corresponding Training and Test sets.
The scripts finds the features row indexes with the mean() and std() values
The script then uses the indexes to extract the Features and the columns from the Training and Test data sets
The script then combines the Training and Test data (ie with the subject and labels)
The script changes the Training and Test data column names to the Features (mean/std)column names
the script then matches the files to the Activity labels to add the activity descriptions combine file 
The script converts this file to the long form, making the features(measurements) into  rows (ie from column to row)
the script then summarizes the file and add the mean of the measurement values
The output file is named “tidyavgs.txt” and contains the follow fields
  activity - six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) performed by the subjects
  subject – the subject that performed the activity
  measurement – the mean() and std() variables that are estimated from time and frequency domain Variable
  measurement.mean – mean of the the mean() and std() variables

