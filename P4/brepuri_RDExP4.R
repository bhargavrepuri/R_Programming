install.packages("twitteR")
install.packages("RCurl")
install.packages("RJSONIO")
install.packages("stringr")
library(twitteR)
library(RCurl)
library(RJSONIO)
library(stringr)
api_key<- "PEq8peUwr4WnjtoMHIg2GRyai"
api_secret<-"agh6SAnCfJvuMklgvmYwXEfGBji0YW0VQQ39mWQmy1CIM71EQd"
token<-"2955046226-AyZfdWu2DeNZ2uhEfEdVLITZ8uBSLR8wwayEAIR"
token_secret<-"i30fmlxIpyL7eH69Fhffef1f9rZWhT6mWf7ebGxH8HGot"
setup_twitter_oauth(api_key,api_secret,token,token_secret)

#Rentals

tweets_Rentals_1 <- searchTwitter("Apartment Rentals OR Rentals" ,n = 1000,lang="en",since="2016-03-07",until="2016-03-08")
tweets_Rentals_1<-twListToDF(tweets_Rentals_1)
tweets_Rentals_1$day = "March 7th 2016"
tweets_total_Rentals = tweets_Rentals_1

tweets_Rentals_2 <- searchTwitter("Apartment Rentals OR Rentals" ,n = 1000,lang="en",since="2016-03-08",until="2016-03-09")
tweets_Rentals_2<-twListToDF(tweets_Rentals_2)
tweets_Rentals_2$day = "March 8th 2016"
tweets_total_Rentals = rbind(tweets_total_Rentals,tweets_Rentals_2)

tweets_Rentals_3 <- searchTwitter("Apartment Rentals OR Rentals" ,n = 1000,lang="en",since="2016-03-09",until="2016-03-10")
tweets_Rentals_3<-twListToDF(tweets_Rentals_3)
tweets_Rentals_3$day = "March 9th 2016"
tweets_total_Rentals = rbind(tweets_total_Rentals,tweets_Rentals_3)

tweets_Rentals_4 <- searchTwitter("Apartment Rentals OR Rentals" ,n = 1000,lang="en",since="2016-03-10",until="2016-03-11")
tweets_Rentals_4<-twListToDF(tweets_Rentals_4)
tweets_Rentals_4$day = "March 10th 2016"
tweets_total_Rentals = rbind(tweets_total_Rentals,tweets_Rentals_4)

tweets_Rentals_5 <- searchTwitter("Apartment Rentals OR Rentals" ,n = 1000,lang="en",since="2016-03-11",until="2016-03-12")
tweets_Rentals_5<-twListToDF(tweets_Rentals_5)
tweets_Rentals_5$day = "March 11th 2016"
tweets_total_Rentals = rbind(tweets_total_Rentals,tweets_Rentals_5)

tweets_Rentals_6 <- searchTwitter("Apartment Rentals OR Rentals" ,n = 1000,lang="en",since="2016-03-12",until="2016-03-13")
tweets_Rentals_6<-twListToDF(tweets_Rentals_6)
tweets_Rentals_6$day = "March 12th 2016"
tweets_total_Rentals = rbind(tweets_total_Rentals,tweets_Rentals_6)

tweets_Rentals_7 <- searchTwitter("Apartment Rentals OR Rentals" ,n = 1000,lang="en",since="2016-03-13",until="2016-03-14")
tweets_Rentals_7<-twListToDF(tweets_Rentals_7)
tweets_Rentals_7$day = "March 13th 2016"
tweets_total_Rentals = rbind(tweets_total_Rentals,tweets_Rentals_7)

#Apartment Listings for Buying

tweets_listings_1 <- searchTwitter("Apartment listings OR Buying House OR realestate OR #listing" ,n = 1000,lang="en",since="2016-03-07",until="2016-03-08")
tweets_listings_1<-twListToDF(tweets_listings_1)
tweets_listings_1$day = "March 7th 2016"
tweets_total_listings = tweets_listings_1

tweets_listings_2 <- searchTwitter("Apartment listings OR Buying House OR realestate OR #listing" ,n = 1000,lang="en",since="2016-03-08",until="2016-03-09")
tweets_listings_2<-twListToDF(tweets_listings_2)
tweets_listings_2$day = "March 8th 2016"
tweets_total_listings = rbind(tweets_total_listings,tweets_listings_2)


tweets_listings_3 <- searchTwitter("Apartment listings OR Buying House OR realestate OR #listing" ,n = 1000,lang="en",since="2016-03-09",until="2016-03-10")
tweets_listings_3<-twListToDF(tweets_listings_3)
tweets_listings_3$day = "March 9th 2016"
tweets_total_listings = rbind(tweets_total_listings,tweets_listings_3)



