## Set the working directory here
setwd("C:/r/UCI HAR Dataset")

combineData<-function() {
  
  ## This function combines training and test data and appropriately labels columns, activities, and subjects.
  
  ## Load both training and test sets, activities, subjects, and activity labels
  ## Set the col.names from features.txt.

  features<-read.table(file="features.txt")
  
  trainingSubjects<-read.table("train/subject_train.txt",col.names="Subject")
  trainingActivity<-read.table(file="train/y_train.txt",col.names = "Activity")
  trainingSet<-read.table(file="train/X_train.txt",col.names=features[[2]])
  
  testSubjects<-read.table("test/subject_test.txt",col.names="Subject")
  testActivity<-read.table(file="test/y_test.txt",col.names="Activity")
  testSet<-read.table(file="test/X_test.txt",col.names=features[[2]])
  
  activityLabels<-read.table(file="activity_labels.txt")
  
  ## Bind test and training data into a dataframe called harData
  
  harData<-rbind(
    cbind(trainingSubjects,trainingActivity,trainingSet),
    cbind(testSubjects,testActivity,testSet)
    )
  
  ## Assign labels to activities
  harData$Activity<-factor(harData$Activity,levels=activityLabels[[1]],labels=activityLabels[[2]])
  
  ## Clean up
  rm(features,
     trainingActivity,
     trainingSet,
     trainingSubjects,
     testSubjects,
     testActivity,
     testSet,
     activityLabels
  )
  
  ## Remove all the columns except for means and standard deviations
  
  harData<-harData[grep(pattern="mean|std|Subject|Activity",x=colnames(harData),ignore.case=TRUE)]
  return(harData)
}


## This function takes the combined dataset and computes means by subject and activity.

tidyData<-function(harData) {
  
  aggregate(x=harData[,-(1:2)],
            by=list(Subject=harData$Subject,Activity=harData$Activity),
            FUN="mean"
            )
}

tidyData(combineData())


