Instructions for this project can be found here:
https://class.coursera.org/getdata-008/human_grading/view/courses/972586/assessments/3/submissions

Helpful tips on completing the assigmnment provided by David Hood at the link below:
https://class.coursera.org/getdata-008/forum/thread?thread_id=24

The dity data set is titled: run_analysis_std_mean_df_mean.txt

Below are the actions in "psuedo code" in the run_analysis.R script:  
1. Load the features meta data, train data and test data into R memory.  
2. Create columns names based on the features.  
3. Clean the columns names to remove non-alphanumeric characters and make the variables more descriptive.  
4. Create data frames from the test and train data and merge the data sets.  
5. Change the Activity entries from numeric to descriptive.  
6. Subset only columns that refer to Mean or Standard Deviation.  
7. Create the first data set that shows every mean and standard deviation observation from the raw data.  
8. Create the second data set that shows the mean of each variable for all common pairings of Subject and Activity.  
9. Ouput both data sets to txt files.  

Below are instructions using R commands to read in the ouput scripts with arbitrary 
data set names to be populated:  
test1 <- read.table("./run_analysis_std_mean.txt")  
test2 <- read.table("./run_analysis_std_mean_grouped.txt")  

https://github.com/Montauban/GettingAndCleaningDataCourseProject.git
