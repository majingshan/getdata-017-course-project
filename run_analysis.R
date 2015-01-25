## load activity labels
loadActivities <- function(file, labels) {
    activities <- read.table(file)
    activities$V1 <- as.factor(activities$V1)
    levels(activities$V1) <- levels(labels)
    activities$V1
}

## load a dataset
loadDataSet <- function(labelFile, subjectFile, dataFile, features, activityLabels, filter) {
    # load activity labels
    activity <- loadActivities(labelFile, activityLabels)
    # load subjects
    subject <- read.table(subjectFile)$V1
    # load data
    data <- read.table(dataFile, col.names = features)
    # bind activity labels
    data <- cbind(activity, subject, data)
    # return filtered data, filter shift 2 to the right because I added activity and subject column to the left
    data[, c(1, 2, filter + 2)]
}

## main function
analyse <- function() {
    # load features
    features <- read.table("features.txt", colClasses=c("integer", "character"))
    # generate filter for mean and std variables
    filter <- subset(features, grepl("mean\\(\\)|std\\(\\)", V2))$V1
    
    # load activity labels
    activityLabels <- read.table("activity_labels.txt", col.names = c("index", "labels"))
    
    # load test dataset
    testDataSet <- loadDataSet("test/y_test.txt", "test/subject_test.txt", "test/X_test.txt", features$V2, activityLabels$labels, filter)
    
    # load train dataset
    trainDataSet <- loadDataSet("train/y_train.txt", "train/subject_train.txt", "train/X_train.txt", features$V2, activityLabels$labels, filter)
    
    # combine test data and train data
    dataset <- rbind(testDataSet, trainDataSet)
    
    # split dataset by activity and subject
    splitDataset <- split(dataset[,3:length(dataset)], list(dataset$activity, dataset$subject))
    
    # 1.calculate mean for each variable
    # 2.transform to data frame
    # 3.transpose
    # 4.transform to data frame again
    data.frame(t(data.frame(lapply(splitedData, colMeans))))
}
