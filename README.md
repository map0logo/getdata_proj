getdata_proj
============

## Transformation details

As suggested on the statement of the project :

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How ``run_analysis.R`` implements the above steps:

* Load `plyr` package.
* If data is not available creates a `data` folder inside the *working directory* and downloads and saves there data with the name `UCI HAR Dataset.zip`.
* Unzip data on Working Directory.
* Load `features` and `activity_labels` from root of `UCI HAR Dataset` folder.
* Load test and train data from `train` and `test` folders inside `UCI HAR Dataset` folder.
* Extract the mean and standard deviation column names and data.
* Shapes the data. Build two data frames `test_data` and `train_data` with X columns and addtional columns `subject`, `y`, and `set`. 
* Merge data set using `rbind()` function, this generates the new data frame `data`. Set `subject` and `set` as factors.
* Creates a new dataframe `data.mean_sd` which columns corresponding to mean (`_mean__`) an standard deviation (`_std__`) values.
* Add a new column to `data` with name `activity` which maps corresponding activiy labels to values of `y` column.
* Assign column names to `data` taken from `features` file.
* Writes tidy data set created in step 5 with the name `data.avg_actv_subj.txt`.
