library("plyr")
library("doBy")
library(ggplot2)

daysName <- c('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday')

for(i in 1:31)
{
  path = paste(paste("http://stat.columbia.edu/~rachel/datasets/nyt",i,sep=""),".csv",sep="")
  sdataframe = read.csv(path)
  sdataframe$day <- i
  sdataframe$dayofweek<-daysName[i%%7+1]
  sdataframe$weekday <- paste('2012','05',sdataframe$day, sep = '-')
  if(i==1)
  {
    dataframe <- sdataframe
  }
  else
  {
    dataframe = rbind(dataframe,sdataframe)
  }
  
}

summary(dataframe)
dataframe$agecat <-cut(dataframe$Age,c(-Inf,0,18,24,34,44,54,64,Inf))

siterange <- function(x){c(length(x), min(x), mean(x), max(x))}
summaryBy(Age~agecat, data =dataframe, FUN=siterange)
summaryBy(Gender+Signed_In+Impressions+Clicks~agecat,data =dataframe)

#impressionscount
ggplot(dataframe, aes(x=Impressions, fill=dayofweek))+geom_histogram(binwidth=1)
#impressionsboxplot
ggplot(dataframe, aes(x=dayofweek, y=Impressions, fill=dayofweek))+geom_boxplot()

dataframe$hasimps <-cut(dataframe$Impressions,c(-Inf,0,Inf))
summaryBy(Clicks~hasimps, data =dataframe, FUN=siterange)

#clicksimp_ratio_density
ggplot(subset(dataframe, Impressions>0), aes(x=Clicks/Impressions,colour=dayofweek)) + geom_density()
#clicksimp_density_clicks>0
ggplot(subset(dataframe, Clicks>0), aes(x=Clicks/Impressions,colour=dayofweek)) + geom_density()
#clicksvsdaypoint
ggplot(subset(dataframe, Clicks>0), aes(x=dayofweek, y=Clicks,fill=dayofweek)) + geom_boxplot()
#density_clicks
ggplot(subset(dataframe, Clicks>0), aes(x=Clicks, colour=dayofweek))+ geom_density()

dataframe$scode[dataframe$Impressions==0] <- "NoImps"
dataframe$scode[dataframe$Impressions >0] <- "Imps"
dataframe$scode[dataframe$Clicks >0] <- "Clicks"
dataframe$scode <- factor(dataframe$scode)

dataframe$Sign[dataframe$Signed_In==1] <- "Logged In"
dataframe$Sign[dataframe$Signed_In==0] <- "Not Logged In"

dataframe$Adult[dataframe$Age>=18 & dataframe$Signed_In==1] <- "Adult"
dataframe$Adult[dataframe$Age<18 & dataframe$Signed_In==1] <- "Not Adult"

dataframe$GenderVerb[dataframe$Gender==0 & dataframe$Signed_In==1] <- "Female"
dataframe$GenderVerb[dataframe$Gender==1 & dataframe$Signed_In==1] <- "Male"

logged_data <- subset(dataframe,dataframe$Signed_In==1)

#Signed In Vs Not SignedIn
ggplot(subset(dataframe, Clicks>0), aes(x=day,fill=Sign,color = Sign)) + geom_bar(stat = "count") 

#Female Vs Male (All Users)
ggplot(subset(logged_data, Clicks>0), aes(x=day,fill=GenderVerb,color = GenderVerb)) + geom_bar(stat = "count") 

#Female Vs Male (Adults vs Not Adults)

ggplot(subset(logged_data, Clicks>0), aes(x=day,fill=Adult,color = Adult)) + geom_bar(stat = "count") 

#No of Clicks 

ggplot(subset(dataframe), aes(x=day,y = Clicks)) + geom_bar(stat = "identity") 

#No of Impressions 

ggplot(subset(dataframe), aes(x=day,y = Impressions)) + geom_bar(stat = "identity") 

#Ctr

ggplot(subset(dataframe), aes(x=day,y = Clicks/Impressions)) + geom_bar(stat = "identity") 




clen <- function(x){c(length(x))}
etable<-summaryBy(Impressions~scode+Gender+dayofweek,data = dataframe, FUN=clen)
