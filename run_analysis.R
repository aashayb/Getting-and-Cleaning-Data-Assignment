library(dplyr)

filename <- "UCI HAR Dataset"
## download the dataset:
if (file.exists(filename) == FALSE){
  url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(url, filename)
## unzip the file 
  unzip(filename) 
}

#load train daata
trainX <- (read.table("UCI HAR Dataset/train/X_train.txt"))
trainY <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSub <- read.table("UCI HAR Dataset/train/subject_train.txt")

##load test data
testX <- (read.table("UCI HAR Dataset/test/X_test.txt"))
testY <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSub <- read.table("UCI HAR Dataset/test/subject_test.txt")

##create the merged data set(1)
mergedX <- rbind(trainX, testX)
mergedY <- rbind(trainY, testY)
mergedSub <- rbind(trainSub, testSub)

##load the variable labels
activityLabels <- (read.table("UCI HAR Dataset/activity_labels.txt"))
features <- (read.table("UCI HAR Dataset/features.txt"))

## loading only the measurement sof the mean and the SD of each measurement
selectFeat <- features[grep(".*mean\\(|.*std\\(",as.character(features[,2])),]
mergedX <- mergedX[,selectFeat[,1]]

## Assigning appropritate names to mergedX and mergedY
names(mergedY) <- "Activity"
mergedY$activityLabel <- factor(mergedY$Activity, labels = as.character(activityLabels[,2]))
names(mergedX) <- features[selectFeat[,1],2]
names(mergedSub) <- "Subject"

##creating a tidy data
activity <- mergedY[,-1]
mergedYAll <- cbind(mergedX, activity, mergedSub)
mergedAllMean <- mergedYAll %>%
                    group_by(activity,Subject) %>%
                      summarise_each(funs(mean))
write.table(mergedAllMean, file = "UCI HAR Dataset/tidydata.txt", col.names = TRUE, row.names = FALSE)