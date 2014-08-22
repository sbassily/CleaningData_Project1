## Getting and Cleaning Data - Project

Source dataset https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

*  You should create one R script called run_analysis.R that does the following.
*  Merges the training and the test sets to create one data set.
*  Extracts only the measurements on the mean and standard deviation for each measurement.
*  Uses descriptive activity names to name the activities in the data set
*  Appropriately labels the data set with descriptive activity names.
*  Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Notes

*  Only vaiables containing mean() & std() are used.
*  Requires the plyr & reshape2, data.table packages.
*  Assumes the dataset is in this path under the "Documents/UCI HAR Dataset/" in the current folder

Constructed using the following:

```R
> version
platform       x86_64-apple-darwin13.1.0   
arch           x86_64                      
os             darwin13.1.0                
system         x86_64, darwin13.1.0        
status                                     
major          3                           
minor          1.1                         
year           2014                        
month          07                          
day            10                          
svn rev        66115                       
language       R                           
version.string R version 3.1.1 (2014-07-10)
nickname       Sock it to Me
```

##  Running

```bash
$ Rscript run_analysis.R
```

Yields tidyData.txt & tidyAvgData.txt.
