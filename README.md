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
#
# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
# The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers 
# on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data 
# set as described below, 2) a link to a Github repository with your script for performing the analysis, 
# and 3) a code book that describes the variables, the data, and any transformations or work that you 
# performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with 
# your scripts. This repo explains how all of the scripts work and how they are connected.  
#
# One of the most exciting areas in all of data science right now is wearable computing - see for example 
# this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced 
# algorithms to attract new users. The data linked to from the course website represent data collected 
# from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the 
# site where the data was obtained: 
#
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
#
# Here are the data for the project: 
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
##########################################################################

# The run_analysis.R script is already commented step by step instructions on what the code does at each step:

# Step 0: Record date and R version:

#------------------------------------------------------------------
# Step 1.1: Read the local data from "train" and "test" folders:

#------------------------------------------------------------------
# Step 1.2: Merge the training (X_train) and the test (X_test) sets to create one data set.
# This creates a matrix of 10299 row by 561 columns data.frame:

#------------------------------------------------------------------
# Step 1.3: Read the Subject Codes and Activity Codes:

#------------------------------------------------------------------
# Step 1.4: Column bind the Subject Code and Activity Code to the Combined data set:
# This creates a matrix of 10299 row by 563 columns data.frame:

#------------------------------------------------------------------
# Step 1.5: Read the Variable names as the header line and combine with the Subject Code and Activity Code labels:

# Assign the column names to proper labels:

# Check that the X_comb combines all train/test data sets as well as the Subject codes and Activity Codes.

#------------------------------------------------------------------
# Step 2:  Strip the data to make the tidy data set by only subsetting 
# the mean and standard deviation columns from the combined data set:

# Figure out which columns have "mean" in their header labels:

# Figure out which columns have "std" in their header labels:

# Combine indices for 'mean' and 'std' data columns, also add Subject Code and Activity Code columns:

# Subset the data per the indices from above:

# Sort the stripped data set to calculate the average of each variable for each activity and each subject.

# Order the stripped data to compute the averages

# Compute the averages per subject and per activity:  This is the tidy data file:

# Rename the header with proper names:

#------------------------------------------------------------------
# Also, make sure to replace the Activity Codes with descriptive labels:

# Write out "Stripped Data" into a file:

#------------------------------------------------------------------
# Write out "Tidy Data" into a file:

#------------------------------------------------------------------
# end-of-file