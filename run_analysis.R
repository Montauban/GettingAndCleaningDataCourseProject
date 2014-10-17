## My Working Directory is below as an example
## Any other person using this script will need to specify their own working directory
## in order to run this script
## setwd("/Users/petersali/Data\ Science/John\ Hopkins/Workspace")

## dplyr for group_by() and summarise_each() 
library(dplyr)

####### META DATA ############

## Load FEATURES data
features <- read.table('./meta data/features.txt')

## Create the feature (column) names
features_names <- features$V2

########## TRAIN DATA #############

## SLoad SUBJECT_TRAIN data
subject_train  <- read.table('./train/subject_train.txt')

## Load TRAINING_LABELS
## 1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING
training_labels <- read.table('./train/y_train.txt')

## Load TRAINING_SET
training_set <- read.table('./train/X_train.txt')

######### TEST DATA ##############

## Load SUBJECT_TEST
subject_test  <- read.table('./test/subject_test.txt')

## Load TEST_SET
test_set <- read.table('./test/X_test.txt')

## Load TEST_LABELS
test_labels <- read.table('./test/y_test.txt')

######### CLEAN THE COLUMNS ############

## Name the columns
columns <- c("Subject", "Activity", as.character(features_names))

## Clean the column names (There may be a more elegant way to this but
## this is my brute force solution)
clean_column <- gsub("\\()", "", columns)
clean_column <- gsub("\\(", "", clean_column)
clean_column <- gsub("\\)", "", clean_column)
clean_column <- gsub("-", "", clean_column)
clean_column <- gsub(",", "", clean_column)
clean_column <- gsub("yBody", "y", clean_column)
clean_column <- gsub("tBody", "Time", clean_column)
clean_column <- gsub("acc", "Accelerometer", clean_column)
clean_column <- gsub("jerk", "Jerk", clean_column)
clean_column <- gsub("std", "StandardDeviation", clean_column)
clean_column <- gsub("mean", "Mean", clean_column)
clean_column <- gsub("^f", "Frequency", clean_column)
clean_column <- gsub("^t", "Time", clean_column)
clean_column <- gsub("angle", "Angle", clean_column)
clean_column <- gsub("gravity", "Gravity", clean_column)

##### CREATE DATA FRAMES AND COMBINE THE DATA ########

## create TRAIN data frame 
train_df <- data.frame(subject_train, training_labels, training_set)
## Add column names to train_df (REQUIREMENT 4)
colnames(train_df) <- clean_column

## create TEST data frame 
test_df <- data.frame(subject_test, test_labels, test_set)
## Add columns to test_df (REQUIREMENT 4)
colnames(test_df) <- clean_column

## REQUIREMENT 1: Combine/Merge the data
combined_df <- rbind(train_df, test_df)

###### CLARIFY AND CLEAN THE DATA ########

## Order the data - for clarity (I'm not sure this is necessary)
combined_df_ordered <- combined_df[order(combined_df[[1]], combined_df[[2]]), ]
 
## Convert activity integers to characters for the switch() function to work
combined_df_ordered$Activity <- as.character(combined_df_ordered$Activity)

## Assign descriptive strings to activities  
## REQUIREMENT 3: Use switch() to replace Acitivity characters (numbers) with descriptive strings
combined_df_ordered$Activity <- sapply(combined_df_ordered$Activity,switch,"1"="WALKING", "2"="WALKING_UPSTAIRS", 
	"3"="WALKING_DOWNSTAIRS", "4"="SITTING", "5"="STANDING", "6"="LAYING",'undefined'="")

## Filter only STD and MEAN from the columns vector
std <- grep("StandardDeviation", clean_column)
mean <- grep("Mean", clean_column)
## Combine std and mean integers
std_mean <- c(std, mean)

## Keep the Subject and Acitvity columns
std_mean <- c(std_mean, 1, 2)

## Order the columns to keep
std_mean <- std_mean[order(std_mean)]

## REQUIREMENT 2: Subset only the columns with std or mean
std_mean_df <- combined_df_ordered[, std_mean]

####### CREATE THE 2 DATA SETS #########

## Clean up the Subject and Activity data types
std_mean_df$Subject <- as.factor(std_mean_df$Subject)
Subject <- std_mean_df$Subject
std_mean_df$Activity <- as.character(std_mean_df$Activity)
Activity <- std_mean_df$Activity

## REQUIREMENT 5 - group and summarize the data s there are only 1 row for each subject 
## and activity combination (like a 2 key database)
std_mean_df_mean <- std_mean_df %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))

######### OUTPUT THE DATA ########

## Output std_mean_df to run_analysis_std_mean.txt in the working directory
## This is the output that satisfies REQUIREMENTS 1-4 
write.table(std_mean_df, "./run_analysis_std_mean_df.txt")

## Output std_mean_df_mean to run_analysis_std_mean_grouped.txt in the working directory
## This is the output that satisfies REQUIREMENT 5 
write.table(std_mean_df_mean, "./run_analysis_std_mean_df_mean.txt")











