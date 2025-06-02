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
```
