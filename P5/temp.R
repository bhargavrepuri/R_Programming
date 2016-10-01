
library(streamR)
library(twitteR)
library(ROAuth)


auth_bha <- function(){
  if(!file.exists("bha_oauth.Rdata")){
    requestURL <- "https://api.twitter.com/oauth/request_token"
    accessURL <- "https://api.twitter.com/oauth/access_token"
    authURL <- "https://api.twitter.com/oauth/authorize"
    consumerKey <- "PEq8peUwr4WnjtoMHIg2GRyai"
    consumerSecret <- "agh6SAnCfJvuMklgvmYwXEfGBji0YW0VQQ39mWQmy1CIM71EQd"
    bha_oauth <- OAuthFactory$new(consumerKey = consumerKey, consumerSecret = consumerSecret, 
                                 requestURL = requestURL, accessURL = accessURL, authURL = authURL)
    bha_oauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
    save(bha_oauth, file = "bha_oauth.Rdata")
  }
  else{
    load("bha_oauth.Rdata")
  }
}