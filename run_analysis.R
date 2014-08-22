library("data.table")
library("reshape")
library("plyr")

#read meta data
features<-read.table("Documents/UCI HAR Dataset/features.txt", header=FALSE)
labels<-read.table("Documents/UCI HAR Dataset/activity_labels.txt", header=FALSE)

#read test data
subjectTest <- read.table("Documents/UCI HAR Dataset/test/subject_test.txt", header=FALSE)
xTest <- read.table("Documents/UCI HAR Dataset/test/x_test.txt", header=FALSE)
yTest <- read.table("Documents/UCI HAR Dataset/test/y_test.txt", header=FALSE)

colnames(labels)  = c('Activity','Labels');
colnames(subjectTest)  = "Subject";
colnames(xTest)        = features[,2]; 
colnames(yTest)        = "Activity";

test <- cbind(yTest, subjectTest, xTest)


#read training data
subjectTrain <- read.table("Documents/UCI HAR Dataset/train/subject_train.txt", header=FALSE)
xTrain <- read.table("Documents/UCI HAR Dataset/train/x_train.txt", header=FALSE)
yTrain <- read.table("Documents/UCI HAR Dataset/train/y_train.txt", header=FALSE)

colnames(subjectTrain)  = "Subject";
colnames(xTrain)        = features[,2]; 
colnames(yTrain)        = "Activity";

train <- cbind(yTrain, subjectTrain, xTrain)

#Merges the training and the test sets to create one data set.
tmp <- rbind(test, train)
names(tmp)[1:2]<-c("Activity", "Subject")

#Extracts only the measurements on the mean and standard deviation for each measurement. 
select <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]


tidyData <- tmp[names(tmp) %in% select | names(tmp) %in% c("Activity", "Subject")]

#writing data
write.table(tidyData, file="./tidyData.txt", row.names=FALSE)

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
tidyDataMean <- ddply(melt(tidyData, id.vars=c("Subject", "Activity")), .(Subject, Activity), summarise, MeanSamples=mean(value))

write.table(tidyDataMean, file="./tidyAvgData.txt", row.names=FALSE)