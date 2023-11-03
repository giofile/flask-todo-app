#!/bin/bash

# GitHub repository details
GITHUB_USER="giofile"
GITHUB_REPO="flask-todo-app"

# SSH Connection Details
SSH_USER="root"
SERVER_IP="64.225.64.147"
SSH_PORT="22"

# Application Details
APP_DIR="/var/www/html"
APP_START_COMMAND="/var/www/html/venv/bin/gunicorn -w 4 -b 0.0.0.0:5000 app:app"

# Deployment Script
echo "Deploying Flask Application to Digital Ocean..."

# Clone the GitHub repository
git clone git@github.com:$GITHUB_USER/$GITHUB_REPO.git

# Change directory to your Flask app directory
cd "$APP_DIR"

# Copy files to the server using SCP
scp -r $GITHUB_REPO/* "$SSH_USER"@"$SERVER_IP":"$APP_DIR"

# SSH into the server and execute application commands
ssh -p "$SSH_PORT" "$SSH_USER"@"$SERVER_IP" << EOF
  cd $APP_DIR
  source venv/bin/activate
  pip install -r requirements.txt
  $APP_START_COMMAND
  systemctl restart todoapp.service
EOF

echo "Deployment successful!"
