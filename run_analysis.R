# ** Getting and Cleaning data Project **
# [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
#
# http:\archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#     
# Source of data: https:\d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 

library(plyr)

# 0.- Download dile and unzip it on working directory

if(!file.exists("data/UCI HAR Dataset")) {
    if(!file.exists("./data")){dir.create("./data")}
    fileUrl <- "https:\d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile="./data/UCI HAR Dataset.zip",method="curl")
    unzip("data/UCI HAR Dataset.zip")
}

# 1.- Merge the training and the test sets to create one data set.

# Read labels
features <-read.table("data/UCI HAR Dataset/features.txt")$V2
activity_labels <- read.table("data/UCI HAR Dataset/activity_labels.txt")$V2

# Remove special characters
# http:\stackoverflow.com/questions/10294284/remove-all-special-characters-from-a-string-in-r
features <- gsub("[[:punct:]]","_", features)

# Read test files
subject_test  <- read.table("data/UCI HAR Dataset/test/subject_test.txt")$V1
y_test <- read.table("data/UCI HAR Dataset/test/y_test.txt")$V1
X_test <- read.table("data/UCI HAR Dataset/test/X_test.txt")

# Read train file
subject_train  <- read.table("data/UCI HAR Dataset/train/subject_train.txt")$V1
y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt")$V1
X_train <- read.table("data/UCI HAR Dataset/train/X_train.txt")

# Shape test data
test_data <- X_test
test_data$subject <- subject_test
test_data$y <- y_test
test_data$set <- "test"

# Shape train data
train_data <- X_train
train_data$subject <- subject_train
train_data$y <- y_train
train_data$set <- "train"

# Merge data (1)

data <- rbind(test_data, train_data)
data$subject <- as.factor(data$subject)
data$set <- as.factor(data$set)

# Now data is a tidy data set!!

# 2.- Extracts only the measurements on the mean and standard deviation for each measurement.

# Measurements on means and standard deviations (2)
## Select columns with "mean" and "sd" values

mean_sd_col <- sort(c(grep("_mean__", features, fixed = TRUE),
                      grep("_std__", features, fixed = TRUE)))

data.mean_sd <- data[, mean_sd_col]

# 3.- Use descriptive activity names to name the activities in the data set
## get this values from activity_labels, assign values accordingly

data$activity <- as.factor(mapvalues(data$y,
                                     from = 1:6, 
                                     to = as.character(activity_labels)))

# 4.- Appropriately labels the data set with descriptive variable names.
## Assign from features to the first 561 columns

names(data)[1:561] <- features

# 5.- Create a second, independent tidy data set with the average of each variable for each activity and each subject.

data.avg_actv_subj <- ddply(data,
                            .(subject, activity),
                            numcolwise(mean))

write.table(data.avg_actv_subj, "data.avg_actv_subj.txt", row.names=FALSE)
