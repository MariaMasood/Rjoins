library(readr)
IGM <- read_csv("C:/Users/Maria.DESKTOP-PH359AS/Desktop/Maria/IGM/IGM2020_25 MAR_V2.csv")
View(IGM)


library(readxl)
IGM <- read_excel("C:/Users/Maria.DESKTOP-PH359AS/Desktop/Maria/IGM/IGM2020_25 MAR_V2.xlsx")
View(IGM)

library(readxl)
WEBOC <- read_excel("C:/Users/Maria.DESKTOP-PH359AS/Desktop/Maria/WEBOC/WEBOC2020_02APR2021_NEW2(2Apr2020).xlsx")
View(WEBOC)




library(readxl)
WEBOC <- read_excel("C:/Users/Maria.DESKTOP-PH359AS/Desktop/Maria/WEBOC/WEBOC2020_01 APR 2021_2.xlsx")
View(WEBOC)

WEBOC <- read_csv("C:/Users/Maria.DESKTOP-PH359AS/Desktop/Maria/WEBOC/WEBOC2020_V2.csv")
View(WEBOC)

# Transform WEBOC Date
WEBOC <- transform(WEBOC,  BL_Date = as.Date(as.character(WEBOC$BL_Date), "%Y%m%d"))
WEBOC <- transform(WEBOC,  Arrival_Date = as.Date(as.character(WEBOC$Arrival_Date), "%Y%m%d"))
WEBOC <- transform(WEBOC,  IGM_Date = as.Date(as.character(WEBOC$IGM_Date), "%Y%m%d"))
# Transform IGM Date
IGM$Bill.Of.Lading.Date <- as.Date(IGM$Bill.Of.Lading.Date, "%d/%m/%Y")
colnames(IGM)[22] <- "BL_Date"

#Drop Redundant Column WEBOC
drops <- c("Unit")
WEBOC <- WEBOC[ , !(names(WEBOC) %in% drops)]

#Drop Redundant Column IGM
drops <- c("Bill.Of.Lading.Date")
IGM <- IGM[ , !(names(IGM) %in% drops)]

# Rename IGM Column
colnames(IGM)[21] <- "BL_No"
colnames(IGM)[8] <- "Weight"
colnames(IGM)[3] <- "Index_No"


# check Columns
a=colnames(IGM)
b=colnames(WEBOC)
a
b

#Remove Punctuation & Space
IGM$BL_No=gsub("[[:space:]]",'',IGM$BL_No)
IGM$BL_No=gsub('[[:punct:] ]+','',IGM$BL_No)

#Remove Punctuation & Space
WEBOC$BL_No=gsub("[[:space:]]", "", WEBOC$BL_No)
WEBOC$BL_No=gsub('[[:punct:] ]+', "", WEBOC$BL_No)

#Join Data on behalf of BL_No+Weight string IGM
temp= paste0(IGM$BL_No, IGM$Weight)
IGM = cbind(IGM, temp)

#Join Data on behalf of BL_No+Weight string WEBOC
temp= paste0(WEBOC$BL_No, WEBOC$Weight)
WEBOC = cbind(WEBOC, temp)


library(sqldf)
colnames(WEBOC)[27] <- "temp2"
mergedData <- sqldf::sqldf("SELECT * FROM IGM
                           LEFT OUTER JOIN WEBOC
                           ON IGM.temp = WEBOC.temp")

mergedData =mergedData [!duplicated(mergedData$temp), ]

mergedData=mergedData[,order(colnames(mergedData))]
View(mergedData)

c=colnames(mergedData)
c

View(head(mergedData))

write.csv(mergedData, 'IGM_WEBOC_V4(IGM Whole data).csv', row.names = FALSE)







mergeda <- sqldf::sqldf("SELECT * FROM WEBOC 
                           LEFT OUTER JOIN IGM
                           ON  WEBOC.temp = IGM.temp")

mergeda =mergeda [!duplicated(mergeda$temp), ]

mergeda=mergeda[,order(colnames(mergeda))]
View(mergeda)

c=colnames(mergeda)
c

View(head(mergeda))
write.csv(mergeda, 'IGM_WEBOC_V4(WEBOC Whole data).csv', row.names = FALSE)




library(dplyr)
Newanti=anti_join(x = mergedData, y = mergeda, by = "temp", copy = FALSE)
View(Newanti)
Newanti=Newanti %>% 
  select(where(~!all(is.na(.))))

d=colnames(Newanti)
d
a=colnames(IGM)
a

write.csv(mergeda, 'IGM_records(not in whole data).csv', row.names = FALSE)



# WEBOC records not in whole data
Newanti=anti_join(x = mergeda, y = mergedData, by = "temp", copy = FALSE)
View(Newanti)
Newanti=Newanti %>% 
  select(where(~!all(is.na(.))))

d=colnames(Newanti)
d


b=colnames(WEBOC)
b

write.csv(mergeda, 'WEBOC_records(not in whole data).csv', row.names = FALSE)





Newanti =Newanti [!duplicated(Newanti$temp), ]

getwd()




write.csv(mergedData,"C:/Users/Maria.DESKTOP-PH359AS/Desktop/Maria/IGM_WEBOC_V3.csv", row.names = FALSE)

NewSem=semi_join(x = IGM, y = WEBOC, by = "temp", copy = FALSE)
View(NewSem)


write.csv(NewSem,"C:/Users/Maria.DESKTOP-PH359AS/Desktop/Maria/IGM_WEBOC_BLWEIGHT.csv", row.names = FALSE)


write.csv(IGM,"C:/Users/Maria.DESKTOP-PH359AS/Desktop/Maria/IGM_BLWEIGHT.csv", row.names = FALSE)
write.csv(WEBOC,"C:/Users/Maria.DESKTOP-PH359AS/Desktop/Maria/WEBOC_BLWEIGHT.csv", row.names = FALSE)



NewSem=semi_join(x = IGM, y = WEBOC, by = "BL_No", copy = FALSE)
View(NewSem)

# check Columns
a=colnames(IGM)
b=colnames(WEBOC)
c=colnames(NewSem)
a
b
c


Newdata=merge(x= NewSem, y = WEBOC, by = "temp")

NewS=semi_join(x = IGM, y = Newdata, by = "temp", copy = FALSE)
View(NewS)


library(dplyr)
NewS=left_join(x = Newdata, y = WEBOC, by = "temp", copy = FALSE)
View(NewS)




NewS=semi_join(x = IGM,y = Newdata, by = "temp", copy = FALSE)
View(NewS)



jointdataset <- merge(ChickWeight, LabResults, by = 'Diet', all.x= TRUE)



View(NewSem)

NewSem$Importer_Name <- NA
NewSem$Importer_Address<- NA
NewSem$CITY<- NA
NewSem$Consignor_Name<- NA
NewSem$Shed<- NA
NewSem$IndexNo<- NA
NewSem$Index_Srl_No<- NA
NewSem$Item_Desc<- NA
NewSem$Quantity<- NA
NewSem$Packages<- NA
NewSem$Field17<- NA
NewSem$Vessel_Name<- NA
NewSem$Shipping_Line<- NA
NewSem$Departure_Port<- NA
NewSem$Arrival_Date<- NA
NewSem$IGM_Date<- NA


