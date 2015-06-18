## Set the working directory here
library(reshape)

combineData<-function() {
  
  ## This function combines training and test data and appropriately labels columns, activities, and subjects.
  
  ## Load both training and test sets, activities, subjects, and activity labels
  ## Set the col.names from features.txt.

  features<-read.table(file="features.txt")
  
  trainingsubjects<-read.table("train/subject_train.txt",col.names="subject")
  trainingactivity<-read.table(file="train/y_train.txt",col.names = "activity")
  trainingSet<-read.table(file="train/X_train.txt",col.names=features[[2]])
  
  testsubjects<-read.table("test/subject_test.txt",col.names="subject")
  testactivity<-read.table(file="test/y_test.txt",col.names="activity")
  testSet<-read.table(file="test/X_test.txt",col.names=features[[2]])
  
  activityLabels<-read.table(file="activity_labels.txt")
  
  ## Bind test and training data into a dataframe called harData
  
  harData<-rbind(
    cbind(trainingsubjects,trainingactivity,trainingSet),
    cbind(testsubjects,testactivity,testSet)
    )
  
  ## Assign labels to activities
  harData$activity<-factor(harData$activity,levels=activityLabels[[1]],labels=activityLabels[[2]])
  
  ## Clean up
  rm(features,
     trainingactivity,
     trainingSet,
     trainingsubjects,
     testsubjects,
     testactivity,
     testSet,
     activityLabels
  )
  
  return(harData)
}


tidyData<-function(harData=harData) {
  
  ## Remove all the columns except for means and standard deviations.
  harData<-harData[grep(pattern="mean|std|subject|activity",x=colnames(harData),ignore.case=TRUE)]
   
  ## Take the combined dataset and compute means by subject and activity.
  harData<-aggregate(x=harData[,-(1:2)],
  
          by=list(subject=harData$subject,activity=harData$activity),
          FUN="mean"
          )     %>%
    
  ## Change from wide to long form. (Each observation is its own row.)
    melt(id=c("subject","activity"))
    
    ## Add a column for the type of observation: mean or standard deviation.
    
    harData$measure<NA  
    harData$measure[grep(pattern="mean",x=harData$variable, ignore.case=T)]<-"mean"
    harData$measure[grep(pattern="std",x=harData$variable, ignore.case=T)]<-"std"

    ## remove "mean" or "std" from the variable columns, so variable names are uniform.
    
    harData$variable<-gsub(x=harData$variable, pattern = "mean|std",ignore.case = T,replacement = "")
  
  return(harData)

}

write.table(tidyData(combineData()),"output.txt",row.names = F)