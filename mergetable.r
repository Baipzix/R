library(gtools)
library(plyr)

setwd("C:\\Tolko\\data\\SurveyMap")

files=list.files(getwd(),"summary")

mergelist<-"merged.txt"
mergeddata<-"Blocks.csv"


if(!file.exists(mergelist)){
  mergelist<-c()
  tomerge<-files
} else{
  mergelist<-read.table("merged.txt",head=F)
  tomerge<-setdiff(files,t(mergelist))
}



if(!file.exists(mergeddata)){
  csv<-read.csv(files[1],head=T,sep=",")
  mgd<-csv[0,]
} else{
  mgd<-read.csv(mergeddata,head=T,sep=",")
}



for(file in tomerge){
  csv<-read.csv(file,head=T,sep=",")
  mgd<-rbind.fill(mgd,csv)
  mergelist<-rbind(mergelist,as.matrix(file))
  file
  
}

if(("Plot_Num" %in% colnames(mgd))){
  mgd<-mgd[,!(colnames(mgd) %in% "Plot_Num")]
}



write.csv(mgd,"Blocks.csv",row.names = F)
write.table(mergelist,"merged.txt",row.names = F, col.names = F)



