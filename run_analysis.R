# Step 1: Download data files using following information
# --------------------------------------------------------------------------------------------------
# Location 	: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Local Folder: UCI HAR Dataset

# Step 2: Load files to R Studio
# ----------------------------------
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Step 3: Assign column names for the tables
# ------------------------------------------
colnames(xtrain) <- features[,2]
colnames(xtest) <- features[,2]

colnames(ytrain) <- 'ActivityID'
colnames(ytest) <- 'ActivityID'

colnames(subject_train) <- 'SubjectID'
colnames(subject_test) <- 'SubjectID'

# Step 4: Assignment 1 
# Merges the training and the test sets to create one data set
# -----------------------------------------------------------------------------------
merged_data <- rbind(cbind(xtrain,ytrain,subject_train), cbind(xtest,ytest,subject_test))

# Step 5: Assignment 2 
# Extracts only the measurements on the mean and standard deviation for each measurement.
# a) Extract all the columns save to a vector (AllColumns)
# b) Create a subset vector of mean and standard column (MeanStdColumns)
# c) Create a subset of data for the MeanStdColumns (MeanStdSubset)
# ---------------------------------------------------------------------
AllColumns <- colnames(merged_data)
MeanStdColumns <- grepl("mean..|std..|ActivityID|SubjectID", AllColumns)
MeanStdSubset <- merged_data[, MeanStdColumns == TRUE]

# Step 6: Assignment 3
# Uses descriptive activity names to name the activities in the data set
# -------------------------------------------------------------------------
colnames(activity_labels) <- c('ActivityID','ActivityType')
ActivitiesDataSet <- merge (MeanStdSubset, activity_labels, by = 'ActivityID', all.x = TRUE)

# Step 7: Assignment 4
# Appropriately labels the data set with descriptive variable names.
# Already done at Step 3 and Step 6 naming all the data sets.
# -------------------------------------------------------------------

# Step 8: Assignment 5
# From the data set in step 4 (assignment 4), creates a second, independent 
# tidy data set with the average of each variable for each activity and 
# each subject.
# ----------------------------------------------------------------------------
TidyDataSet <- aggregate(. ~SubjectID + ActivityID, ActivitiesDataSet, mean)
TidyDataSet <- TidyDataSet[order(TidyDataSet$SubjectID, TidyDataSet$ActivityID),]
write.table(TidyDataSet, ".\\UCI HAR Dataset\\TidyDataSet.txt", row.name=FALSE)

# Step 9: End
# --------------------------------------------------------------------------------
