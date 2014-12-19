##########################################################################
# Coursera MOOC: Getting and Cleaning Data Course
# Course Project.
# Due Dec 21, 2014.
# This "run_analysis.R" file aims to achieve the following tasks:
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
#    for each activity and each subject.
#
# The root directory is assumed to be ./UCI HAR Dataset1/ directory which should contain the following:
# /test/                --> directory containing the data downloaded from the course website.
# /train/               --> directory containing the data downloaded from the course website.
# run_analysis.R        --> R script to achieve the tasks listed above.
# README.md             --> Mark-up file describing the project and its steps
# CodeBook.md           --> Code book for the run_analysis.R script.
##########################################################################

# Step 0: Record date and R version:
setwd('C:\\Users\\zikribayraktar\\SkyDrive\\Documents\\MOOC\\Coursera_03_Getting_and_Cleaning_Data\\data\\UCI_HAR_Dataset1')
(ScriptRunDate <- date())
(ScriptRunRversion <- R.version)

#------------------------------------------------------------------
# Step 1.1: Read the local data from "train" and "test" folders:
X_train <- read.table("./train/X_train.txt", header=FALSE)
X_test <- read.table("./test/X_test.txt", header=FALSE)

#------------------------------------------------------------------
# Step 1.2: Merge the training (X_train) and the test (X_test) sets to create one data set.
# This creates a matrix of 10299 row by 561 columns data.frame:
X_comb <- rbind(X_train, X_test)

#------------------------------------------------------------------
# Step 1.3: Read the Subject Codes and Activity Codes:
subject_train <- read.table("./train/subject_train.txt", header=FALSE)
subject_test <- read.table("./test/subject_test.txt", header=FALSE)
subject_comb <- rbind(subject_train, subject_test)

y_train <- read.table("./train/y_train.txt", header=FALSE)
y_test <- read.table("./test/y_test.txt", header=FALSE)
y_comb <- rbind(y_train, y_test)

#------------------------------------------------------------------
# Step 1.4: Column bind the Subject Code and Activity Code to the Combined data set:
# This creates a matrix of 10299 row by 563 columns data.frame:
X_comb <- cbind(X_comb, subject_comb, y_comb)

#------------------------------------------------------------------
# Step 1.5: Read the Variable names as the header line and combine with the Subject Code and Activity Code labels:
features <- read.table("./features.txt", header=FALSE)
tfeatures <- t(features[,2])
tfeatDF <- data.frame(lapply(tfeatures, as.character), stringsAsFactors=FALSE)
tfeatDF <- data.frame(lapply(c(tfeatDF,"SubjectCode","ActivityCode"), as.character), stringsAsFactors=FALSE)

# Assign the column names to proper labels:
colnames(X_comb) <- tfeatDF

# Check that the X_comb combines all train/test data sets as well as the Subject codes and Activity Codes.
head(X_comb)


#------------------------------------------------------------------
# Step 2:  Strip the data to make the tidy data set by only subsetting 
# the mean and standard deviation columns from the combined data set:

# Figure out which columns have "mean" in their header labels:
mIdx <- grep("mean", names(X_comb))

# Figure out which columns have "std" in their header labels:
sIdx <- grep("std", names(X_comb))

# Combine indices for 'mean' and 'std' data columns, also add Subject Code and Activity Code columns:
combIdx <- c(mIdx, sIdx, 562, 563)

# Subset the data per the indices from above:
strippedData <- X_comb[combIdx]

# Sort the stripped data set to calculate the average of each variable for each activity and each subject.
a <- dim(strippedData)
end <- a[2]
SC <- end-1    # Subject Code
AC <- end      # Activity Code

# Order the stripped data to compute the averages
ordData <- strippedData[order(strippedData$SubjectCode, strippedData$ActivityCode),]

# Compute the averages per subject and per activity:  This is the tidy data file:
counter = 1
TidyData <-data.frame(matrix(ncol = end, nrow = 180))
for (i in 1:30) { 
  for (j in 1:6) {
    AveDataSet <- ordData[(ordData$SubjectCode==i & ordData$ActivityCode==j),]
    TidyData[counter,] = colMeans(AveDataSet)
    counter<-counter+1
  }
}

# Rename the header with proper names:
names(TidyData) <- names(ordData)

#------------------------------------------------------------------
# Also, make sure to replace the Activity Codes with descriptive labels:
strippedData[,end] <- ifelse(strippedData[,end]==1,"Walking",strippedData[,end])
strippedData[,end] <- ifelse(strippedData[,end]==2,"WalkingUP",strippedData[,end])
strippedData[,end] <- ifelse(strippedData[,end]==3,"WalkingDW",strippedData[,end])
strippedData[,end] <- ifelse(strippedData[,end]==4,"Sitting",strippedData[,end])
strippedData[,end] <- ifelse(strippedData[,end]==5,"Standing",strippedData[,end])
strippedData[,end] <- ifelse(strippedData[,end]==6,"Laying",strippedData[,end])

# Write out "Stripped Data" into a file:
write.table(strippedData, "DataFileStripped.txt", row.name=FALSE) 

#------------------------------------------------------------------
TidyData[,end] <- ifelse(TidyData[,end]==1,"Walking",TidyData[,end])
TidyData[,end] <- ifelse(TidyData[,end]==2,"WalkingUP",TidyData[,end])
TidyData[,end] <- ifelse(TidyData[,end]==3,"WalkingDW",TidyData[,end])
TidyData[,end] <- ifelse(TidyData[,end]==4,"Sitting",TidyData[,end])
TidyData[,end] <- ifelse(TidyData[,end]==5,"Standing",TidyData[,end])
TidyData[,end] <- ifelse(TidyData[,end]==6,"Laying",TidyData[,end])

# Write out "Tidy Data" into a file:
write.table(TidyData, "DataFileTidy.txt", row.name=FALSE) 

#------------------------------------------------------------------
# end-of-file
