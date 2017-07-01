# Setting the working directory
setwd("F:/R_working_dir")

# If the dplyr package is not yet installed, call install.packages
# If installed, load the package into R
if("dplyr" %in% rownames(installed.packages()) == FALSE) {
  install.packages("dplyr")
} 
library(dplyr)

# Load all necessary datasets into R prior to merging and tidying
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# In the X_train/X_test datasets, rename the variables based on the contents of 
# V2 in the features data frame, so that we can have more meaningful variable names
# Additionally, add new variables to X_train and X_test for the subject and 
# activity labels from the subject_train/subject_test and y_test/y_train datasets
names(X_train) <- features$V2
X_train$subject <- subject_train$V1
X_train$labels <- y_train$V1
names(X_test) <- features$V2
X_test$subject <- subject_test$V1
X_test$labels <- y_test$V1

# Call rbind to combine the X_train and X_test datasets on the rows
Combo <- rbind.data.frame(X_train, X_test)

# After combining, use modify the combined dataset to include only those columns 
# ending with 'mean()' or 'std()' (as well as the subject and label columns)
Combo <- Combo[, grep("[Mm][Ee][Aa][Nn]\\(\\)$|[Ss][Tt][Dd]\\(\\)$|subject|label", names(Combo))]

# Provide activity descriptions from the activity_labels dataset, merging based on the 
# 'labels' column in the combined dataset, with the 'V1' column from the activity_labels
# dataset. Then, rename the newly added column 'V2' to be the clearer name 'activity'
merged <- merge(Combo, activity_labels, by.x = "labels", by.y="V1", all = TRUE)
merged <- rename(merged, activity = V2)

# As the 'labels' column is no longer necessary and less descriptive that the 
# 'activity' variable contents, call grep to remove the 'label' column

merged <- merged[, grep("[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]|subject|activity", names(merged))]

# Manipulate the merged dataset to calculate the average for each variable, based on subject and activity
average <- group_by(merged, subject, activity)
average <- summarize(average, `tBodyAccMag-mean()` = mean(`tBodyAccMag-mean()`),
                     `tBodyAccMag-std()` = mean(`tBodyAccMag-std()`),
                     `tGravityAccMag-mean()` = mean(`tGravityAccMag-mean()`),
                     `tGravityAccMag-std()` = mean(`tGravityAccMag-std()`),
                     `tBodyAccJerkMag-mean()` = mean(`tBodyAccJerkMag-mean()`),
                     `tBodyAccJerkMag-std()` = mean(`tBodyAccJerkMag-std()`),
                     `tBodyGyroMag-mean()` = mean(`tBodyGyroMag-mean()`),
                     `tBodyGyroMag-std()` = mean(`tBodyGyroMag-std()`),
                     `tBodyGyroJerkMag-mean()` = mean(`tBodyGyroJerkMag-mean()`),
                     `tBodyGyroJerkMag-std()` = mean(`tBodyGyroJerkMag-std()`),
                     `fBodyAccMag-mean()` = mean(`fBodyAccMag-mean()`),
                     `fBodyAccMag-std()` = mean(`fBodyAccMag-std()`),
                     `fBodyBodyAccJerkMag-mean()` = mean(`fBodyBodyAccJerkMag-mean()`),
                     `fBodyBodyAccJerkMag-std()` = mean(`fBodyBodyAccJerkMag-std()`),
                     `fBodyBodyGyroMag-mean()` = mean(`fBodyBodyGyroMag-mean()`),
                     `fBodyBodyGyroMag-std()` = mean(`fBodyBodyGyroMag-std()`),
                     `fBodyBodyGyroJerkMag-mean()` = mean(`fBodyBodyGyroJerkMag-mean()`),
                     `fBodyBodyGyroJerkMag-std()` = mean(`fBodyBodyGyroJerkMag-std()`)
)

# Display the output of the newly created summary data
print(average)
