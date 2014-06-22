# Main script

The main (and only) script used is run_analysis.R. It assumes that data, as downloaded from the course, is in the directory "UCI HAR dataset". It produces two output files: firstTidySet and secondTidySet. The former fulfills steps 1 to 4 of the assignment, and the later contains step 5 (means for every subject and activity)

# Steps:

* Load input variables (x), activity variable (y), and subject variable for the training data
* Load input variables (x), activity variable (y), and subject variable for the testing data
* x, y, and subject training and testing variables are merged into a single variable with rbind
* The activity variable (y) is transformed to a more descriptive format by using the activity descriptions contained in file activity_labels.txt
* Input variables (x's columns) are labeled descriptively by using the names contained in the features.txt file
* Only the mean and std measurements are kept. It has been decided that although the word mean appears in some variables, they are not the ones meant by the assignment. Those are the meanFreq variables and the angle variables. They have been removed by means of regular expressions
* In order to make variable names human readable, the following replacements have been carried out: "Acc" => "Accelerometer", "Gyro" => "Gyroscope", "Mag" => "Magnitude"
* The first tidy data set is constructed by combining the subject, input variables (x), and activity variable (y) with cbind. The result is stored in the "firsTidySet.txt" file
* A second tidy data set is created by averaging all variables for every subject and activity. ddply (from the plyr package) has been used with this purpose. The result is stored in the "secondTidySet.txt" file