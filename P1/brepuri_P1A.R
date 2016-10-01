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

tweets_2016_02_22 <- searchTwitter("Elections OR President" ,n=200,lang="en",since="2016-02-22",until="2016-02-23")
tweets_2016_02_22.df<-twListToDF(tweets_2016_02_22)


tweets_2016_02_23 <- searchTwitter("Elections OR President" ,n=200,lang="en",since="2016-02-23",until="2016-02-24")
tweets_2016_02_23.df<-twListToDF(tweets_2016_02_23)


tweets_2016_02_24 <- searchTwitter("Elections OR President" ,n=200,lang="en",since="2016-02-24",until="2016-02-25")
tweets_2016_02_24.df<-twListToDF(tweets_2016_02_24)

tweets_2016_02_25 <- searchTwitter("Elections OR President" ,n=200,lang="en",since="2016-02-25",until="2016-02-26")
tweets_2016_02_25.df<-twListToDF(tweets_2016_02_25)


tweets_2016_02_26 <- searchTwitter("Elections OR President" ,n=200,lang="en",since="2016-02-26",until="2016-02-27")
tweets_2016_02_26.df<-twListToDF(tweets_2016_02_26)


tweets_2016_02_27 <- searchTwitter("Elections OR President" ,n=200,lang="en",since="2016-02-27",until="2016-02-28")
tweets_2016_02_27.df<-twListToDF(tweets_2016_02_27)

tweets_2016_02_28 <- searchTwitter("Elections OR President" ,n=200,lang="en",since="2016-02-28",until="2016-02-29")
tweets_2016_02_28.df<-twListToDF(tweets_2016_02_28)




