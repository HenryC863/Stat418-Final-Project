This folder contains the **Shiny app** used to interact with the Flask API and display life expectancy predictions based on user-provided demographic data.

## Files

### `app.R`
- Main R script for the Shiny app interface.
- Allows users to enter inputs like:
  - Population
  - Growth Rate
  - Population Density
  - Fertility Rate
  - Infant Mortality Rate
  - Crude Death Rate
- Sends these inputs to the Flask API.
- Displays the predicted life expectancy in real time.

### `deploy-to-shinyapps.R`
- Deployment script to publish the app to **[shinyapps.io](https://www.shinyapps.io/)**.
- Includes authentication and deployment functions using the `rsconnect` package.


## Live App

You can try the app here:  
**[https://gaohongc.shinyapps.io/life_expectancy/](https://gaohongc.shinyapps.io/life_expectancy/)**


## How It Works

1. The user fills out the form with demographic information.
2. The app sends a `POST` request to the Flask API hosted on Google Cloud Run.
3. The API returns a life expectancy prediction.
4. The app displays the result instantly to the user.
