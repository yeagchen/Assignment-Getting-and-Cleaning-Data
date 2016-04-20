## Variables and data in the data set

This data set includes the average of the mean and standard deviation of each signal (see feature_info.txt) for each activity and each subject.

The detailed list of all variables are shown below:

subject: subject, including 1-30
activity: activity, including "walking"", "walking_upstairs", "walking_downstairs", "sitting", "standing" and "laying"
tbodyaccxmean: average of tBodyAcc-mean()-X   (unit: 'g')
tbodyaccymean: average of tBodyAcc-mean()-Y   (unit: 'g')
tbodyacczmean: average of tBodyAcc-mean()-Z   (unit: 'g')
tbodyaccxstd: average of tBodyAcc-std()-X   (unit: 'g')
tbodyaccystd: average of tBodyAcc-std()-Y   (unit: 'g')
tbodyacczstd: average of tBodyAcc-std()-Z   (unit: 'g')
tgravityaccxmean: average of tGravityAcc-mean()-X   (unit: 'g')
tgravityaccymean: average of tGravityAcc-mean()-Y   (unit: 'g')
tgravityacczmean: average of tGravityAcc-mean()-Z   (unit: 'g')
tgravityaccxstd: average of tGravityAcc-std()-X   (unit: 'g')
tgravityaccystd: average of tGravityAcc-std()-Y   (unit: 'g')
tgravityacczstd: average of tGravityAcc-std()-Z   (unit: 'g')
tbodyaccjerkxmean: average of tBodyAccJerk-mean()-X   (unit: 'g')
tbodyaccjerkymean: average of tBodyAccJerk-mean()-Y   (unit: 'g')
tbodyaccjerkzmean: average of tBodyAccJerk-mean()-Z   (unit: 'g')
tbodyaccjerkxstd: average of tBodyAccJerk-std()-X   (unit: 'g')
tbodyaccjerkystd: average of tBodyAccJerk-std()-Y   (unit: 'g')
tbodyaccjerkzstd: average of tBodyAccJerk-std()-Z   (unit: 'g')
tbodygyroxmean: average of tBodyGyro-mean()-X   (unit: radians/second)
tbodygyroymean: average of tBodyGyro-mean()-Y   (unit: radians/second)
tbodygyrozmean: average of tBodyGyro-mean()-Z   (unit: radians/second)
tbodygyroxstd: average of tBodyGyro-std()-X   (unit: radians/second)
tbodygyroystd: average of tBodyGyro-std()-Y   (unit: radians/second)
tbodygyrozstd: average of tBodyGyro-std()-Z   (unit: radians/second)
tbodygyrojerkxmean: average of tBodyGyroJerk-mean()-X   (unit: radians/second)
tbodygyrojerkymean: average of tBodyGyroJerk-mean()-Y   (unit: radians/second)
tbodygyrojerkzmean: average of tBodyGyroJerk-mean()-Z   (unit: radians/second)
tbodygyrojerkxstd: average of tBodyGyroJerk-std()-X   (unit: radians/second)
tbodygyrojerkystd: average of tBodyGyroJerk-std()-Y   (unit: radians/second)
tbodygyrojerkzstd: average of tBodyGyroJerk-std()-Z   (unit: radians/second)
tbodyaccmagmean: average of tBodyAccMag-mean()
tbodyaccmagstd: average of tBodyAccMag-std()
tgravityaccmagmean: average of tGravityAccMag-mean()
tgravityaccmagstd: average of tGravityAccMag-std()
tbodyaccjerkmagmean: average of tBodyAccJerkMag-mean()
tbodyaccjerkmagstd: average of tBodyAccJerkMag-std()
tbodygyromagmean: average of tBodyGyroMag-mean()
tbodygyromagstd: average of tBodyGyroMag-std()
tbodygyrojerkmagmean: average of tBodyGyroJerkMag-mean()
tbodygyrojerkmagstd: average of tBodyGyroJerkMag-std()
fbodyaccxmean: average of fBodyAcc-mean()-X
fbodyaccymean: average of fBodyAcc-mean()-Y
fbodyacczmean: average of fBodyAcc-mean()-Z
fbodyaccxstd: average of fBodyAcc-std()-X
fbodyaccystd: average of fBodyAcc-std()-Y
fbodyacczstd: average of fBodyAcc-std()-Z
fbodyaccjerkxmean: average of fBodyAccJerk-mean()-X
fbodyaccjerkymean: average of fBodyAccJerk-mean()-Y
fbodyaccjerkzmean: average of fBodyAccJerk-mean()-Z
fbodyaccjerkxstd: average of fBodyAccJerk-std()-X
fbodyaccjerkystd: average of fBodyAccJerk-std()-Y
fbodyaccjerkzstd: average of fBodyAccJerk-std()-Z
fbodygyroxmean: average of fBodyGyro-mean()-X
fbodygyroymean: average of fBodyGyro-mean()-Y
fbodygyrozmean: average of fBodyGyro-mean()-Z
fbodygyroxstd: average of fBodyGyro-std()-X
fbodygyroystd: average of fBodyGyro-std()-Y
fbodygyrozstd: average of fBodyGyro-std()-Z
fbodyaccmagmean: average of fBodyAccMag-mean()
fbodyaccmagstd: average of fBodyAccMag-std()
fbodybodyaccjerkmagmean: average of fBodyBodyAccJerkMag-mean()
fbodybodyaccjerkmagstd: average of fBodyBodyAccJerkMag-std()
fbodybodygyromagmean: average of fBodyBodyGyroMag-mean()
fbodybodygyromagstd: average of fBodyBodyGyroMag-std()
fbodybodygyrojerkmagmean: average of fBodyBodyGyroJerkMag-mean()
fbodybodygyrojerkmagstd: average of fBodyBodyGyroJerkMag-std()

## Transformations or work performed to clean up the data

The following transformations and work were performed to obtain the above data set:

* All train and test data sets were merged respectively, that is, subject_train and subject_test were merged to subject_all, X_train and X_test were merged to X_all, and y_train and y_test were merged to y_all.
* The mean and standard deviation for all measurements (variables with -mean() and -std()) were extracted from X_all, and formed a new data set called X_select.
* Replaced activity labels to descriptive activity names in y_all.
* Provided descriptive variable names for X_select.
* Merged subject_all, y_all and X_select into a new data set, called record. This data set is a tidy data set ready for analysis.
* Grouped record by subject and activity.
* Summarized record by averaging all variables in record for each activity and subject, and created a new tidy data set called record_average.