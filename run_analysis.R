## This R script analyzes the UCI HAR Dataset, including the following actions:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for 
##    each measurement.
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject, and
##    then writes this data set to a .txt file.

library(dplyr)
    
## Read train data (subject, X and y) into R
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
    
## Read test data (subject, X and y) into R
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
    
## Convert all data sets to tbl data frame
subject_train <- tbl_df(subject_train)
X_train <- tbl_df(X_train)
y_train <- tbl_df(y_train)
subject_test <- tbl_df(subject_test)
X_test <- tbl_df(X_test)
y_test <- tbl_df(y_test)
    
## Merge train and test data sets (for subject, X and y)
subject_all <- bind_rows(subject_train, subject_test)
X_all <- bind_rows(X_train, X_test)
y_all <- bind_rows(y_train, y_test)
    
## Extract the mean and standard deviation for each measurement 
X_select <- select(X_all, V1:V6, V41:V46, V81:V86, V121:V126, V161:V166,
                   V201:V202, V214:V215, V227:V228, V240:V241, V253:V254, 
                   V266:V271, V345:V350, V424:V429, V503:V504, V516:V517, 
                   V529:V530, V542:V543)
    
## Use activity names to name the activities in the data set y_all
y_all$V1 <- as.character(y_all$V1)
    
for(i in seq_along(y_all$V1)) {
    if(y_all$V1[i] == "1") {
        y_all$V1[i] <- "walking"
    } else if(y_all$V1[i] == "2") {
        y_all$V1[i] <- "walking_upstairs"
    } else if(y_all$V1[i] == "3") {
        y_all$V1[i] <- "walking_downstairs"
    } else if(y_all$V1[i] == "4") {
        y_all$V1[i] <- "sitting"
    } else if(y_all$V1[i] == "5") {
        y_all$V1[i] <- "standing"
    } else {
        y_all$V1[i] <- "laying"
    }
}
    
y_all$V1 <- as.factor(y_all$V1)
    
## Label data sets subject_all, y_all and X_select with descriptive variable names
colnames(subject_all) <- c("subject")
colnames(y_all) <- c("activity")
colnames(X_select) <- c("tbodyaccxmean", "tbodyaccymean", "tbodyacczmean", 
                        "tbodyaccxstd", "tbodyaccystd", "tbodyacczstd", 
                        "tgravityaccxmean", "tgravityaccymean", "tgravityacczmean", 
                        "tgravityaccxstd", "tgravityaccystd", "tgravityacczstd", 
                        "tbodyaccjerkxmean", "tbodyaccjerkymean", "tbodyaccjerkzmean",
                        "tbodyaccjerkxstd", "tbodyaccjerkystd", "tbodyaccjerkzstd",
                        "tbodygyroxmean", "tbodygyroymean", "tbodygyrozmean",
                        "tbodygyroxstd", "tbodygyroystd", "tbodygyrozstd",
                        "tbodygyrojerkxmean", "tbodygyrojerkymean", "tbodygyrojerkzmean", 
                        "tbodygyrojerkxstd", "tbodygyrojerkystd", "tbodygyrojerkzstd",
                        "tbodyaccmagmean", "tbodyaccmagstd", "tgravityaccmagmean",
                        "tgravityaccmagstd", "tbodyaccjerkmagmean", "tbodyaccjerkmagstd",
                        "tbodygyromagmean", "tbodygyromagstd", "tbodygyrojerkmagmean",
                        "tbodygyrojerkmagstd", "fbodyaccxmean", "fbodyaccymean",
                        "fbodyacczmean", "fbodyaccxstd", "fbodyaccystd",
                        "fbodyacczstd", "fbodyaccjerkxmean", "fbodyaccjerkymean",
                        "fbodyaccjerkzmean", "fbodyaccjerkxstd", "fbodyaccjerkystd",
                        "fbodyaccjerkzstd", "fbodygyroxmean", "fbodygyroymean",
                        "fbodygyrozmean", "fbodygyroxstd", "fbodygyroystd",
                        "fbodygyrozstd", "fbodyaccmagmean", "fbodyaccmagstd", 
                        "fbodybodyaccjerkmagmean", "fbodybodyaccjerkmagstd", 
                        "fbodybodygyromagmean", "fbodybodygyromagstd",
                        "fbodybodygyrojerkmagmean", "fbodybodygyrojerkmagstd")
    
## Combine subject_all, X_all and y_all to a large data set record
record <- bind_cols(subject_all, y_all, X_select)
record <- arrange(record, subject, activity)
#print(record)
    
## Create a data set with the average of each variable for each activity and each subject
record_avg <- record %>% group_by(subject, activity) %>% summarize_each(funs(mean))
#print(record_avg)
    
## Write data sets to .txt files
write.table(record, file = "./UCI HAR Dataset/record.txt", row.names = FALSE)
write.table(record_avg, file = "./UCI HAR Dataset/record_average.txt", row.names = FALSE)