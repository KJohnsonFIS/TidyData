## script run_analysis.R does the following:
##  1) Merges the training and the test sets to create one data set.
##  2) Extracts only the measurements on the mean and standard deviation for each measurement. 
##  3) Uses descriptive activity names to name the activities in the data set
##  4) Appropriately labels the data set with descriptive variable names. 
##  5) creates a second, independent tidy data set with the average 
##     of each variable for each activity and each subject.


## Set the working directory to where I copied files
## that were downloaded from the website, 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

setwd ("C:/Users/user/My Documents/Coursera/Data")

## read the Training set file 
TrainData <- read.table("X_train.txt", header=FALSE)

## read the Training labels file
TrainLabels <- read.table("Y_train.txt", header=FALSE)

## read the Training subject file
TrainSubject <- read.table("subject_train.txt", header=FALSE)

## read the Test set file 
TestData <- read.table("X_test.txt", header=FALSE)

## read the Test labels file - activity that the subjects are doing
TestLabels <- read.table("Y_test.txt", header=FALSE)

## read the Test subject file
TestSubject <- read.table("subject_test.txt", header=FALSE)

## read the Activity Names table which contains the links to the class labels
ActivityLabels <- read.table("activity_labels.txt", header=FALSE)

## read the Features file 
Features <- read.table("features.txt", header=FALSE)

## find the indexes of the Feature columns containing mean and std
ColsIndex <- with(Features, grepl("mean", V2) | grepl("std", V2))

## subset out the rows containing mean and std
FeatSub <- Features[ColsIndex,]

## subset out the columns containing mean and std from Training data
TrainSub <- TrainData[,ColsIndex]

## change column names of Train subset data to the Features col names 

colnames(TrainSub) <- FeatSub[,2]

## subset out the columns in the Test data that contain mean and std
TestSub <- TestData[,ColsIndex]

##  change column names of Train subset data to the Features col names 
colnames(TestSub) <- FeatSub[,2]

## column combine the label files to the Train Data
TrainWlbls <- cbind(TrainLabels,TrainSub)

## column combine the label files to the Test Data
TestWlbls <- cbind(TestLabels,TestSub)

## column combine the Subject files to the Train Data
TrainAll<- cbind(TrainSubject,TrainWlbls)

## column combine the Subject files to the Test Data
TestAll<- cbind(TestSubject,TestWlbls)

## combine the Train and Test files
CombineFile <- rbind(TrainAll, TestAll)

## rename  column names to label
colnames(CombineFile)[1:2] <- c("subject", "label")

## rename  column names to label
colnames(ActivityLabels)[1] <- c("label")

## create column with the combined data adding actual activity descriptions

CombineAct<- merge(ActivityLabels, CombineFile, x.by='label', y.by='label', all.y = T)


## rename activity column names
colnames(CombineAct)[2] <- c("activity")

## Remove label column since I now have activity description column
CombineAct <- CombineAct[,-1]

##Create file reshaping the features(variable) rows to columns(long form)
library(reshape2)
CombineMelt <- melt(CombineAct, id.vars = c("activity","subject"))

##Create file of tidy data creating the mean by subject, activity,variable
library(plyr)

TidyData <- ddply(CombineMelt, .(activity,subject,variable), summarize, measurement.mean = mean(value))

## make variable column names more descriptive

colnames(TidyData)[3] <- c("measurement")

## write out the tidy data file to a text file
write.table(TidyData,file="tidyavgs.txt", row.name=FALSE)

