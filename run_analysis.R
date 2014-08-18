#run the analysis in the UCI HAR Dataset folder.


run_analysis <- function() {
        # load all the files into memory
        wd <- getwd()
        subject_test <- read.table(paste0(wd,"/","test/subject_test.txt"))
        features <- read.table(paste0(wd,"/","features.txt"))
        activity_labels <- read.table(paste0(wd,"/","activity_labels.txt"))
        X_test <- read.table(paste0(wd,"/","test/x_test.txt"))
        y_test <- read.table(paste0(wd,"/","test/y_test.txt"))
        subject_train <- read.table(paste0(wd,"/","train/subject_train.txt"))
        X_train <- read.table(paste0(wd,"/","train/x_train.txt"))
        y_train <- read.table(paste0(wd,"/","train/y_train.txt"))
        
        #merges the training and the test set to create one data set
        merged_data <- rbind(X_test,X_train)
        merged_labels <- rbind(y_test,y_train)
        merged_subjects <- rbind(subject_test,subject_train)
        fulldata <- cbind(merged_subjects,merged_labels,merged_data)
       
        
        # label the columns
        names <- as.character(features[,2])
        names <- c("subjects","activity",names)
        names(fulldata) <- names
        
        #Uses descriptive activity names to name the activities in the data set
        levels <- activity_labels[,1]
        labels <- as.character(activity_labels[,2])
        fulldata$activity <- factor(fulldata$activity,levels= levels, labels=labels)
        fulldata$subjects <- factor(fulldata$subjects,levels=c(1:30))
        
        
        #Extracts only the measurements on the mean and standard deviation
        #for each measurement.
        meanAndStd <- grep("-mean\\(\\)$|-std\\(\\)$|^activity$|^subjects$",names)
        lightdata <- fulldata[,meanAndStd]
        
        
       
        #Appropriately labels the data set with descriptive variable names. DONE EARLIER
        
        #output the first tidy dataset
        dir1 <- paste0(wd, "/", "tidyDataSet1.txt")
        write.table(lightdata, dir1 ,row.names = FALSE)
        
        #create the second tidy dataset
        suppressWarnings(summary <- aggregate(fulldata, by=list(fulldata$activity,fulldata$subjects),mean))
        summary$subjects <- NULL
        summary$activity <- NULL
        
        #output the second tidy dataset
        dir2 <- paste0(wd, "/", "tidyDataSet2.txt")
        write.table(summary, dir2, row.names = FALSE)

}
