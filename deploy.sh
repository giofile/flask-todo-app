#!/bin/bash

# GitHub repository details
GITHUB_USER="giofile"
GITHUB_REPO="flask-todo-app"

# SSH Connection Details
SSH_USER="root"
SERVER_IP="64.225.64.147"
SSH_PORT="22"
PRIVATE_KEY_PATH="C:/Users/dongi/.ssh/id_rsa"

# Application Details
APP_DIR="/var/www/html"
APP_START_COMMAND="/var/www/html/venv/bin/gunicorn -w 4 -b 0.0.0.0:8000 app:app"

# Deployment Script
echo "Deploying Flask Application to Digital Ocean..."

# Clone the GitHub repository
git clone git@github.com:$GITHUB_USER/$GITHUB_REPO.git

# Change directory to your Flask app directory
cd "$APP_DIR"


# Activate the virtual environment
source /var/www/html/venv/bin/activate


# Pull the latest changes from the repository
git pull origin main

# Kill processes using port 8000
sudo fuser -k 8000/tcp || true

# Add a delay of 5 seconds
sleep 5

# Copy files to the server using SCP with private key
scp -i "$PRIVATE_KEY_PATH" -r $GITHUB_REPO/* "$SSH_USER"@"$SERVER_IP":"$APP_DIR"

# SSH into the server and execute application commands
ssh -p "$SSH_PORT" "$SSH_USER"@"$SERVER_IP" << EOF
  cd $APP_DIR
  source venv/bin/activate
  pip install -r requirements.txt
  $APP_START_COMMAND
  systemctl restart todoapp.service
EOF

echo "Deployment successful!"
