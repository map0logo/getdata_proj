# CodeBook

This code book that describes variables, data, and transformations related to project of course **Getting and Cleanind Data** 9th edition.

## The data source

* Data are taken from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Detailed description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

## The data

The dataset includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about variables used on feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links class labels with their activity name. Contains all the different types of activities: `WALKING`, `WALKING_UPSTAIRS`, `SITTING`, etc
- 'train/X_train.txt': Training set. Containing all the 541 columns of raw data in the training set
- 'train/y_train.txt': Training labels. Containing all label data inside the training set.
- 'test/X_test.txt': Test set. Containing all the 541 columns of raw data in the test set
- 'test/y_test.txt': Test labels. Containing all label data inside the test set.

The following files are available for train and test data. Their descriptions are similar:

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## Fields

The features come from accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ, captured at a constant rate of 50 Hz. Filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.

Acceleration signal was separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Fast Fourier Transform (FFT) was applied to some signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

 time domain | frequency domain |
 ------------|------------------|
tBodyAcc-XYZ | fBodyAcc-XYZ |
tGravityAcc-XYZ | --- |
tBodyAccJerk-XYZ |  fBodyAccJerk-XYZ |
tBodyGyro-XYZ | fBodyGyro-XYZ |
tBodyGyroJerk-XYZ | ---- |
tBodyAccMag | fBodyAccMag |
tGravityAccMag | ---- |
tBodyAccJerkMag | fBodyAccJerkMag |
tBodyGyroMag | fBodyGyroMag |
tBodyGyroJerkMag | fBodyGyroJerkMag |

The set of variables that were estimated from these signals are: 

 Variable | description |
 ---------|-------------|
`mean()` | Mean value |
`std()` | Standard deviation |
`mad()` | Median absolute deviation |
`max()` | Largest value in array |
`min()` | Smallest value in array |
`sma()` | Signal magnitude area |
`energy()` | Energy measure. Sum of the squares divided by the number of values |
`iqr()` | Interquartile range |
`entropy()` | Signal entropy |
`arCoeff()` | Autorregresion coefficients with Burg order equal to 4 |
`correlation()` | correlation coefficient between two signals |
`maxInds()` | index of the frequency component with largest magnitude |
`meanFreq()` | Weighted average of the frequency components to obtain a mean frequency |
`skewness()` | skewness of the frequency domain signal |
`kurtosis()` | kurtosis of the frequency domain signal |
`bandsEnergy()` | Energy of a frequency interval within the 64 bins of the FFT of each window |
`angle()` | Angle between to vectors |

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean
