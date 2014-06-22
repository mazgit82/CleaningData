# Introduction

This is the codebook corresponding to the "secondTidySet.txt" dataset. It contains the means of several variables for every subject and activity, as described below.

# Processing steps:

* Load input variables (x), activity variable (y), and subject variable for the training data
* Load input variables (x), activity variable (y), and subject variable for the testing data
* x, y, and subject training and testing variables are merged into a single variable with rbind
* The activity variable (y) is transformed to a more descriptive format by using the activity descriptions contained in file activity_labels.txt
* Input variables (x's columns) are labeled descriptively by using the names contained in the features.txt file
* Only the mean and std measurements are kept. It has been decided that although the word mean appears in some variables, they are not the ones meant by the assignment. Those are the meanFreq variables and the angle variables. They have been removed by means of regular expressions
* In order to make variable names human readable, the following replacements have been carried out: "Acc" => "Accelerometer", "Gyro" => "Gyroscope", "Mag" => "Magnitude"
* The first tidy data set is constructed by combining the subject, input variables (x), and activity variable (y) with cbind. The result is stored in the "firsTidySet.txt" file
* The target tidy data set (the one described in this codebook) is created by averaging each variable for every subject and activity. ddply (from the plyr package) has been used with this purpose. 

# Description of Variables

* subject: It is the subject related to the measurement variables. Values: integers 1 to 30 (as many as subjects)

* activity: Describes the activity performed by the subject. Values: "LAYING" "SITTING" "STANDING" "WALKING" "WALKING_DOWNSTAIRS" "WALKING_UPSTAIRS"

* Next, there are several variables that contain the average per subject and activity of the corresponding variables in the first tidy data set. 

The names of these variables follow this structure: variable-statistic-axis, where statistic can be either mean or std (standard deviation), and axis can be one of X, Y, or Z. The structure of the name can also be variable-statistic in case no axis is associated to that variable. The variable name can be one of the following: 

* tBodyAccelerator 
* tGravityAccelerator 
* tBodyAcceleratorJerk 
* tBodyGyroscope 
* tBodyGyroscopeJerk 
* tBodyAcceleratorMagnitude 
* tGravityAcceleratorMagnitude 
* tBodyAcceleratorJerkMagnitude 
* tBodyGyroscopeMagnitude 
* tBodyGyroscopeJerkMagnitude 
* fBodyAccelerator 
* fBodyAcceleratorJerk 
* fBodyGyroscope 
* fBodyAcceleratorMagnitude 
* fBodyAcceleratorJerkMagnitude 
* fBodyGyroscopeMagnitude 
* fBodyGyroscopeJerkMagnitude

Next, each of these variables will be described, taking advantage of the description present in the raw dataset. The units of the variables are:

* standard gravity units 'g' for any variable with "Accelerometer" in the name
* radians/second for any variable with "Gyroscope" in the name


The features selected for this database come from the Accelerator and Gyroscope 3-axial raw signals tAccelerator-XYZ and tGyroscope-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the Acceleratoreleration signal was then separated into body and gravity Acceleratoreleration signals (tBodyAccelerator-XYZ and tGravityAccelerator-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear Acceleratoreleration and angular velocity were derived in time to obtain Jerk signals (tBodyAcceleratorJerk-XYZ and tBodyGyroscopeJerk-XYZ). Also the Magnitudenitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAcceleratorMagnitude, tGravityAcceleratorMagnitude, tBodyAcceleratorJerkMagnitude, tBodyGyroscopeMagnitude, tBodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAccelerator-XYZ, fBodyAcceleratorJerk-XYZ, fBodyGyroscope-XYZ, fBodyAcceleratorJerkMagnitude, fBodyGyroscopeMagnitude, fBodyGyroscopeJerkMagnitude. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAccelerator-XYZ
* tGravityAccelerator-XYZ
* tBodyAcceleratorJerk-XYZ
* tBodyGyroscope-XYZ
* tBodyGyroscopeJerk-XYZ
* tBodyAcceleratorMagnitude
* tGravityAcceleratorMagnitude
* tBodyAcceleratorJerkMagnitude
* tBodyGyroscopeMagnitude
* tBodyGyroscopeJerkMagnitude
* fBodyAccelerator-XYZ
* fBodyAcceleratorJerk-XYZ
* fBodyGyroscope-XYZ
* fBodyAcceleratorMagnitude
* fBodyAcceleratorJerkMagnitude
* fBodyGyroscopeMagnitude
* fBodyGyroscopeJerkMagnitude

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample:

* gravityMean
* tBodyAcceleratorMean
* tBodyAcceleratorJerkMean
* tBodyGyroscopeMean
* tBodyGyroscopeJerkMean

The complete feature set is:

* subject
* activity
* tBodyAccelerometer-mean-X 
* tBodyAccelerometer-mean-Y 
* tBodyAccelerometer-mean-Z 
* tBodyAccelerometer-std-X 
* tBodyAccelerometer-std-Y 
* tBodyAccelerometer-std-Z 
* tGravityAccelerometer-mean-X 
* tGravityAccelerometer-mean-Y 
* tGravityAccelerometer-mean-Z 
* tGravityAccelerometer-std-X 
* tGravityAccelerometer-std-Y 
* tGravityAccelerometer-std-Z 
* tBodyAccelerometerJerk-mean-X 
* tBodyAccelerometerJerk-mean-Y 
* tBodyAccelerometerJerk-mean-Z 
* tBodyAccelerometerJerk-std-X 
* tBodyAccelerometerJerk-std-Y 
* tBodyAccelerometerJerk-std-Z 
* tBodyGyroscope-mean-X 
* tBodyGyroscope-mean-Y 
* tBodyGyroscope-mean-Z 
* tBodyGyroscope-std-X 
* tBodyGyroscope-std-Y 
* tBodyGyroscope-std-Z 
* tBodyGyroscopeJerk-mean-X 
* tBodyGyroscopeJerk-mean-Y 
* tBodyGyroscopeJerk-mean-Z 
* tBodyGyroscopeJerk-std-X 
* tBodyGyroscopeJerk-std-Y 
* tBodyGyroscopeJerk-std-Z 
* tBodyAccelerometerMagnitude-mean 
* tBodyAccelerometerMagnitude-std 
* tGravityAccelerometerMagnitude-mean 
* tGravityAccelerometerMagnitude-std 
* tBodyAccelerometerJerkMagnitude-mean 
* tBodyAccelerometerJerkMagnitude-std 
* tBodyGyroscopeMagnitude-mean 
* tBodyGyroscopeMagnitude-std 
* tBodyGyroscopeJerkMagnitude-mean 
* tBodyGyroscopeJerkMagnitude-std 
* fBodyAccelerometer-mean-X 
* fBodyAccelerometer-mean-Y 
* fBodyAccelerometer-mean-Z 
* fBodyAccelerometer-std-X 
* fBodyAccelerometer-std-Y 
* fBodyAccelerometer-std-Z 
* fBodyAccelerometerJerk-mean-X 
* fBodyAccelerometerJerk-mean-Y 
* fBodyAccelerometerJerk-mean-Z 
* fBodyAccelerometerJerk-std-X 
* fBodyAccelerometerJerk-std-Y 
* fBodyAccelerometerJerk-std-Z 
* fBodyGyroscope-mean-X 
* fBodyGyroscope-mean-Y 
* fBodyGyroscope-mean-Z 
* fBodyGyroscope-std-X 
* fBodyGyroscope-std-Y 
* fBodyGyroscope-std-Z 
* fBodyAccelerometerMagnitude-mean 
* fBodyAccelerometerMagnitude-std 
* fBodyBodyAccelerometerJerkMagnitude-mean 
* fBodyBodyAccelerometerJerkMagnitude-std 
* fBodyBodyGyroscopeMagnitude-mean 
* fBodyBodyGyroscopeMagnitude-std 
* fBodyBodyGyroscopeJerkMagnitude-mean 
* fBodyBodyGyroscopeJerkMagnitude-std 



