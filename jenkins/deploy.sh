#!/bin/bash

APP_NAME="my-node-app"
IMAGE_NAME="my-node-app-image"
CONTAINER_NAME="my-node-app-container"
PORT=3000

echo "🔄 Stopping existing container (if any)..."
docker stop $CONTAINER_NAME 2>/dev/null || true
docker rm $CONTAINER_NAME 2>/dev/null || true

echo "🐳 Building Docker image..."
docker build -t $IMAGE_NAME .

echo "🚀 Running new container..."
docker run -d \
  --name $CONTAINER_NAME \
  -p $PORT:3000 \
  --env-file .env \
  $IMAGE_NAME

echo "✅ Deployment complete. App running on port $PORT."


