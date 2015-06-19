# Codebook for the HAR Dataset

## Column names

This dataset contains the following columns:

_subject_: The ID of the subject associated with each observation (1-30)
_activity_: The activity associated with each measurement (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING)
_measure_: The type of measurement: mean or standard deviation
_variable_: the name of the feature (see below)
_value_: the value of the feature (normalized and bounded within [-1,1])

## Data processing

The tidy dataset was obtained by running _run_analysis.R_ to:

1. Combine  the training and test datasets
2. Link the measurements to subject IDs
3. Label each activity and feature
4. Compute means and SDs for each activity, by subject and activity
5. Remove all measurements other than means and SDs
6. Reshape the data so that each feature/activity/subject/measure (mean or SD) combination is in its own row

## Features

The features are listed as follows:

* tBodyAcc....X
* tBodyAcc....Y
* tBodyAcc....Z
* tGravityAcc....X
* tGravityAcc....Y
* tGravityAcc....Z
* tBodyAccJerk....X
* tBodyAccJerk....Y
* tBodyAccJerk....Z
* tBodyGyro....X
* tBodyGyro....Y
* tBodyGyro....Z
* tBodyGyroJerk....X
* tBodyGyroJerk....Y
* tBodyGyroJerk....Z
* tBodyAccMag...
* tGravityAccMag...
* tBodyAccJerkMag...
* tBodyGyroMag...
* tBodyGyroJerkMag...
* fBodyAcc....X
* fBodyAcc....Y
* fBodyAcc....Z
* fBodyAcc.Freq...X
* fBodyAcc.Freq...Y
* fBodyAcc.Freq...Z
* fBodyAccJerk....X
* fBodyAccJerk....Y
* fBodyAccJerk....Z
* fBodyAccJerk.Freq...X
* fBodyAccJerk.Freq...Y
* fBodyAccJerk.Freq...Z
* fBodyGyro....X
* fBodyGyro....Y
* fBodyGyro....Z
* fBodyGyro.Freq...X
* fBodyGyro.Freq...Y
* fBodyGyro.Freq...Z
* fBodyAccMag...
* fBodyAccMag.Freq..
* fBodyBodyAccJerkMag...
* fBodyBodyAccJerkMag.Freq..
* fBodyBodyGyroMag...
* fBodyBodyGyroMag.Freq..
* fBodyBodyGyroJerkMag...
* fBodyBodyGyroJerkMag.Freq..
* angle.tBodyAcc.gravity.
* angle.tBodyAccJerk..gravity.
* angle.tBodyGyro.gravity.
* angle.tBodyGyroJerk.gravity.
* angle.X.gravity.
* angle.Y.gravity.
* angle.Z.gravity.

The features are described in detail here: http://archive.ics.uci.edu/ml/machine-learning-databases/00240/

From  features.txt in the raw dataset: "The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

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

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean"
