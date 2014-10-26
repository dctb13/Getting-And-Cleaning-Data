---
title: "Codebook"
date: "Sunday, October 26, 2014"
output: html_document
---

Code Book
Raw data collection

Collection
Raw data are obtained from UCI Machine Learning repository. In particular we used the Human Activity Recognition Using Smartphones Data Set [1], that was used by the original collectors to conduct experiments exploiting Support Vector Machine (SVM) [2].
Activity Recognition (AR) aims to recognize the actions and goals of one or more agents from a series of observations on the agents' actions and the environmental conditions [3]. The collectors used a sensor based approach employing smartphones as sensing tools. Smartphones are an effective solution for AR, because they come with embedded built-in sensors such as microphones, dual cameras, accelerometers, gyroscopes, etc.
The data set was built from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually [4].
The obtained data set has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
Signals
The 3-axial time domain [5] signals from accelerometer and gyroscope were captured at a constant rate of 50 Hz [6]. Then they were filtered to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another filter. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals [7]. Also the magnitude [8] of these three-dimensional signals were calculated using the Euclidean norm [9]. Finally a Fast Fourier Transform (FFT) [10] was applied to some of these time domain signals to obtain frequency domain [11] signals.
The signals were sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window at 50 Hz). From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
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
arCoeff(): Autoregression coefficients with Burg order equal to 4
correlation(): Correlation coefficient between two signals
maxInds(): Index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): Skewness of the frequency domain signal
kurtosis(): Kurtosis of the frequency domain signal
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between some vectors.
No unit of measures is reported as all features were normalized and bounded within [-1,1].

Data transformation
The raw data sets are processed with run_analisys.R script to create a tidy data set [12].
Merge training and test sets
Test and training data (X_train.txt, X_test.txt), subject ids (subject_train.txt, subject_test.txt) and activity ids (y_train.txt, y_test.txt) are merged to obtain a single data set. Variables are labelled with the names assigned by original collectors (features.txt).
Extract mean and standard deviation variables
From the merged data set is extracted and intermediate data set with only the values of estimated mean (variables with labels that contain "mean") and standard deviation (variables with labels that contain "std").
Use descriptive activity names
A new column is added to intermediate data set with the activity description. Activity id column is used to look up descriptions in activity_labels.txt.
Label variables appropriately
Labels given from the original collectors were changed: to obtain valid R names without parentheses, dashes and commas to obtain more descriptive labels
Create a tidy data set
From the intermediate data set is created a final tidy data set where numeric variables are averaged for each activity and each subject.
The tidy data set contains 180 observations with 69 variables , three of which are "Activity"", "SubjectID"" and "ActivityID"" divided in:
an activity label (Activity): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
an identifier of the subject who carried out the experiment (SubjectID): 1:30

Variables in the TidyDataSubset are listed below:

Activity
SubjectID
ActivityID
Time_BodyAcceleration_Mean_Value_X
Time_BodyAcceleration_Mean_Value_Y
Time_BodyAcceleration_Mean_Value_Z
Time_BodyAcceleration_Standard_Deviation_X
Time_BodyAcceleration_Standard_Deviation_Y
Time_BodyAcceleration_Standard_Deviation_Z
Time_GravityAcceleration_Mean_Value_X
Time_GravityAcceleration_Mean_Value_Y
Time_GravityAcceleration_Mean_Value_Z
Time_GravityAcceleration_Standard_Deviation_X
Time_GravityAcceleration_Standard_Deviation_Y
Time_GravityAcceleration_Standard_Deviation_Z
Time_BodyAccelerationJerk_Mean_Value_X
Time_BodyAccelerationJerk_Mean_Value_Y
Time_BodyAccelerationJerk_Mean_Value_Z
Time_BodyAccelerationJerk_Standard_Deviation_X
Time_BodyAccelerationJerk_Standard_Deviation_Y
Time_BodyAccelerationJerk_Standard_Deviation_Z
Time_BodyGyroscopic_Mean_Value_X
Time_BodyGyroscopic_Mean_Value_Y
Time_BodyGyroscopic_Mean_Value_Z
Time_BodyGyroscopic_Standard_Deviation_X
Time_BodyGyroscopic_Standard_Deviation_Y
Time_BodyGyroscopic_Standard_Deviation_Z
Time_BodyGyroscopicJerk_Mean_Value_X
Time_BodyGyroscopicJerk_Mean_Value_Y
Time_BodyGyroscopicJerk_Mean_Value_Z
Time_BodyGyroscopicJerk_Standard_Deviation_X
Time_BodyGyroscopicJerk_Standard_Deviation_Y
Time_BodyGyroscopicJerk_Standard_Deviation_Z
Time_BodyAccelerationMagnitude_Mean_Value
Time_BodyAccelerationMagnitude_Standard_Deviation
Time_GravityAccelerationMagnitude_Mean_Value
Time_GravityAccelerationMagnitude_Standard_Deviation
Time_BodyAccelerationJerkMagnitude_Mean_Value
Time_BodyAccelerationJerkMagnitude_Standard_Deviation
Time_BodyGyroscopicMagnitude_Mean_Value
Time_BodyGyroscopicMagnitude_Standard_Deviation
Time_BodyGyroscopicJerkMagnitude_Mean_Value
Time_BodyGyroscopicJerkMagnitude_Standard_Deviation
Frequency_BodyAcceleration_Mean_Value_X
Frequency_BodyAcceleration_Mean_Value_Y
Frequency_BodyAcceleration_Mean_Value_Z
Frequency_BodyAcceleration_Standard_Deviation_X
Frequency_BodyAcceleration_Standard_Deviation_Y
Frequency_BodyAcceleration_Standard_Deviation_Z
Frequency_BodyAccelerationJerk_Mean_Value_X
Frequency_BodyAccelerationJerk_Mean_Value_Y
Frequency_BodyAccelerationJerk_Mean_Value_Z
Frequency_BodyAccelerationJerk_Standard_Deviation_X
Frequency_BodyAccelerationJerk_Standard_Deviation_Y
Frequency_BodyAccelerationJerk_Standard_Deviation_Z
Frequency_BodyGyroscopic_Mean_Value_X
Frequency_BodyGyroscopic_Mean_Value_Y
Frequency_BodyGyroscopic_Mean_Value_Z
Frequency_BodyGyroscopic_Standard_Deviation_X
Frequency_BodyGyroscopic_Standard_Deviation_Y
Frequency_BodyGyroscopic_Standard_Deviation_Z
Frequency_BodyAccelerationMagnitude_Mean_Value
Frequency_BodyAccelerationMagnitude_Standard_Deviation
Frequency_BodyBodyAccelerationJerkMagnitude_Mean_Value
Frequency_BodyBodyAccelerationJerkMagnitude_Standard_Deviation
Frequency_BodyBodyGyroscopicMagnitude_Mean_Value
Frequency_BodyBodyGyroscopicMagnitude_Standard_Deviation
Frequency_BodyBodyGyroscopicJerkMagnitude_Mean_Value
Frequency_BodyBodyGyroscopicJerkMagnitude_Standard_Deviation 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration 
signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the 
Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.