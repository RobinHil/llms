#!/bin/bash

# Install curl for healthcheck
apt-get update && apt-get install -y curl

# Start Ollama in the background.
/bin/ollama serve &
# Record Process ID.
pid=$!

# Pause for Ollama to start.
sleep 5

# Pull default models
echo "🔵 Retrieve Mistral model..."
if ! ollama pull mistral; then
    echo "🔴 Error while retrieving Mistral model"
    exit 1
fi

echo "🔵 Retrieve Nomic embedding model..."
if ! ollama pull nomic-embed-text; then
    echo "🔴 Error while retrieving Nomic embedding model"
    exit 1
fi

if [ $? -eq 0 ]; then
    echo "🟢 Done!"
else
    echo "🔴 An error occurred while retrieving models"
    exit 1
fi

# Wait for Ollama process to finish.
wait $pid