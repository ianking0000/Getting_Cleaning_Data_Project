#Code Book for mean_var.txt data set

1. The data set has **80 columns** and **180 rows**. 

2. The 1st column is the "index", which is in the format "number-activity". The number is the volunteer ID. There are 30 volunteers who joined the experiments, so the number ranges from 1-30. There are 6 activities, including walk, walk_up, walk_down, sit, stand, lay. These are the activities that the volunteer performed when the data was acquired.

3. The rest 79 columns are the average values of the 79 features which is either a mean or standard deviation measurement. The column names are self-explanatory. For example, "tBodyAcc-mean()-X" means this column is the average value of the tBodyAcc-mean()-X measurement; "tBodyAcc-Std()-X" means this column is the average value of the tBodyAcc-Std()-X measurement. If you want to explore the physical definition of the measurement names, please look at the **note** in the end (copied from the "feature_info.txt").

4. **unit**. The acceleration signal from the smartphone accelerometer is in standard gravity units '**g**'. The angular velocity vector measured by the gyroscope is in unit '**radians/second**'.


5. Since there are 30 volunteers and 6 activities, there are 30*6=180 rows. Each row contains the average value of the 79 mean or standard deviation measurement for one volunteer and one activity.

**************************************************************************************************************************

####Note
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean

