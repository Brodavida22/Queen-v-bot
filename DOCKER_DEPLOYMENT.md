# Docker Deployment Guide for WhatsApp Bot

## Table of Contents
1. [Build Instructions](#build-instructions)
2. [Docker Compose Usage](#docker-compose-usage)
3. [Environment Setup](#environment-setup)
4. [QR Code Authentication](#qr-code-authentication)
5. [Volume Management](#volume-management)
6. [Troubleshooting](#troubleshooting)
7. [Cloud Platform Deployment Examples](#cloud-platform-deployment-examples)

## Build Instructions
To build the Docker image for the WhatsApp bot, use the following command:
```bash
docker build -t whatsapp-bot .
```
Make sure you are in the directory where the `Dockerfile` is located.

## Docker Compose Usage
Create a `docker-compose.yml` file for easier management of services. Here’s an example:
```yaml
version: '3'
services:
  whatsapp-bot:
    image: whatsapp-bot
    build: .
    ports:
      - "3000:3000"
    volumes:
      - .:/app
    environment:
      - ENV_VAR_NAME=value
```
Run the following command to start:
```bash
docker-compose up
```

## Environment Setup
Ensure you have Docker and Docker Compose installed on your machine. Set the required environment variables in a `.env` file:
```
ENV_VAR_NAME=value
```
Don't forget to add necessary environment variables specific to your WhatsApp bot.

## QR Code Authentication
To authenticate the bot, a QR code will be generated. Monitor the logs in the console to see the QR code and scan it using your WhatsApp app.

## Volume Management
For persistent data, utilize Docker volumes. This is especially necessary for storing user sessions and logs. Modify your `docker-compose.yml` to include:
```yaml
    volumes:
      - whatsapp-data:/app/data

volumes:
  whatsapp-data:
```

## Troubleshooting
- **Container not starting**: Check the logs with `docker-compose logs`. Ensure that your environment variables are correctly set.
- **QR Code not appearing**: Make sure the WhatsApp connection is properly configured.

## Cloud Platform Deployment Examples
### Heroku
1. Create a new Heroku app:
   ```bash
   heroku create
   ```
2. Push your code to Heroku:
   ```bash
   git push heroku main
   ```
3. Scale the worker:
   ```bash
   heroku ps:scale worker=1
   ```

### Railway
1. Go to [Railway](https://railway.app/) and create a new project.
2. Connect your GitHub repository and deploy.

### DigitalOcean
1. Create a droplet with Docker.
2. SSH into your droplet and pull your Docker image:
   ```bash
   docker pull username/whatsapp-bot
   ```
3. Run the container:
   ```bash
   docker run -d -p 3000:3000 username/whatsapp-bot
   ```

### AWS
1. Go to the AWS Management Console.
2. Use ECS to create a new cluster and service. Make sure your Docker image is stored in ECR.
3. Define the task and run it.

## Conclusion
This guide covers the essential steps to deploy your WhatsApp bot using Docker across various platforms. For further assistance, refer to the documentation of each platform.