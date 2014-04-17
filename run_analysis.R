rm(list = ls())


## 1.Read the numbers and names of feathers corresponding to the mean and 
##   the standard deviation.
featuresAll <- read.table("./UCI HAR Dataset/features.txt")
names(featuresAll) <- c("featureNumber","featureName")
features <- subset(featuresAll, grepl("mean()",featuresAll$featureName) | 
                     grepl("std()",featuresAll$featureName))


##2.Read train and test data and merge them into one data set.
dataTrainX <- read.table("./UCI HAR Dataset/train/X_train.txt")
names(dataTrainX) <- featuresAll$featureName

dataTrainY <- read.table("./UCI HAR Dataset/train/y_train.txt")
names(dataTrainY) <- "activity"
dataTrainSubjectID <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(dataTrainSubjectID) <- "subjectID"
dataTrain <- data.frame(dataTrainX, dataTrainY, dataTrainSubjectID)

dataTestX <- read.table("./UCI HAR Dataset/test/X_test.txt")
names(dataTestX) <- featuresAll$featureName
dataTestY <- read.table("./UCI HAR Dataset/test/y_test.txt")
names(dataTestY) <- "activity"
dataTestSubjectID <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(dataTestSubjectID) <- "subjectID"
dataTest <- data.frame(dataTestX, dataTestY, dataTestSubjectID)

dataAll <- rbind(dataTrain, dataTest)

##3. Extract the features related to the means and standard deviation 
##   of the varibles

data <- dataAll[,c(features$featureNumber, ncol(dataAll), ncol(dataAll)-1)]

##4. Replace the activity codes with the activity names. 
##   The corressponding relationsship is read from activity_labels.txt.

activityLabel <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activityLabel) <- c("activityCode", "activityName")
activityLabel$activityCode <- as.character(activityLabel$activityCode)
activityLabel$activityName <- as.character(activityLabel$activityName)
data$activity <- as.character(data$activity)
activityNames <- data$activity
for (i in 1:nrow(activityLabel)){
  activityNames <- gsub(activityLabel$activityCode[i], activityLabel$activityName[i], activityNames)
}