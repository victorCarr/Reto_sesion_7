# Reto sesio 07

install.packages("DBI")
install.packages("RMySQL")

library(DBI)
library(RMySQL)


MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

dbListTables(MyDataBase)

dbListFields(MyDataBase, 'CountryLanguage')

DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")

install.packages("dplyr")
library(dplyr)

lan.spa <-  DataDB %>% filter(Language == "Spanish")

install.packages("ggplot2")
library(ggplot2)

ggplot(data=lan.spa, aes(x=CountryCode, y=Percentage)) + 
  geom_bar(stat="identity", position="stack") +
  coord_flip()
