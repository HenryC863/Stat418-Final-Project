# 🌍 Predicting Life Expectancy From Country Demographic

## Project Overview

This project is the final assignment for STAT 418. It aims to predict **Life Expectancy at Birth** (`E0`) for various countries using publicly available demographic indicators. The model is both practical and straightforward, with real-world applications in population. It features an end-to-end pipeline: **data collection**, **model building**, **exploratory analysis**, and **interactive deployment** via a web app and Flask API.

## Data Collection

The data was collected from the **U.S. Census Bureau International Data Base (IDB)** using their public API:

**URL**: [https://www.census.gov/data-tools/demo/idb](https://www.census.gov/data-tools/demo/idb)


### The dataset includes the following variables for 2024:
- `POP`: Total Population
- `GR`: Annual Growth Rate
- `RNI`: Rate of Natural Increase
- `POP_DENS`: Population Density
- `TFR`: Total Fertility Rate
- `CBR`: Crude Birth Rate
- `IMR`: Infant Mortality Rate
- `CDR`: Crude Death Rate
- `E0`: Life Expectancy at Birth (Target Variable)

Raw JSON responses were processed and converted into a clean tabular dataset using R.

## Exploratory Data Analysis (EDA)






## Model
This project uses a Multiple Linear Regression Model to predict Life Expectancy based on a set of demographic indicators. The features included in the model are: Population, Growth Rate, Natural Increase, Population Density, Fertility Rate, Birth Rate, Infant Mortality Rate, Death Rate, and Net Migration Rate. The complete implementation, including data preprocessing, model training, and prediction logic, can be found in the script named























# Flask API
```
curl -X POST https://final-project-flask-app-693104809772.us-central1.run.app/predict_price \
  -H "Content-Type: application/json" \
  -d '{
    "Population": 1000000,
    "Annual Growth Rate": 1.2,
    "Population Density": 500,
    "Total Fertility Rate": 2.3,
    "Infant Mortality Rate": 20,
    "Crude Death Rate": 8
}'

{"predicted life expectancy":74.78086113064549}
```
