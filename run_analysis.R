# load libraries
library(plyr)

# Load subject, training, test and features datasets from working directory where data folder was unzipped
df_x_train <- read.table("./train/X_train.txt")
df_x_test <- read.table("./test/X_test.txt")
df_y_train <- read.table("./train/y_train.txt")
df_y_test <- read.table("./test/y_test.txt")
df_subject_train <- read.table("./train/subject_train.txt")
df_subject_test <- read.table("./test/subject_test.txt")
df_features <- read.table("./features.txt")
df_activityID <- read.table("./activity_labels.txt")

# Assign the appropriate column names of train and test dataframes 
colnames(df_x_train) <- df_features[,2]
colnames(df_x_test) <- df_features[,2]
colnames(df_y_train) <- "activity_id"
colnames(df_y_test) <- "activity_id"
colnames(df_subject_train) <- "subject_id"
colnames(df_subject_test) <- "subject_id"

# convert y_train and y_test values to the corresponding activity_id descirptions
df_y_train$activity_id <- factor(df_y_train$activity_id, labels = df_activityID$V2)
df_y_test$activity_id <- factor(df_y_test$activity_id, labels = df_activityID$V2)

# merge y, x and subject_test dataframes by columns using the cbind() function for both test and train datasets

df_train <- cbind(df_x_train, df_y_train, df_subject_train)
df_test <- cbind(df_x_test, df_y_test, df_subject_test)

# merge test and train by rows  using rbind () function
df_train_test <- rbind(df_train, df_test)


# Select columns for the mean and stdev for each measurement in addition to the activityID column

df_tidy <- df_train_test[,grep("mean|std|activity_id|subject_id" , names(df_train_test), value=TRUE)]

# Appropriately labels the data set with descriptive variable names
# Remove parentheses, dashes, underscores, hyphens and commas from variable names

df_tidy_names <- gsub("\\(|\\)|-|,", "", names(df_tidy))
names(df_tidy) <- df_tidy_names

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
df_final = ddply(df_tidy, .(activity_id, subject_id), numcolwise(mean))

# write to file
write.table(df_final, file="motion_data.txt", sep = "\t", append=F)