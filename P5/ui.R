library(shiny)

shinyUI(fluidPage(
  titlePanel("Twitter Analysis"),
  sidebarLayout(
    sidebarPanel(
      helpText("Select the query term for Analysis of real time tweets"),
      
      textInput("q", "Search", "Hillary"),
      br(),
      actionButton("streambutton", "Stream") , br(),br()
    ),
    mainPanel(
      tabsetPanel(type = "tab",
                  tabPanel("Analysis of Streamed Tweets", 
                           plotOutput("plotstream")) 
      )
    )
  )
))