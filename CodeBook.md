
##  STUDY DESIGN

The data sets produced by this are provided by the study located at the link below. See this for more information on the raw data.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

1. The ouput of this study focuses in on the Mean and Standard Deviation variables from the raw data. The "run_analysis.R" script filters out all variables that do not pertain to Mean or Standard Deviation. 
2. Secondly, this study combines the **train data** and **test data** and associates those with the **features** meta data. This allows analyis of all three together in a singular data set.

## Raw data

The raw data is from the .zip file below:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Tidy data files 

"run_analysis_std_mean.txt" Satisfies requirements 1-4 from the assignment
"run_analysis_std_mean_df_mean.txt" Satifies requirement 5 in the from the assignment.

## INSTRUCTIONS LIST

1. Download the following .zip file and unzip to the working directory of the local machine: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Unzip the downloaded file to the working directory. You should see the following sub directories in the working directory:
- meta data
- test
- train
3. Set the working directory for R to the directory where the unzipped files from step 2 are located. This can be done with the setwd() command.
3. Run the "run_analysis.R" script using R (R 3.1.0 or later is recommended).
4. The data sets described below will be created in the working directory:

**run_analysis_std_mean.txt**
This data set shows every mean and standard deviation observation from the raw data. 

**run_analysis_std_mean_df_mean.txt** 
This data set shows the mean of each variable for all common pairings of Subject and Activity. In other words, each Subject/Activity combination is combined into one row and the mean of each variable is in the associated columns.


## run_analysis.R RECIPE

Below are the actions in "psuedo code" in the run_analysis.R script:
1. Load the features meta data, train data and test data into R memory.
2. Create columns names based on the features.
3. Clean the columns names to remove non-alphanumeric characters and make the variables more descriptive.
4. Create data frames from the test and train data and merge the data sets.
5. Change the Activity entries from numeric to descriptive.
6. Subset only columns that refer to Mean or Standard Deviation.
7. Create the first data set that shows every mean and standard deviation observation from the raw data
8. Create the second data set that shows the mean of each variable for all common pairings of Subject and Activity.
9. Ouput both data sets to txt files.

## CODE BOOK

Each variable in the **run_analysis_std_mean.txt** and **run_analysis_std_mean_df_mean.txt** data sets is a combination / concatenation of variable descriptors. Below is a summary of the concatenated element meanings for both data sets:

- Gravity : Standard Gravity Units 'g' 
- Body : Body motion components (duplicated "Body" text in the variables have been removed)
- Frequency / Freq : Indicates frequency domain signals
- Time : Captured at a constant rate of 50 Hz. Then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
- Acc : Accelerometer measurements
- Gyro : Gyrometer measurements
- Jerk : Jerk signals
- Mag : Magnitude of three-dimensional signals from Euclidean norm
- Angle: Angle between two vectors 
- X : refers to the X axis
- Y : refers to the Y axis

Below is a full variable list:

"Subject" "Activity" "TimeAccMeanX" "TimeAccMeanY" "TimeAccMeanZ" "TimeAccStandardDeviationX" "TimeAccStandardDeviationY" "TimeAccStandardDeviationZ" "TimeGravityAccMeanX" "TimeGravityAccMeanY" "TimeGravityAccMeanZ" "TimeGravityAccStandardDeviationX" "TimeGravityAccStandardDeviationY" "TimeGravityAccStandardDeviationZ" "TimeAccJerkMeanX" "TimeAccJerkMeanY" "TimeAccJerkMeanZ" "TimeAccJerkStandardDeviationX" "TimeAccJerkStandardDeviationY" "TimeAccJerkStandardDeviationZ" "TimeGyroMeanX" "TimeGyroMeanY" "TimeGyroMeanZ" "TimeGyroStandardDeviationX" "TimeGyroStandardDeviationY" "TimeGyroStandardDeviationZ" "TimeGyroJerkMeanX" "TimeGyroJerkMeanY" "TimeGyroJerkMeanZ" "TimeGyroJerkStandardDeviationX" "TimeGyroJerkStandardDeviationY" "TimeGyroJerkStandardDeviationZ" "TimeAccMagMean" "TimeAccMagStandardDeviation" "TimeGravityAccMagMean" "TimeGravityAccMagStandardDeviation" "TimeAccJerkMagMean" "TimeAccJerkMagStandardDeviation" "TimeGyroMagMean" "TimeGyroMagStandardDeviation" "TimeGyroJerkMagMean" "TimeGyroJerkMagStandardDeviation" "FrequencyBodyAccMeanX" "FrequencyBodyAccMeanY" "FrequencyBodyAccMeanZ" "FrequencyBodyAccStandardDeviationX" "FrequencyBodyAccStandardDeviationY" "FrequencyBodyAccStandardDeviationZ" "FrequencyBodyAccMeanFreqX" "FrequencyBodyAccMeanFreqY" "FrequencyBodyAccMeanFreqZ" "FrequencyBodyAccJerkMeanX" "FrequencyBodyAccJerkMeanY" "FrequencyBodyAccJerkMeanZ" "FrequencyBodyAccJerkStandardDeviationX" "FrequencyBodyAccJerkStandardDeviationY" "FrequencyBodyAccJerkStandardDeviationZ" "FrequencyBodyAccJerkMeanFreqX" "FrequencyBodyAccJerkMeanFreqY" "FrequencyBodyAccJerkMeanFreqZ" "FrequencyBodyGyroMeanX" "FrequencyBodyGyroMeanY" "FrequencyBodyGyroMeanZ" "FrequencyBodyGyroStandardDeviationX" "FrequencyBodyGyroStandardDeviationY" "FrequencyBodyGyroStandardDeviationZ" "FrequencyBodyGyroMeanFreqX" "FrequencyBodyGyroMeanFreqY" "FrequencyBodyGyroMeanFreqZ" "FrequencyBodyAccMagMean" "FrequencyBodyAccMagStandardDeviation" "FrequencyBodyAccMagMeanFreq" "FrequencyBodyAccJerkMagMean" "FrequencyBodyAccJerkMagStandardDeviation" "FrequencyBodyAccJerkMagMeanFreq" "FrequencyBodyGyroMagMean" "FrequencyBodyGyroMagStandardDeviation" "FrequencyBodyGyroMagMeanFreq" "FrequencyBodyGyroJerkMagMean" "FrequencyBodyGyroJerkMagStandardDeviation" "FrequencyBodyGyroJerkMagMeanFreq" "AngleTimeAccMeanGravity" "AngleTimeAccJerkMeanGravityMean" "AngleTimeGyroMeanGravityMean" "AngleTimeGyroJerkMeanGravityMean" "AngleXGravityMean" "AngleYGravityMean" "AngleZGravityMean"


## Summary of Raw Data

Below is a summary of data sets form the raw data provided: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


META DATA
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.

TRAIN DATA
- 'train/X_train.txt': Training set. <
- 'train/y_train.txt': Training labels. < 
- 'test/X_test.txt': Test set. < 
- 'test/y_test.txt': Test labels. < 

TRAIN DATA
The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.



