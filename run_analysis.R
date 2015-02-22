## 1. Merges the training and the test sets to create one data set.

  x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
  X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
  y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
  y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
  subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
  features <- read.table("./UCI HAR Dataset/features.txt")
  activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Merge train and test data sets

  x <- rbind(x_train, X_test)
  y <- rbind(y_train, y_test)
  s <- rbind(subject_train, subject_test)
 
## 2. Extracts only the measurements on the mean and standard deviation for each measurement:
 
  names(features) <- c('feat_id', 'feat_name')
  
  index_features <- grep("-mean\\(\\)|-std\\(\\)", features$feat_name) 
  x <- x[, index_features]
  
# Replaces all matches of a string features 

  names(x) <- gsub("\\(|\\)", "", (features[index_features, 2]))

## 3. Uses descriptive activity names to name the activities in the data set:
## 4. Appropriately labels the data set with descriptive activity names:
  
# descriptive  names to activities column
  names(activities) <- c('act_id', 'act_name')
  y[, 1] = activities[y[, 1], 2]
  names(y) <- "Activity"
  names(s) <- "Subject"

# Combines data table by columns
  tidyDataSet <- cbind(s, y, x)

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject:

  newDataset <- tidyDataSet[, 3:dim(tidyDataSet)[2]] 
  tidyDataAVGSet <- aggregate(newDataset,list(tidyDataSet$Subject, tidyDataSet$Activity), mean)
  
# Activity and Subject name of columns 

  names(tidyDataAVGSet)[1] <- "Subject"
  names(tidyDataAVGSet)[2] <- "Activity" 
  
# Create file (tidy data set for avg) in diretory
  
  write.table(tidyDataAVGSet, file = "./tidy_data_file_AVG.txt",row.names = FALSE)
  
  



