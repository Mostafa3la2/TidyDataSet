run_analysis<-function(){
xTest<-read.table("D:/R/Dataset/test/X_test.txt")
xTrain<-read.table("D:/R/Dataset/train/X_train.txt")
combinedData<-rbind(xTest,xTrain)
featureList<-read.table("D:/R/Dataset/features.txt")
means<-grep("mean",featureList$V2)
stds<-grep("std",featureList$V2)
extMeasureIndex<-c(means,stds)
extMeasureData<-combinedData[extMeasureIndex]
yTest<-read.table("D:/R/Dataset/test/y_test.txt")
yTrain<-read.table("D:/R/Dataset/train/y_train.txt")
allY<-rbind(yTest,yTrain)
activitylabel<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
allY<-mutate(allY,V1=activitylabel[V1])
colnames(allY)<-"activity"
dataset<-cbind(extMeasureData,allY)
colnames(dataset)<-featureList$V2[extMeasureIndex]
names(finalData)[dim(finalData)[2]]="activity"

write.csv(finalData,"finalData.csv")


averages<-matrix(nrow = length(activitylabel)+1,ncol=dim(extMeasureData)[2]+1)
averages[1,1]<-"activity"
count<-1
for (i in activitylabel) {
  count<-count+1
  averages[count,1]<-i
  
  for (j in 1:(dim(finalData)[2]-1)) {
    averages[1,j+1]<-names(finalData[j])
    averages[count,j+1]<-sapply(subset(finalData[j],finalData$activity==i),mean)[[1]]
    
  }
}
averages<-as.table(averages)


write.csv(averages,"avgData.csv")

}