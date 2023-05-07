# Download and unzip data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename <- "UCI HAR Dataset.zip"
if (!file.exists(filename)) {
  download.file(url, filename)
}
unzip(filename)

# Load data for train
train_x <- read.table("UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")


# Load data for test
test_x <- read.table("UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merge data for value
value <- rbind(train_x, test_x)

#Merge data for Activity
activity <- rbind(train_y, test_y)

#Merge data for subject
subject <- rbind(train_subject, test_subject)

#Set column names
colnames(activity) <- "activity"
colnames(subject) <- "subject"

#Combine datasets
dataset <- cbind(value, activity, subject)


#Load features data
features <- read.table("UCI HAR Dataset/features.txt")

# Extract mean and std measurements
mean_std_features <- grep("mean\\(\\)|std\\(\\)", features$V2)
mean_std_features_wlabel <-features[mean_std_features,]

#Modify V1 column value to format Vxx
mean_std_features_wlabel$V1<-paste0('V',mean_std_features_wlabel$V1)

#Filter dataset for only mean and std dev variables along with activity & subject
data_filtered <- dataset[, c(mean_std_features_wlabel$V1,"activity","subject")]

#Name the variables with names from the features files
names(data_filtered)<- c(mean_std_features_wlabel$V2,"activity","subject")

# Add activity labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
data_filtered$activity <- factor(data_filtered$activity, levels = activity_labels[,1], labels = activity_labels[,2])

# Label variables
names(data_filtered) <- gsub("^t", "time", names(data_filtered))
names(data_filtered) <- gsub("^f", "frequency", names(data_filtered))
names(data_filtered) <- gsub("Acc", "accelerometer", names(data_filtered))
names(data_filtered) <- gsub("Gyro", "gyroscope", names(data_filtered))
names(data_filtered) <- gsub("Mag", "magnitude", names(data_filtered))
names(data_filtered) <- gsub("Body", "body", names(data_filtered))
names(data_filtered) <- tolower(names(data_filtered))

# Create tidy data set
tidy_data <- aggregate(. ~ subject + activity, data_filtered, mean)
tidy_data <- tidy_data[order(tidy_data$subject, tidy_data$activity),]

