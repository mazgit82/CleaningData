# Load x, y, and subject training data
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/Y_train.txt")

# Load x, y, and subject testing data
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
yTest <- read.table("UCI HAR Dataset/test/Y_test.txt")

# Merge training and test sets
x <- rbind(xTrain,xTest)
subject <- rbind(subjectTrain, subjectTest)
y <- rbind(yTrain, yTest)

# Use descriptive activity names to name the activities in the data set
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
y <- activities$V2[y[[1]]]

# Appropriately labels the data set with descriptive variable names. 
features <- read.table("UCI HAR Dataset/features.txt",
                       stringsAsFactors=FALSE)[[2]]

# Extracts only the measurements on the mean and standard deviation for each measurement. 

selected <- grepl("mean|std", features, ignore.case=TRUE)
deselect <- grepl("Freq", features, ignore.case=TRUE)
deselect <- deselect | grepl("angle", features, ignore.case=TRUE)
selected <- selected & !deselect

x <- x[, which(selected)]
  
featuresSelected <- gsub("[(][])]", "",  features[selected])

# Appropriately labels the data set with descriptive variable names. 
names(x) <- featuresSelected

# Create first tidy data set
data <- cbind(subject = subject[[1]], x,activity=y)

write.table(data, "firstTidySet.txt")
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
library(plyr)
dataMeans <- ddply(data, .(subject, activity), 
                   function(df) colMeans(subset(df, select=c(-subject,-activity))))

write.table(dataMeans, "secondTidySet.txt")
