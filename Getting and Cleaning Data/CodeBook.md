#HOW TO DO

###Merges the training and the test sets to create one data set
To do this, I will read raw csv data from training set and test set, store it in train.data and test.data  
When reading it, I also read subject and label, and using cbind to bind columns of 3 data sets  
Finally, I using rbind to bind train.data and test.data together, store in data.set

###Extracts only the measurements on the mean and standard deviation for each measurement. 
I read feature.txt raw data to feature.info variable and make it's column name is colIdx, colName  
So, field colName will store variable's name of train data set and test data  
From feature.info, I get colIdx where colName store "mean" or "std" string  
After having colIdx, just subset data with column in this index. 

### Uses descriptive activity names to name the activities in the data set
Because "activity_labels.txt" store data mapping label id with it's name, I will read and store it into activity.labels  
and make name for its column is "activityId", "label"  
I also make name for data.set columns from feature.info append 2 name "activityId", "subject". I add 2 more name because in step Merge training and test set  
I already bind 3 dataset's column together   
Here we have 2 data set with column "activityId", just merge it 

### Appropriately labels the data set with descriptive variable names. 
I finished this requirement in before steps

### Creates a second, independent tidy data set with the average of each variable for each activity and each subject
I used aggregate function to subset my data to each group by activity and subjetc, after that I apply mean function to get average of all variable