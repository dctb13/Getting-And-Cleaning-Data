# Script for Getting and Cleaning Data Course Project

# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
#    variable for each activity and each subject.

# Please make sure to have installed dplyr package, if not run
# run the following 2 lines of code
# install.packages("dplyr")
# library(dplyr)

require(plyr)
require(dplyr)

# 1. Merges the training and the test sets to create one data set.

#set working directory
setwd("C:/Users/DJ/Desktop/Coursera/Getting and Cleaning Data/Course Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

# Read all tables into R
actLabels <- read.table("./activity_labels.txt", col.names = c("ActivityID", "Activity"))
features <- read.table("./features.txt", colClasses = "character")
# test data
testX <- read.table("./test/X_test.txt")
testY <- read.table("./test/Y_test.txt")
subjectTest <- read.table("./test/subject_test.txt")
#train data
trainX <- read.table("./train/X_train.txt")
trainY <- read.table("./train/Y_train.txt")
subjectTrain <- read.table("./train/subject_train.txt")

# COmbine 2 data sets together

Test <- cbind(testY,cbind(subjectTest, testX))
Train <- cbind(trainY,cbind(subjectTrain, trainX))
TestAndTrain <- rbind(Test, Train)

# Label Columns
TestAndTrainLabels <- rbind(c(562, "ActivityID"), c(563, "SubjectID"), features)
names(TestAndTrain) <- TestAndTrainLabels[,2]

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

TestAndTrainSubset <- TestAndTrain[,grepl("mean[()]|std[()]|ActivityID|SubjectID", names(TestAndTrain))]


# 3. Uses descriptive activity names to name the activities in the data set

TestAndTrainSubset <- inner_join(TestAndTrainSubset, actLabels, by = "ActivityID")

# 4. Appropriately labels the data set with descriptive variable names

names(TestAndTrainSubset) <- gsub("mean[(][)]", "Mean_Value", names(TestAndTrainSubset))
names(TestAndTrainSubset) <- gsub("std[(][)]", "Standard_Deviation", names(TestAndTrainSubset))
names(TestAndTrainSubset) <- gsub("[-]", "_", names(TestAndTrainSubset))
names(TestAndTrainSubset) <- gsub("^t", "Time_", names(TestAndTrainSubset))
names(TestAndTrainSubset) <- gsub("^f", "Frequency_", names(TestAndTrainSubset))
names(TestAndTrainSubset) <- gsub("Acc", "Acceleration", names(TestAndTrainSubset))
names(TestAndTrainSubset) <- gsub("Mag", "Magnitude", names(TestAndTrainSubset))
names(TestAndTrainSubset) <- gsub("Gyro", "Gyroscopic", names(TestAndTrainSubset))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
#    variable for each activity and each subject.

TidyDataSubset <- arrange(ddply(TestAndTrainSubset, c("Activity", "SubjectID"), numcolwise(mean)), ActivityID)
write.table(TidyDataSubset, file = "TidyDataSubset.txt")
