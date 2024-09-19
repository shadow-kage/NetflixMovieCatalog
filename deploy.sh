#!/bin/bash

# Navigate to the app directory
cd ~/app

# Check if virtual environment exists, if not, create it
if [ ! -d "venv" ]; then
    echo "Creating Python virtual environment..."
    python3 -m venv venv
fi

# Activate the virtual environment
source venv/bin/activate

# Install dependencies from requirements.txt
if [ -f "requirements.txt" ]; then
    echo "Installing dependencies..."
    pip install -r requirements.txt
else
    echo "No requirements.txt found. Skipping dependencies installation."
fi

# Stop any running app processes (optional)
# If the app is running on port 8080, kill it first
echo "Stopping the running app on port 8080 (if any)..."
sudo fuser -k 8080/tcp || true  # Ignore errors if nothing is running

# Start the app on port 8080
echo "Starting the app..."
python3 app.py

echo "App deployment complete!"
