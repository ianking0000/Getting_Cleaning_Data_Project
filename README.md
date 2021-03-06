# Readme file for Getting_Cleaning_Data_Project
There are five major steps in the run_analysis.R script to achiven the final goal. The five steps are **merge,subset,change names, calculate mean and output**.Each step is discussed in details in the following. 

##1.Merge
The orginal training and test data are read in using *read.table* function. "X","y" and "sub" txt files are read in as data frames separately and named meaningfully (such as test_x, train_sub, etc.).

"sub" contains the volunteer ID (range 1~30).

"x" contains the 561-feature vector.

"y" contains the activity ID (range 1~6).

Firstly combine "sub","y","x" data frames in test and training data sets separately using *cbind* function. This step generates two data frames "test" and "train". Then row-combine these two data frames using *rbind* function.

The generated data frame is "full_data", which has 10299 rows and 563 columns. The 1st column is the volunteer ID, the 2nd column is the activity, the rest 561 columns are the 561 features.

##2.Subset
Read in "features.txt" to get the relationship between the element index ~ feature names in the 561-features vector using*read.table*. This relation is stored in "f_lab" data frame.

Using *grep* to select the feature names containing either "mean()" or "std()" keywords. This step generates a data frame "f_lab_sel". The 1st column is the element index, the 2nd column is the feature names containing keyword mean() or std(). Since in the "full_data" the 1st and 2nd column is volunteer ID and activity, in order to select the columns in the "full_data" which is a mean and standard deviation measurement, the index value shoul be added by 2 to represent the real column numberin the "full_data". The added-2 vector is stored in the V3 column in "f_lab_sel" data frame.

Subset columns in "full_data" using the vector (1,2, f_lab_sel$V3). The generated new data frame is "sel_data", which has 81 columns and 10299 rows. 1st column is the volunteer ID, 2nd column is the activity, the rest 79 columns contain all the "mean" or "std" features.

##3.Change names
The 2nd columns in "f_lab_sel" contains the original measurement names, so rename the columns in "sel_data" with the vector ("subjectID", "activity", f_lab_sel$V2) using *colnames* function.

Change the activity column from character type into factor type, then relapce the acvitivy ID (1~6) with **descriptive activity names** using *revalue* function:

"1" is "walk"

"2" is "walk_up"

"3" is "walk_down

"4" is "sit"

"5" is "stand"

"6" is "lay"

##4. Calculate mean
To calculate the average of each measurement for each activity and each subject, the sebjectID column and activity column in "sel_data" are *paste* together to createa a new column "index".

Reshape the "sel_data" with id= index and variables=the 79 columns which have "mean()" or "std()" in their names. (the names are stored in the f_lab_sel$V2 vector). 

Useing *mean* function to get the average for each index (i.e. each activity and each subject) using *dcast* function. The generated data frame is "final_data".

##5. Output
Using *write.table* to output the "final_data" into a txt file named as "mean_var.txt".

In the new data set, there are **80 columns** and **180 rows**. The 1st column is the index, which in the format "number-activity". The number is the volunteer ID. The rest 79 columns are the average of the 79 variable measurements which is either a mean or std value.Since we have 30 volunteers and 6 activities, so there are 180 rows.  
