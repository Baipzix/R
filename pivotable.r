#pivotable 

library(foreign)

dab<-read.dbf("J:\\1_Data\\1_Data\\DIDs\\intersect.dbf")


dab<-read.dbf("C:\\GCC\\DiDs\\intersect.dbf")

head(dab)

names(dab)
GCC<-dab[which(dab$COMPANY=="GRANDE CACHE COAL LP"),]
GCC<-GCC[c(2,3,50,51)]

GCC<-GCC[c(5,31,53)]
#No7
dids<-GCC[GCC$DISP_NUM %in% c('MSL041504','LOC040878','DML040131'),]
No7.area<-sum(dids[,3])*0.0001


dids<-GCC[GCC$DISP_NUM %in% c("MSL090924", "DML040121", "MLL060001", "LOC041045", "LOC091061", "LOC110668", "LOC090781"),]
No8.area<-sum(dids[,3])*0.0001

dids<-GCC[GCC$DISP_NUM %in% c("MLL040067", "LOC041174", "MLL040071", "MLL040071A", "MLL040071B", "MLL040071C", "LOC011231"),]
plant.area<-sum(dids[,3])*0.0001



dids<-GCC[GCC$DISP_NUM %in% c('MSL071329','MSL072051'),]
infrst.area<-sum(dids[,3])*0.0001

No7.area
No8.area
plant.area
infrst.area

#-----disturbed area------------



no12<-c('MSL041986')
no11<-c('LOC100341','LOC100342','MLL100030','MLL100031')
beaver<-c('LOC041333','LOC121239','LOC012094','LOC060702','MLL120103')
hual<-c('MLL050103','MLL120177','MLL060055','MSL071330','LOC121667','LOC041175')


dids<-GCC[GCC$DISP_NUM %in% no12,]
no12.area<-sum(dids[,3])*0.0001
dids<-GCC[GCC$DISP_NUM %in% no11,]
no11.area<-sum(dids[,3])*0.0001
dids<-GCC[(GCC$DISP_NUM %in% beaver),]
beaver.area<-sum(dids[,3])*0.0001
dids<-GCC[GCC$DISP_NUM %in% hual,]
hual.area<-sum(dids[,3])*0.0001

no12.area
no11.area
beaver.area
hual.area


dab[dab$DISP_NUM %in% beaver,]


#-------north disposition area

dab<-read.dbf("C:\\GCC\\DiDs\\DAB_APPL.dbf")

head(dab)

names(dab)
rownb=grep("GRANDE CACHE COAL", dab$COMPANY,value=F)
GCC<-dab[rownb ,]
GCC<-GCC[c(2,28,50)]
head(GCC)

dids<-GCC[GCC$DISP_NUM %in% no12,]
no12.area<-sum(dids[,3])*0.0001
dids<-GCC[GCC$DISP_NUM %in% no11,]
no11.area<-sum(dids[,3])*0.0001
dids<-GCC[GCC$DISP_NUM %in% beaver,]
beaver.area<-sum(dids[,3])*0.0001
dids<-GCC[GCC$DISP_NUM %in% hual,]
hual.area<-sum(dids[,3])*0.0001

no12.area
no11.area
beaver.area
hual.area

company<-unique(dab[,28])
sort(company)





prpcd<-sort(unique(dab$PURPCD))
prpcd[grep("ROAD", prpcd )]

