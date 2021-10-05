install.packages("rvest")
install.packages("xml2")
install.packages("XML")
library(xml2)
library(rvest)
library(XML)
library(dplyr)
tbls <- read_html("http://o.fbr.gov.pk/newcu2/igm/igm.asp?view=ExternalLink?view=ExternalLink")

tbls %>%
  html_nodes("p") %>%
  html_text()

tbls %>% 
  html_children()

tbls %>%
  
  html_nodes("table") %>%
  
  .[[2]] %>%
  
  html_table(fill = deprecated(),
                     convert = TRUE)

tbls <- tbls %>%
  select(X1, X3)


library(rvest)
my_df <- as.data.frame(read_html(text) %>% html_table(fill=TRUE))

str(tbls)

ibar=readHTMLTable("http://o.fbr.gov.pk/newcu2/igm/igm.asp?view=ExternalLink?view=ExternalLink",which=6,skip.rows=1,trim=T,colClasses=c("integer","character",rep("numeric",13)))

typeof(df)


write.table(tbls,"C:/Users/MICTDATASCIE01/Desktop/tables.tsv",sep="\t")
