library(readr)
WEBOC_V3 <- read_csv("C:/Users/Maria.DESKTOP-PH359AS/Desktop/WEBOC_V3.csv")
View(WEBOC_V3)


IGM_v3 <- read_csv("C:/Users/Maria.DESKTOP-PH359AS/Desktop/IGM_v3.csv")
View(IGM_v3)




WEBOC_V3 <- transform(WEBOC_V3,  as.Date(as.character(WEBOC_V3$BL_Date), "%Y-%m-%d"))



colnames(IGM_v3)[17] <- "BL_No"
colnames(IGM_v3)[18] <- "BL_Date"
colnames(IGM_v3)[8] <- "Weight"
colnames(IGM_v3)[3] <- "Index_No"



IGM_v3$BL_No=gsub("[[:space:]]",'',IGM_v3$BL_No)
WEBOC_V3$BL_No=gsub("[[:space:]]", "", WEBOC_V3$BL_No)

IGM_v3$BL_No=gsub('[[:punct:] ]+','',IGM_v3$BL_No)
WEBOC_V3$BL_No=gsub('[[:punct:] ]+', "", WEBOC_V3$BL_No)


IGM_v3 <- data.frame(x=IGM_v3, y=as.factor(LETTERS))
temp= paste0(IGM_v3$BL_No, IGM_v3$Weight)

IGM_v3 = cbind(IGM_v3, temp)


df <- data.frame(x=WEBOC_V3, y=as.factor(LETTERS))
temp2= paste0(WEBOC_V3$BL_No, WEBOC_V3$Weight)

WEBOC_V3 = cbind(WEBOC_V3, temp2)


colnames(IGM_v3) <- c("keyid")

IGM_v3$Consignee=gsub("(H NO).*", "", IGM_v3$Consignee)
IGM_v3$Consignee=gsub("(FLOOR).*", "", IGM_v3$Consignee)
IGM_v3$Consignee=gsub("(BLOCK).*", "", IGM_v3$Consignee)

IGM_v3$temp

colnames(WEBOC_V3)[23] <- "temp"


Newda=merge(x = IGM_v3, y = WEBOC_V3, by = "BL_No")
View(Newda)

Newdata=merge(x = IGM_v3, y = WEBOC_V3, by = "temp")
View(Newdata)

Newdat=merge(x = IGM_v3, y = WEBOC_V3, by = "BL_No", "Weight")
View(Newdat)

common <- intersect(IGM_v3$BL_No, WEBOC_V3$BL_No)  
WEBOC_V3[common,] 


Newda$BL_Date.x <- as.Date(Newda$BL_Date.x, "%d-%m-%Y")

#install.packages("tidyverse")

library(tidyverse)
Newdata %>% select("temp","BL_No","IGM.x", "ID","Index.No","Goods.Description", "Goods","Port.Of.Shipment","Portfrom",
                   "Gross.Weight.MTons", "PACKAGES.No", "UNITS","Containers","CntrQty","CntrSize" ,
                   "Consignee.x","Consignor.Name","BL_Date.x","Index.Type","Commodity","City", "Monthof",
                   "Yearof"  , "Importer_Address","CITY", "Consignor_Name" , "Weight",
                   "Shed" ,"Shipping_Line" ,"Departure_Port","Quantity" ,"Vessel_Name", "Arrival_Date", "Unit_1"            
)

write.csv(Newda,"C:/Users/Maria.DESKTOP-PH359AS/Desktop/IGM_WEBOC_V4.csv", row.names = FALSE)

Mydata=unique(Newdata)


write.csv(Newdata,"C:/Users/Maria.DESKTOP-PH359AS/Desktop/IGM_WEBOC_V5temp.csv", row.names = FALSE)


d=as.data.frame(Newda$BL_No)

d=type.convert(d, as.is = TRUE)

sapply(Newda$Consignee, mode)


newD =data.frame(Newda$BL_Date.x)
View(newD)

c=colnames(Newda)

x <- c("banana","republic")
sub(".(.)$","\\1",x)

test <- c('.name.1.','name.2','.name.3.')
gsub('^\\.|\\.$', '', x)


Newda=as.data.frame(table(Newda))
View(Newda)


IGM_v3$BL_Date
WEBOC_V3$BL_Date



Newdata=merge(x = IGM_v3, y = WEBOC_V3, by = "BL_No", "Weight")
View(Newdata)

WEBOC_V3 <- transform(WEBOC_V3, as.Date(as.character(WEBOC_V3$BL_Date), "%Y%m%d"))

WEBOC_V3$BL_Date <- data.frame(lapply(WEBOC_V3$BL_Date, function(x) as.Date(as.character(x), "%Y%m%d")))


WEBOC_V3$BL_Date <- lapply(WEBOC_V3$BL_Date , function(x) as.Date(as.character(x), "%Y%m%d"))

WEBOC_V3 = cbind(WEBOC_V3, temp2)

View(y)

cbind.data.frame()

MyData$Consignee <- trim.trailing(MyData$Consignee)






y <-  as.Date(Newda$BL_Date.y, origin = "2020-01-30")
y <- as.Date(Newda$BL_Date.y, "%Y-%m-%d")
newD =data.frame(Newda$BL_Date.x)
View(Newda)


Newda$BL_Date.x <- as.Date(Newda$BL_Date.x, "%d-%m-%Y")
newD =data.frame(Newda$BL_Date.x)
View(newD)




install.packages("lubridate")
library(lubridate)
newD <- lubridate::ymd(as.character(newD))




a=data.frame(a)
View(a)

#("IGM", "Index_No","BL_No","BL_Date" ,"Consignee" , "Importer_Address", "CITY", "Consignor_Name",
#"Weight", "Shed","Item_Desc","Quantity","Unit_1","Packages",  "Vessel_Name","Shipping_Line",
#"Departure_Port","Arrival_Date", "IGM_Date"  ) "     

#("IGM","Index.No","Bill.Of.Lading.No","Bill.Of.Lading.Date", "Consignee","Importer.Name","City" ,"Consignor.Name",
#"Gross.Weight.MTons", ,"Goods.Description","UNITS","PACKAGES.No"
#,"Port.Of.Shipment","Portfrom","Monthof")

