#deploy to shinyapps.io
#first you will need an account

install.packages("rsconnect")
library(rsconnect)

rsconnect::setAccountInfo(name='gaohongc',
                          token='<hide>',
                          secret='<SECRET>')

library(rsconnect)
rsconnect::deployApp(appDir =  "~/Desktop/stat_418/project/shinyapp", 
                     appName = "life_expectancy")

#this is now running at
#https://nlangholz.shinyapps.io/clusters/


