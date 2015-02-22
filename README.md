1. Original data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  is downloaded and unzipped to the working directory.

The following files are used in the R code:
=========================================

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. 
- 'test/subject_test.txt' : 


2. In the R code, train and test data sets are merged to create one data set

3. In the code, gsub is used to extracts only the measurements on the mean and standard deviation for each measurement

4. Uses descriptive activity names to name the activities in the data set:
5. Appropriately labels the data set with descriptive activity names:
6. A tidy data set(newDataset) is created
7. Using the above tidy data set, a 2nd, independent tidy data set with the average of each variable for each activity and each subject is created (tidyDataAVGSet).


