setwd("C:\\Tolko\\data\\SurveyMap")




files=list.files(getwd(),"summary")
files




maplist<-"maplist.txt"

if(!file.exists(maplist)){
  df<-data.frame(
      plotname=character(),
      Block=Character(20),
      missing=integer(),
      total=integer()
  )
  todolist<-files
} else{
  df<-read.table("maplist.txt", head=T)
  todolist<-setdiff(files,df$plotname)

}

df<-transform(df, Block=as.character(Block))




for(file in todolist){
  print(file)
  csv<-read.csv(file,head=T,sep=",") 
  #remove na value row
  csv<-csv[!is.na(csv[,1]),]


  
  if("ï..Plot" %in% colnames(csv)){
    plot<-csv$ï..Plot
    csv$ï..Plot<-NULL
    csv["Plot"]<-NA
    csv$Plot<-plot
    
  } else if("Plot" %in% colnames(csv)){
    plot<-csv$Plot
  }


  
  #check the mising value of plot
  x.<-c(0,cumsum(diff(plot)-1))
  plotseg<-lapply(split(plot,x.),range)
  Missing=length(plotseg)-1
  Total=length(plot)+Missing
  newrow<-data.frame(plotname=file,Block=as.character(csv$Block[1]),missing=Missing, total=Total)
  
  
  #add to the list 
  df<-rbind(df,newrow)
  
  #concatenate Openning and Plot 
  
  if(!("PLOT_NUM" %in% colnames(csv))){
    
    if(("Opening" %in% colnames(csv))){
      plot_num<-paste(csv$Opening,plot,sep="_")
      
      csv<-cbind(csv,PLOT_NUM=plot_num)
      
      
      
      write.csv(csv,file, row.names = F)
      
    } else {
      print(file)
    }
    
    
  }
  write.csv(csv,file, row.names = F)
  

}



write.table(df,"maplist.txt", row.names = F,col.names = T)

  

  #check the mising value of plot
  # max.plot<-max(plot,na.rm=T)
  # fulllist<-seq(from=1, to =max.plot, by=1)
  # setdiff(fulllist,plot)
  # 



#===============================================================#
#
#
#
#===============================================================#

#row bind 

library(smartbind)
berland<-read.csv("J:\\2_SCARI\\2018\\mergedScari0723\\SCARI_Berland_correct_july4.csv")
all<-read.csv("J:\\2_SCARI\\2018\\mergedScari0723\\Scari_20180712.csv")
july21<-read.csv("J:\\2_SCARI\\2018\\mergedScari0723\\Scari_June21_notQC.csv")


ba<-rbind.fill(berland, all)
ba<-rbind.fill(ba,july21)


write.table(ba,"J:\\2_SCARI\\2018\\mergedScari0723\\SCARI_merged3.csv", sep=",",row.names = F,col.names = T)


#####

rawdt<-read.csv("J:\\2_ACCEL\\GooseRiver_2018\\FWMIS_berland.csv")
spr<-read.csv("J:\\2_ACCEL\\GooseRiver_2018\\FWMIS_berland_trf.csv")

d1<-merge(spr,rawdt, by="GlobalID")

print(d1)

write.table(d1,"J:\\2_ACCEL\\GooseRiver_2018\\FWMIS_berland_expand.csv", sep=",",row.names = F,col.names = T)







