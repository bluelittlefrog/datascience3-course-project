datascience3-course-project
===========================


###This course project is composed of:
* README.md, this file available here: 
* https://github.com/bluelittlefrog/datascience3-course-project/README.md
* run_analysis.R, the commented R script used to tidy the data,available here:
* https://github.com/bluelittlefrog/datascience3-course-project/run_analysis.R
* CodeBook.md, describes the data available here: 
* https://github.com/bluelittlefrog/datascience3-course-project/CodeBook.md
* tidyDataSet2.txt, the tidy dataset from part 5 uploaded on coursera website.

###How to read the data
* Start R
* Set the working directory to the "UCI HAR Dataset" folder using:
```
setwd("path_to_the_folder/UCI HAR Dataset")
```
* source the script using:

```
source("path_to_the_folder/run_analysis.R")
```
* run the script with no arguments:
```
run_analysis()
```

###About the script
* It was written aas straightforward as possible and does not try to minimize memory usage.
* It is commented before each important step.
* It creates the tidy dataset asked in question 3, but does not print it, to get it, uncomment the corresponding section.
* Quick summary of what the script does:
 + Loads all the necessary files into memory using read.table()
 + Puts together the train and test dataset using rbind() and cbind()
 + Labels colums and use descriptive activity names using names() and factor()
 + Extracts only the measurements on the mean and standard deviation using grep() and subsetting
 + Summarizes the data using aggregate()
 + Outputs tidyDataSet2.txt using write.table()
 
###About the tidy dataset
It is considered tidy because:
* One column corresponds to one variable
* One row corresponds to one observation
* The labels are descriptive
* The data is ordered


###Study design
 

The original data was downloaded here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
and the description provided by the author can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The CodeBook is attached


