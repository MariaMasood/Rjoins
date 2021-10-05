
#x=grep("^MUHAMMAD", MyData[15], value = TRUE)

#x=regexpr("^MUHAMMAD & CO", MyData$Consignee)
#install.packages("qdapRegex","stringi")

library(qdapRegex)
library(stringi)
x=stri_extract_first_regex(MyData[15], "[a-zA-Z]\\[a-zA-Z]\\")
