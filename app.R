library(shiny)
library(httr)
library(jsonlite)
library(bslib) 
library(fontawesome) 

# Your Flask API URL
api_url <- "https://final-project-flask-app-693104809772.us-central1.run.app/predict_price"


countries <- c(
  "Afghanistan", "Albania", "Algeria", "Angola", "Argentina", "Armenia", "Australia",
  "Austria", "Azerbaijan", "Bangladesh", "Belarus", "Belgium", "Benin", "Bolivia",
  "Bosnia and Herzegovina", "Botswana", "Brazil", "Bulgaria", "Burkina Faso", "Burundi",
  "Cambodia", "Cameroon", "Canada", "Central African Republic", "Chad", "Chile", "China",
  "Colombia", "Costa Rica", "Croatia", "Cuba", "Cyprus", "Czech Republic", "Denmark",
  "Dominican Republic", "DR Congo", "Ecuador", "Egypt", "El Salvador", "Estonia",
  "Ethiopia", "Finland", "France", "Gabon", "Gambia", "Georgia", "Germany", "Ghana",
  "Greece", "Guatemala", "Guinea", "Haiti", "Honduras", "Hungary", "Iceland", "India",
  "Indonesia", "Iran", "Iraq", "Ireland", "Israel", "Italy", "Ivory Coast", "Jamaica",
  "Japan", "Jordan", "Kazakhstan", "Kenya", "Kuwait", "Kyrgyzstan", "Laos", "Latvia",
  "Lebanon", "Lesotho", "Liberia", "Libya", "Lithuania", "Luxembourg", "Madagascar",
  "Malawi", "Malaysia", "Mali", "Mauritania", "Mexico", "Moldova", "Mongolia", "Morocco",
  "Mozambique", "Myanmar", "Namibia", "Nepal", "Netherlands", "New Zealand", "Nicaragua",
  "Niger", "Nigeria", "North Korea", "North Macedonia", "Norway", "Oman", "Pakistan",
  "Panama", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Qatar", "Romania",
  "Russia", "Rwanda", "Saudi Arabia", "Senegal", "Serbia", "Sierra Leone", "Singapore",
  "Slovakia", "Slovenia", "Somalia", "South Africa", "South Korea", "South Sudan", "Spain",
  "Sri Lanka", "Sudan", "Suriname", "Sweden", "Switzerland", "Syria", "Taiwan",
  "Tajikistan", "Tanzania", "Thailand", "Togo", "Trinidad and Tobago", "Tunisia", "Turkey",
  "Turkmenistan", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom",
  "United States", "Uruguay", "Uzbekistan", "Venezuela", "Vietnam", "Yemen", "Zambia",
  "Zimbabwe"
)

ui <- fluidPage(
  theme = bs_theme(version = 5, bootswatch = "flatly"),
  
  titlePanel(
    title = tagList(
      icon("chart-line"),
      "Predict Life Expectancy by Country"
    )
  ),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Enter demographic data below to estimate life expectancy."),
      helpText(tags$strong("Note:"), "Country selection is for reference only. Predictions are based on the input demographic values."),
      selectInput("country", "Select Country:", choices = countries),
      numericInput("population", "Population:", value = 1000000, min = 0),
      numericInput("growth", "Annual Growth Rate (%):", value = 1.2, step = 0.1),
      numericInput("density", "Population Density:", value = 500),
      numericInput("fertility", "Total Fertility Rate:", value = 2.3),
      numericInput("infant", "Infant Mortality Rate:", value = 20),
      numericInput("death", "Crude Death Rate:", value = 8),
      actionButton("predict", "Predict")
    ),
    
    mainPanel(
      h4("Predicted Life Expectancy:"),
      verbatimTextOutput("result"),
      tags$hr(),
      tags$em(icon("globe"), " Powered by Flask API hosted on Google Cloud Run")
    )
  )
)

server <- function(input, output) {
  observeEvent(input$predict, {
    # Construct request body
    body <- list(
      "Population" = input$population,
      "Annual Growth Rate" = input$growth,
      "Population Density" = input$density,
      "Total Fertility Rate" = input$fertility,
      "Infant Mortality Rate" = input$infant,
      "Crude Death Rate" = input$death
    )
    
    # Send POST request to the Flask API
    res <- tryCatch({
      POST(api_url,
           body = toJSON(body, auto_unbox = TRUE),
           encode = "json",
           content_type_json())
    }, error = function(e) NULL)
    
    # Process response
    if (!is.null(res) && status_code(res) == 200) {
      result <- content(res, as = "parsed")
      output$result <- renderText({
        paste(result[[1]], "years")
      })
    } else {
      output$result <- renderText("Error: Could not get a valid response from the API.")
    }
  })
}

shinyApp(ui = ui, server = server)
