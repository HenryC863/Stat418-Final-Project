install.packages("rsconnect")
library(rsconnect)

rsconnect::setAccountInfo(name='gaohongc',
                          token='84271148830EF8DC87CFFEE57761EA25',
                          secret='liPB2B6BEPtDBAOBLShYxffAlGpZgQ/6oDsiSo0l')

library(rsconnect)
rsconnect::deployApp(appDir =  "~/Desktop/stat_418/project/shinyapp", 
                     appName = "life_expectancy")


