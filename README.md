# Readme file for Getting_Cleaning_Data_Project
There are five major steps in the run_analysis.R script to achiven the final goal. The five steps are **merge,subset,change names, calculate mean and output**.Each step is discussed in details in the following 

##1.Merge
The orginal training and test data are read in using *read.table* function. "X","y" and "sub" txt files are read in separately and named meaningfully.
"sub" contains the volunteer ID (range 1~30)
"x" contains the 561-feature vector
"y" contains the activity ID (range 1~6)

First column combine "sub","y","x" for test and training separately using *cbind*
Then training and test data frame are row combined using *rbind*
The generated data frame is "full_data", which ahas 10299 rows and 563 columsn. The 1st col. is the volunteer ID, the 2nd col. is the activity, the rest 561 col. are the 561-features.

##2.Subset
Read in "features.txt" to the relation between element index ~ feature names in the 5651-features vector using*read.table*. This relation is stored in "f_lab" data frame.

Using *grep* to select the feature names contains "mean()" or "std()". This step generates a data frame "f_lab_sel", the 1st col. is the element index, the 2nd col. is the col.names correspoding to a mean or std value. Since in the "full_data", the 1st and 2nd col. are volunteer ID and activity, so to select the col. with mean and std, the index is added by 2 to represent the col. # of mean and std columns in the "full_data", which is the V3 col. in "f_lab_sel"

Subset col. in "full_data" data frame Using the vector (1,2, f_lab_sel$V3). The generated new data frame is "sel_data", which has 81 col. and 10299 rows. 1st col is the volunteer ID, 2nd is the activity, the rest 79 cols. contains all the "mean" or "std" features.

##3.Change names
The 2nd col. in "f_lab_sel" contains the original feature names, so rename the col. in "sel_data" with the vector ("subjectID","activity",f_lab_sel$V2) using *colnames*.

Make activity col into factor and relapce the acvitivy ID with **activity names
** using *revalue*

"1" is "walk"
"2" is "walk_up"
"3" is "walk_down
"4" is "sit"
"5" is "stand"
"6" is "lay"

##4. Calculate mean
To calculate the average of each variables for each activity and each subject, the sebjectID col. and activity col. in "sel_data" are *paste* together to createa new col. named as "index" in "sel_data" data frame.

Reshape the "sel_data" with id as index, variables as the 79 col. with mean or std in their names. (This information is in the f_lab_sel$V2 vector). 

Useing *mean* function to get the average for each index (i.e. each activity and each subject) by *dcast* function. The generated data frame is "final_data".

##5. Output
Using *write.table* to output the "final_data" into a txt file named as "mean_var.txt". 
In the new data frame, there are 80 cols. and 180 rows. The 1st col. is the index, which in the format number-activity. The number is the volunteer ID. The rest 79 col. are the average of the 79 features which is either a mean or std values.
Since we have 30 volunteers and 6 activities, so there are 180 rows.  
