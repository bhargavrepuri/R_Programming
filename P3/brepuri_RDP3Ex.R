install.packages("gdata")
install.packages("plyr")
library(gdata)
library(plyr)
library("doBy")
library(ggplot2)

perl <- "/usr/bin/perl"
bk1 <- read.xls("/Users/apple/Downloads/doing_data_science-master/dds_datasets/dds_ch2_rollingsales/rollingsales_brooklyn.xls",perl=perl,pattern="BOROUGH")
bk1$city <- 'brooklyn'
bk2 <- read.xls("/Users/apple/Downloads/doing_data_science-master/dds_datasets/dds_ch2_rollingsales/rollingsales_bronx.xls",perl=perl,pattern="BOROUGH")
bk2$city <- 'bronx'
bk1 <- rbind(bk1,bk2)
bk3 <- read.xls("/Users/apple/Downloads/doing_data_science-master/dds_datasets/dds_ch2_rollingsales/rollingsales_manhattan.xls",perl=perl,pattern="BOROUGH")
bk3$city <- 'manhattan'
bk1 <- rbind(bk1,bk3)
bk4 <- read.xls("/Users/apple/Downloads/doing_data_science-master/dds_datasets/dds_ch2_rollingsales/rollingsales_queens.xls",perl=perl,pattern="BOROUGH")
bk4$city <- 'queens'
bk1 <- rbind(bk1,bk4)
bk5 <- read.xls("/Users/apple/Downloads/doing_data_science-master/dds_datasets/dds_ch2_rollingsales/rollingsales_statenisland.xls",perl=perl,pattern="BOROUGH")
bk5$city <- 'statenisland'
bk1 <- rbind(bk1,bk5)


bk1$SALE.PRICE.N <- as.numeric(gsub("[^[:digit:]]","",bk1$SALE.PRICE))
count(is.na(bk1$SALE.PRICE.N))
names(bk1) <- tolower(names(bk1))
bk1$gross.sqft <- as.numeric(gsub("[^[:digit:]]","",bk1$gross.square.feet))
bk1$land.sqft <- as.numeric(gsub("[^[:digit:]]","",bk1$land.square.feet))

bk1$sale.date <- as.Date(bk1$sale.date)
bk1$year.built <- as.numeric(as.character(bk1$year.built))
bk1$sale.year <- as.numeric(format(bk1$sale.date, "%Y"))

#City Vs Count
ggplot(bk1,aes(x=city))+ geom_bar(stat = "count")

#total no of sale over the years in different cities
ggplot(bk1, aes(x = sale.year,fill = city))+geom_histogram()+ylab("No of Houses Sold")+ xlab("Year Sold")

bk1_cost <- subset(bk1,bk1$gross.sqft>0 & sale.price.n >0)
bk1_cost$costpersqft <- (bk1_cost$sale.price.n/bk1_cost$gross.sqft)
# Cost Per Sqft Vs City
ggplot(bk1_cost, aes(x=city, y=costpersqft) )+ stat_summary(fun.y="mean", geom="bar") 



