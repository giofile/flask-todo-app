#!/bin/bash

# SSH Connection Details
SSH_USER="root"
SERVER_IP="64.225.64.147" 
SSH_PORT="22"

# Application Details
APP_DIR="/root/ToDoApp"
APP_START_COMMAND="gunicorn -w 4 -b 0.0.0.0:5000 app:app"

# Deployment Script
echo "Deploying Flask Application to Digital Ocean..."

# Copy files to the server using SCP
scp -r ToDoApp/* "$SSH_USER"@"$SERVER_IP":"$APP_DIR"

# SSH into the server, navigate to the app directory, and start the application
ssh -p "$SSH_PORT" "$SSH_USER"@"$SERVER_IP" "cd $APP_DIR && $APP_START_COMMAND"

echo "Deployment successful!"
