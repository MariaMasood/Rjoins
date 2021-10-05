library(readr)
WEBOC_V3 <- read_csv("C:/Users/MICTDATASCIE01/Desktop/WEBOC_V3.csv")
View(WEBOC_V3)

IGM_v3 <- read_csv("C:/Users/MICTDATASCIE01/Desktop/IGM_v3.csv")
View(IGM_v3)


colnames(IGM_v3)[17] <- "BL_No"
colnames(IGM_v3)[18] <- "BL_Date"

a=colnames(IGM_v3)
b=colnames(WEBOC_V3)
a
b


IGM_v3$Consignee=gsub("(H NO).*", "", IGM_v3$Consignee)
IGM_v3$Consignee=gsub("(FLOOR).*", "", IGM_v3$Consignee)
IGM_v3$Consignee=gsub("(BLOCK).*", "", IGM_v3$Consignee)


IGM_v3$BL_No=gsub("[[:space:]]",'',IGM_v3$BL_No)
WEBOC_V3$BL_No=gsub("[[:space:]]", "", WEBOC_V3$BL_No)

IGM_v3$BL_No=gsub('[[:punct:] ]+','',IGM_v3$BL_No)
WEBOC_V3$BL_No=gsub('[[:punct:] ]+', "", WEBOC_V3$BL_No)


Newda=merge(x = IGM_v3, y = WEBOC_V3, by = "BL_No")
View(Newda)

Newda$BL_Date.x <- as.Date(Newda$BL_Date.x, "%d-%m-%Y")

#install.packages("tidyverse")

library(tidyverse)
Newda %>% select("BL_No","IGM.x", "ID","Index.No","Goods.Description", "Goods","Port.Of.Shipment","Portfrom",
                   "Gross.Weight.MTons", "PACKAGES.No", "UNITS","Containers","CntrQty","CntrSize" ,
                   "Consignee.x","Consignor.Name","BL_Date.x","Index.Type","Commodity","City", "Monthof",
                   "Yearof"  , "Importer_Address","CITY", "Consignor_Name" , "Weight",
                   "Shed" ,"Shipping_Line" ,"Departure_Port","Quantity" ,"Vessel_Name", "Arrival_Date", "Unit_1"            
)

write.csv(Newda,"C:/Users/MICTDATASCIE01/Desktop/IGM_WEBOC_V4.csv", row.names = FALSE)

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










Newd=merge(x = IGM_v3, y = WEBOC_V3, by = NULL)
View(Newd)

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

