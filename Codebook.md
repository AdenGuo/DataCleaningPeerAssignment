## Transformation of the raw data
1. Extracting positions and names of features corresponding to the means and standard deviations.
2. Reading train and test data and merging them into one data containing calculated measurements, objectID and activity labels.
3. Using the results from 1 and 2 to produce a tidy data which only contain the means and standard deviations.
4. Replacing activity label (1, 2, 3, 4, 5, 6) by activity names (LAYING, STANDING and so on).
5. Output this dataset into a dataAll.txt file for further use, and output six files which containing six kinds of activities separately.
6. Calculating the mean for each activity and subject and output these two dataset into two files (activity and subject).


## Some important variables after you run the code.

*dataAll ---All the data containing test and training set of all the features, object ID and activity label.
*data ---The data set demanded by assignment which only contains means and standard deviations of the features.
*activityMean ---the means corresponding to different activities
*subjectMean ---the means corresponding to each subject
