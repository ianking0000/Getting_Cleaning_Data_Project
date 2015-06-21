#R Script for Course Project#
#Get and Clean Data#

#########################1.Merge########################################
#Read in data#
test_x <- read.table(file ="./UCI HAR Dataset/test/X_test.txt")
test_y <- read.table(file ="./UCI HAR Dataset/test/y_test.txt")
test_sub <- read.table(file ="./UCI HAR Dataset/test/subject_test.txt")

train_x <- read.table(file ="./UCI HAR Dataset/train/X_train.txt")
train_y <- read.table(file ="./UCI HAR Dataset/train/y_train.txt")
train_sub <- read.table(file ="./UCI HAR Dataset/train/subject_train.txt")

#Merge two data set#
test <- cbind(test_sub,test_y,test_x)
train <- cbind(train_sub,train_y,train_x)
full_data <- rbind (train,test)

#########################2.Subset########################################
#1st col is the volunteer ID, second column is the activiity ID,# 
#the rest 561 cols are the features#
f_lab <- read.table(file ="./UCI HAR Dataset/features.txt")
f_lab$V2 <- as.character(f_lab$V2)  #change factro into charactor#
f_lab_mean <- f_lab[grep("mean()",f_lab$V2),]
f_lab_std <- f_lab[grep("std()",f_lab$V2),]
f_lab_sel <- rbind(f_lab_mean, f_lab_std)
f_lab_sel <- f_lab_sel[order(f_lab_sel$V1),]
f_lab_sel$V3 <- f_lab_sel[,1]+2 #as the 1st is the volunteer ID, 2nd is the activitiy ID#

#This is the col I will chosse: subjectID+activityID+mean & std#
sel_col <- c(1,2, f_lab_sel$V3)

#Chosse the col from full data#
sel_data <- full_data[,sel_col]


#########################3.Change names########################################
#This is the name for the new data-frame#
name_col <-c("subjectID", "activity", f_lab_sel$V2)
#name the new data frame#
colnames(sel_data) <- name_col
#change activity name#
library(plyr)
sel_data$activity <- factor(sel_data$activity)
sel_data$activity <- revalue(sel_data$activity,c("1"="walk","2"="walk_up","3"="walk_down","4"="sit","5"="stand","6"="lay"))


#########################4.Calculate mean########################################
#calculate the mean#
sel_data$index <- paste(sel_data$subjectID,sel_data$activity,sep='-')
library(reshape2)
melt_frame = melt(sel_data, id="index",measure.vars = f_lab_sel$V2)
final_data <- dcast(melt_frame, index~ variable, mean)

#########################5.Output########################################
write.table(final_data,file="./mean_var.txt", row.names = FALSE)

