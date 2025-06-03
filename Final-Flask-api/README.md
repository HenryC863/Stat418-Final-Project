This folder contains the code and setup files for a **Flask API** that predicts life expectancy based on demographic data. The API was built using **Python**, containerized with **Docker**, and designed to be deployable via **Google Cloud Run**.

## Files Overview

| File | Description |
|------|-------------|
| `server.py` | Main Flask app that handles HTTP requests |
| `prediction.py` | Loads the trained regression model and processes predictions |
| `requirements.txt` | Lists Python dependencies (e.g. Flask, scikit-learn, pandas) |
| `Dockerfile` | Defines the Docker image used to build and run the API |
| `docker-compose.yml` | Optional setup for local testing and container orchestration |
