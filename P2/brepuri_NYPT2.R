data1 <- read.csv(url("http://stat.columbia.edu/~rachel/datasets/nyt1.csv"))

head(data1)
data1$agecat <-cut(data1$Age,c(-Inf,0,18,24,34,44,54,64,Inf))

summary(data1)

install.packages("doBy")
library("doBy")

siterange <- function(x){c(length(x), min(x), mean(x), max(x))}
summaryBy(Age~agecat, data =data1, FUN=siterange)

summaryBy(Gender+Signed_In+Impressions+Clicks~agecat,data =data1)
install.packages("ggplot2")
library(ggplot2)
ggplot(data1, aes(x=Impressions, fill=agecat))+geom_histogram(binwidth=1)
#impr1
ggplot(data1, aes(x=agecat, y=Impressions, fill=agecat))+geom_boxplot()
#impr2
ggplot(data1, aes(x=Impressions, fill=agecat))+geom_histogram()

data1$hasimps <-cut(data1$Impressions,c(-Inf,0,Inf))
summaryBy(Clicks~hasims, data =data1, FUN=siterange)
ggplot(subset(data1, Impressions>0), aes(x=Clicks/Impressions,colour=agecat)) + geom_density()
#ctr1
ggplot(subset(data1, Clicks>0), aes(x=Clicks/Impressions,colour=agecat)) + geom_density()
#ctr2
ggplot(subset(data1, Clicks>0), aes(x=agecat, y=Clicks/Impressions,fill=agecat)) + geom_boxplot()
#ctr3
ggplot(subset(data1, Clicks>0), aes(x=Clicks/Impressions,fill=agecat)) + geom_histogram()


ggplot(subset(data1, Clicks>0), aes(x=Clicks, colour=agecat))+ geom_density()

data1$scode[data1$Impressions==0] <- "NoImps"
data1$scode[data1$Impressions >0] <- "Imps"
data1$scode[data1$Clicks >0] <- "Clicks"

#Distribution of Users under 18 years

data1$Sign[data1$Signed_In==1] <- "Logged In"
data1$Sign[data1$Signed_In==0] <- "Not Logged In"

data1$Adult[data1$Age>=18 & data1$Signed_In==1] <- "Adult"
data1$Adult[data1$Age<18 & data1$Signed_In==1] <- "Not Adult"

data1$GenderVerb[data1$Gender==0 & data1$Signed_In==1] <- "Female"
data1$GenderVerb[data1$Gender==1 & data1$Signed_In==1] <- "Male"

logged_data <- subset(data1,data1$Signed_In==1)


#Signed In Vs Not SignedIn
ggplot(subset(data1, Clicks>0), aes(x=Sign,fill=agecat,color = agecat)) + geom_bar(stat = "count") 


#Female Vs Male (All Users)
ggplot(subset(data1, Clicks>0), aes(x=GenderVerb,fill=agecat,color = agecat)) + geom_bar(stat = "count") 

#Female Vs Male (Adults vs Not Adults)

ggplot(subset(logged_data, Clicks>0), aes(x=GenderVerb,fill=Adult,color = Adult)) + geom_bar(stat = "count") 


# No of Clicks vs day 
ggplot(subset(logged_data, Clicks>0), aes(x=day,fill=GenderVerb)) + geom_bar()+scale_y_continuous(trans= "log2",name="No of Users")

data1$scode <- factor(data1$scode)
head(data1)

clen <- function(x){c(length(x))}
etable<-summaryBy(Impressions~scode+Gender+agecat,data = data1, FUN=clen)
