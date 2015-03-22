Code Book for  ‘ run_analysis.R’
This Code Book contains the following sections:
A.	Input files Data Description
B.	Output file Data Description
C.	Transformation from Input files to Output file

A.	Input files Data Description:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.
 
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

B.	Output file Data Description

The output file is named “tidyavgs.txt” and contains the follow fields

activity - six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) performed by the subjects

subject – the subject that performed the activity

measurement – the mean() and std() variables that are estimated from time and frequency domain Variable

measurement.mean – mean of the the mean() and std() variables


C.	Transformation from Input files to Output file

downloaded  files from the website, 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Create a script run_analysis.R which does the following:

## read the Training set file "X_train.txt"

## read the Training labels file "Y_train.txt"

## read the Training subject file "subject_train.txt"

## read the Test set file "X_test.txt"

## read the Test labels file "Y_test.txt", activity that the subjects are doing

## read the Test subject file "subject_test.txt"

## read the Activity Names table "activity_labels.txt",  which contains the links to the class labels

## read the Features file "features.txt"

## find the indexes of the Feature columns containing mean and std

## subset out the rows containing mean and std

## subset out the columns containing mean and std from Training data

## change column names of Train subset data to the Features col names 

## subset out the columns in the Test data that contain mean and std

##  change column names of Train subset data to the Features col names 

## column combine the label files to the Train Data

## column combine the label files to the Test Data

## column combine the Subject files to the Train Data

## column combine the Subject files to the Test Data

## combine the Train and Test files

## rename  column names to label on the combine and activitylabels files

## create column with the combined data adding actual activity descriptions

## rename activity column names

## Remove label column since I now have activity description column

##Create file reshaping the features(variable) rows to columns(long form)

##Create file of tidy data creating the mean by subject, activity,variable

## make variable column names more descriptive

## write out the tidy data file, "tidyavgs.txt",  to a text file
