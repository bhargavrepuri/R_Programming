install.packages(quantmod)
library(jsonlite)
library(ggplot2)
library(quantmod)
source("temp.R")

auth_bha()

stream_data<-data.frame()

file.remove("tweets_stream.json")
file.create("tweets_stream.json")


shinyServer(function(input, output) {
  streamTweets <- function(data, duration){
    observe({
      if(file.info("tweets_stream.json")$size != 0){
        stream_data <- parseTweets("tweets_stream.json", verbose = TRUE)
      }
      searchTerms <- strsplit(data , " ")
      load("bha_oauth.Rdata")
      filterStream("tweets_stream.json", track = searchTerms, timeout = duration, oauth = bha_oauth)
      output$plotstream <- renderPlot({ggplot(stream_data, aes(x=stream_data$created))+geom_bar() +theme(axis.text.x = element_text(angle = 90, hjust = 1))+ylab("Count of Tweets")+ xlab("Time Stamp")})
      invalidateLater(0,session = getDefaultReactiveDomain())
    })
  }
  
  dataInput <- observeEvent(input$streambutton,{
    streamTweets(input$q, 5)
  })

})

