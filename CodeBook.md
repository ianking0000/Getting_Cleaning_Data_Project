#Code Book for mean_var.txt data set

The data set has 80 columns and 180 rows. 

The 1st column is the "index", which in the format number-activity. The number is the volunteer ID. There are 30 volunteers who joined the test, so the number ranges from 1-30. There are 6 activities, including walk, walk_up, walk_down, sit, stand, lay. These are the activities that the volunteer performed when the data was acquired.

The rest 79 columns are the average values of the 79 features which is either a mean or standard deviation measurement. The column names are self-explanatory. For example, "tBodyAcc-mean()-X" means this column is the average value of the tBodyAcc-mean()-X measurement; "tBodyAcc-Std()-X" means this column is the average value of the tBodyAcc-Std()-X measurement. 

Since there are 30 volunteers and 6 activities, there are 30*6=180 rows. Each row is the average of the 79 mean or std features for one volunteer and one activity.
