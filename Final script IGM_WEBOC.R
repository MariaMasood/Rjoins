#Load Data
library(readr)
WEBOC_V3 <- read_csv("C:/Users/Maria.DESKTOP-PH359AS/Desktop/WEBOC_V3.csv")
View(WEBOC_V3)

# Transform WEBOC Date
WEBOC_V3 <- transform(WEBOC_V3,  BL_Date = as.Date(as.character(WEBOC_V3$BL_Date), "%Y%m%d"))
WEBOC_V3 <- transform(WEBOC_V3,  Arrival_Date = as.Date(as.character(WEBOC_V3$Arrival_Date), "%Y%m%d"))
WEBOC_V3 <- transform(WEBOC_V3,  IGM_Date = as.Date(as.character(WEBOC_V3$IGM_Date), "%Y%m%d"))


library(readr)
IGM_WEBOC_V5 <- read_csv("C:/Users/Maria.DESKTOP-PH359AS/Desktop/IGM_WEBOC_V5.csv")
View(IGM_WEBOC_V5)



#Drop Redundant Column
drops <- c("Unit")
WEBOC_V3 <- WEBOC_V3[ , !(names(WEBOC_V3) %in% drops)]

#Remove Punctuation & Space
WEBOC_V3$BL_No=gsub("[[:space:]]", "", WEBOC_V3$BL_No)
WEBOC_V3$BL_No=gsub('[[:punct:] ]+', "", WEBOC_V3$BL_No)

# Rename WEBOC Column
colnames(WEBOC_V3)[16] <- "UNITS"


#Load Data
IGM_v3 <- read_csv("C:/Users/Maria.DESKTOP-PH359AS/Desktop/IGM_v3.csv")
View(IGM_v3)

# Rename IGM Column
colnames(IGM_v3)[17] <- "BL_No"
colnames(IGM_v3)[18] <- "BL_Date"
colnames(IGM_v3)[8] <- "Weight"
colnames(IGM_v3)[3] <- "Index_No"

# Transform IGM Date
IGM_v3$BL_Date <- as.Date(IGM_v3$BL_Date, "%d-%m-%Y")

#Remove Punctuation & Space
IGM_v3$BL_No=gsub("[[:space:]]",'',IGM_v3$BL_No)
IGM_v3$BL_No=gsub('[[:punct:] ]+','',IGM_v3$BL_No)

#Drop Redundant Column
drops <- c("Index.Type","City","Yearof","temp")
IGM_v3 <- IGM_v3[ , !(names(IGM_v3) %in% drops)]

#Final check Columns
a=colnames(IGM_v3)
b=colnames(WEBOC_V3)
a
b

#Join Data on behalf of BL_No
Newda=merge(x = IGM_v3, y = WEBOC_V3, by = "BL_No")
View(Newda)

#Join Data on behalf of BL_No+Weight string

temp= paste0(IGM_v3$BL_No, IGM_v3$Weight)
IGM_v3 = cbind(IGM_v3, temp)


temp2= paste0(WEBOC_V3$BL_No, WEBOC_V3$Weight)
WEBOC_V3 = cbind(WEBOC_V3, temp2)
colnames(WEBOC_V3)[21] <- "IGM_Date"
colnames(WEBOC_V3)[22] <- "temp"
View(WEBOC_V3)
View(IGM_v3)



Newdata=merge(x = IGM_v3, y = WEBOC_V3, by = "temp")
View(Newdata)

library(dplyr)
Newinn=inner_join(x = IGM_v3, y = WEBOC_V3, by = "temp", copy = FALSE)
View(Newinn)



Newanti=anti_join(x = IGM_v3, y = WEBOC_V3, by = "temp", copy = FALSE)
View(Newanti)


NewSem=semi_join(x = IGM_v3, y = WEBOC_V3, by = "temp", copy = FALSE)
View(NewSem)

b=Newdata [,c("Weight.x","Weight.y","Consignee.x","Consignee.y","BL_No.x","BL_No.y")]
View(b)



#remove Address consignee
IGM_v3$Consignee=gsub("(H NO).*", "", IGM_v3$Consignee)
IGM_v3$Consignee=gsub("(FLOOR).*", "", IGM_v3$Consignee)
IGM_v3$Consignee=gsub("(BLOCK).*", "", IGM_v3$Consignee)






drops <- c("BL_Date")
WEBOC_V3[ , !(names(WEBOC_V3) %in% drops)]






NewL=ljoin(x = IGM, y = WEBOC)

Newda=IGM %>%
  mutate(k = 1) %>%
  replicate(2, ., simplify=FALSE) %>%
  Reduce(function(IGM, WEBOC) inner_join(IGM, WEBOC, by="temp"), .) %>%
  select(-k)

Newda= cust_time

Newda=merge(x = IGM, y = WEBOC,by = NULL)
View(Newda)


Newdata=merge(x = IGM, y = WEBOC, by = "temp")
View(Newdata)


Newdata=merge(x = IGM, y = WEBOC, by = "temp", "BL_Date")
View(Newdata)
library(dplyr)
Newinn=inner_join(x = IGM, y = WEBOC, by = "temp", copy = FALSE)
View(Newinn)
Newanti=anti_join(x = IGM, y = WEBOC, by = "temp", copy = FALSE)
View(Newanti)

NEWLEFT=left_join(x = IGM, y = WEBOC, by = c("temp"= "temp"), all.x = F, all.y = F)
View(NEWLEFT)



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
