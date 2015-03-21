library(data.table)

# set my workding directory to dataset
setwd("D:/UCI HAR Dataset")

#read activity label
activity.labels <- read.table("activity_labels.txt")
colnames(activity.labels) <- c("activityId", "label")

# read train data & test data
train.data <- read.table("train/X_train.txt",strip.white=TRUE)
train.data.label <- read.table("train/y_train.txt")
train.data.subject <- read.table("train/subject_train.txt")
train.data <- cbind(train.data, train.data.label, train.data.subject)

test.data <- read.table("test/X_test.txt", strip.white=TRUE)
test.data.label <- read.table("test/y_test.txt")
test.data.subject <- read.table("test/subject_test.txt")
test.data <- cbind(test.data, test.data.label, test.data.subject)

# read feature info
feature.info <- read.table("features.txt", strip.white=TRUE)
colnames(feature.info) <- c("colIdx", "colName")

## step 1: Merges the training and the test sets to create one data set
data.set <- rbind(train.data, test.data)

## step 4: Appropriately labels the data set with descriptive variable names. 
colnames(data.set) <- c(as.character(feature.info[,"colName"]),"activityId","subject")

## step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
feature.info <- as.data.table(feature.info)
colIdx <- feature.info[grepl("mean",feature.info$colName)|grepl("std",feature.info$colName)][,colIdx]
extracted.data <- data.set[,colIdx]

## step 3: Uses descriptive activity names to name the activities in the data set
merged.data <- merge(data.set, activity.labels, by="activityId")

## step 5: creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data.set.tidy <- aggregate(data.set, list(data.set$activityId, data.set$subject), mean)