tweets_listings_4 <- searchTwitter("Apartment listings OR Buying House OR realestate OR #listing" ,n = 1000,lang="en",since="2016-03-10",until="2016-03-11")
tweets_listings_4<-twListToDF(tweets_listings_4)
tweets_listings_4$day = "March 10th 2016"
tweets_total_listings = rbind(tweets_total_listings,tweets_listings_4)




tweets_listings_5 <- searchTwitter("Apartment listings OR Buying House OR realestate OR #listing" ,n = 1000,lang="en",since="2016-03-11",until="2016-03-12")
tweets_listings_5<-twListToDF(tweets_listings_5)
tweets_listings_5$day = "March 11th 2016"
tweets_total_listings = rbind(tweets_total_listings,tweets_listings_5)


tweets_listings_6 <- searchTwitter("Apartment litings OR Buying House OR realestate OR #listing" ,n = 1000,lang="en",since="2016-03-12",until="2016-03-13")
tweets_listings_6<-twListToDF(tweets_listings_6)
tweets_listings_6$day = "March 12th 2016"
tweets_total_listings = rbind(tweets_total_listings,tweets_listings_6)



tweets_listings_7 <- searchTwitter("Apartment listings OR Buying House OR realestate OR #listing" ,n = 1000,lang="en",since="2016-03-13",until="2016-03-14")
tweets_listings_7<-twListToDF(tweets_listings_7)
tweets_listings_7$day = "March 13th 2016"
tweets_total_listings = rbind(tweets_total_listings,tweets_listings_7)

tweets_total_listings$type <- "House Buying"
tweets_total_Rentals$type <- "House Renting"
tweets_total <- rbind(tweets_total_listings,tweets_total_Rentals)

#Statistical Analysis between Rentals and Listings

#plot between no of tweets ln each day for 7 days for each category
library(ggplot2)
ggplot(tweets_total, aes(x=day,fill=type,color = type)) + geom_bar(stat = "count") 

#Cleaning Data
tweets_total$favourites_c <- as.numeric(gsub("[^[:digit:]]","",tweets_total$favoriteCount))


#plot between favourites in each day for 7 days for each category
ggplot(subset(tweets_total,favourites_c>0), aes(x=favourites_c,fill=type,color = type)) + geom_bar(stat = "count") 

#plot between favourites in each day for 7 days for each category
ggplot(subset(tweets_total,retweetCount>0), aes(x=retweetCount,fill=type,color = type)) + geom_bar(stat = "count") 

#Sentiment Analysis

tweets1 <- searchTwitter("Apartment Rentals OR Rentals" ,n = 1000,lang="en",since="2016-03-07",until="2016-03-14")
tweets2 <- searchTwitter("Apartment listings OR Buying House OR realestate OR #listing" ,n = 1000,lang="en",since="2016-03-07",until="2016-03-14")

library(jsonlite)

sapply( unlist( tweets1 ) , function(x) length(`$`( x , "retweeted" ) ) > 0 )

sapply( unlist( tweets2 ) , function(x) length(`$`( x , "retweeted" ) ) > 0 )

tweets1.text = lapply(tweets1,function(t)t$getText()) #Get text value of tweets

tweets2.text = lapply(tweets2,function(t)t$getText()) #Get text value of tweets

#setting up working directory 
setwd("/home/DIC/P4")
#get negative words from GITHUB
negWord = scan("negative-words.txt", what='character', comment.char=';')
#get positive words from GITHUB 
posWord = scan("positive-words.txt", what='character', comment.char=';') 

#used some code from http://thinktostart.com/sentiment-analysis-on-twitter/ 
score.sentiment = function(sentences, pos.words, neg.words, .progress='none')
{
  require(plyr)
  require(stringr)
  
  scores = laply(sentences, function(sentence, pos.words, neg.words) {
    sentence = gsub('[[:punct:]]', '', sentence)
    sentence = gsub('[[:cntrl:]]', '', sentence)
    sentence = gsub('\\d+', '', sentence)
    sentence = tolower(sentence)
    word.list = str_split(sentence, '\\s+')
    words = unlist(word.list)
    pos.matches = match(words, pos.words)
    neg.matches = match(words, neg.words)
    pos.matches = !is.na(pos.matches)
    neg.matches = !is.na(neg.matches)
    score = sum(pos.matches) - sum(neg.matches)
    return(score)
  }, pos.words, neg.words, .progress=.progress )
  
  scores.df = data.frame(score=scores, text=sentences)
  return(scores.df)
} 
analysis = score.sentiment(tweets1.text, posWord, negWord)
hist(analysis$score)
ggplot(analysis,aes(analysis$score)) + geom_histogram(binwidth = 1)












