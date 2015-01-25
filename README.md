## getdata-017-course-project

# data porcess pipeline
1.load features from 'features.txt'
2.genarate the feature filter by feature name using regular expression 'mean\\(\\)|std\\(\\)'
3.load activity labels from 'activity_labels.txt'
4.load datasets
  4.1 load activity ids from label file
  4.2 convert activity ids to labels using activity labels in step 3
  4.3 load subjects from subject file
  4.4 load dataset from data file
  4.5 bind activity and subject to dataset
  4.6 filter dataset using filter in step 2 (shifted by 2 becuase the activity and subject column)
  4.7 return the data set
5. bind the test dataset and train dataset
6. split the whole dataset by activity and subject
7. calculate the column means for each subgroup, now the result is a 2 dimensional list, each row is a measurement, each column is a activity of a subject
8. transform the result to a data frame
9. transpose the data frame


# how to run the code
download data from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

extract the zip archive

copy run_analysis.R to the root folder for extracted data

open R terminal 

type the following command:

source("run_analysis.R")

data <- analyse()

then you get the result in 'data'
