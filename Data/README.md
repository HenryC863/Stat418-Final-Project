This folder contains the datasets and code used for **data extraction**, **cleaning**, and **exploratory data analysis (EDA)** for the project.
### `cleaned_data.csv`
- A cleaned and processed dataset extracted from the **U.S. Census Bureau International Data Base** for the year **2024**.
- Includes over 220 countries and territories.

### `code_webscraping_eda.Rmd`
- R Markdown file with:
  - Code to access the public API  
  - Data cleaning and transformation steps  
  - Visualizations and correlation analysis  
  - Summary statistics used in the exploratory phase

The dataset was accessed and processed via **API calls** and transformed from JSON to a tabular format. This data was used in the modeling and app deployment stages found in other parts of the project.
