# 🤖 Local / server LLMs API Deployment

This repository contains Docker Compose configurations for deploying local Large Language Models (LLMs) APIs using LocalAI and Ollama.

## 🌟 Features

- 🚀 Easy deployment with Docker Compose
- 🎮 GPU support with NVIDIA CUDA
- 🔄 Automatic model downloading
- 🏥 Built-in health checks
- 🔌 Isolated network configuration

## 📋 Prerequisites

- Docker and Docker Compose installed
- NVIDIA GPU with CUDA support
- NVIDIA Container Toolkit installed

## 🎯 Default Models

### LocalAI
- Mistral 7B Instruct v0.3
- All-MiniLM-L6-v2 (for embeddings)
- Meta Llama 3.1 70B Instruct

### Ollama
- Mistral
- Nomic Embed Text (for embeddings)

## 🚀 Getting Started

1. Clone this repository:
```bash
git clone https://github.com/RobinHil/llms.git
cd llms
```

2. Start the services:
```bash
docker compose -p [compose_alias] up -d
```

## 🔌 Service Endpoints

### LocalAI
- Port: 8080
- Health Check: `http://localhost:8080/readyz`
- Volume: `localai_models`
- Network: `localai_network`

### Ollama
- Port: 11434
- Health Check: `http://localhost:11434`
- Volume: `ollama_data`
- Network: `ollama_network`

## 🛠️ Configuration

Both services are configured with:
- Automatic GPU detection and utilization
- Persistent storage volumes
- Automatic model downloading on startup
- Health monitoring
- Automatic restart capability

## 🏗️ Project Structure

```
.
├── localai/
│   └── docker-compose.yml  # LocalAI configuration
├── ollama/
│   ├── docker-compose.yml  # Ollama configuration
│   └── entrypoint.sh       # Ollama startup script
├── LICENSE
└── README.md
```

## 🔍 Health Monitoring

Both services include health checks:
- LocalAI: Checks every 1 minute with a 20-minute timeout
- Ollama: Checks every 10 seconds with a 10-second timeout

## ⚡ Performance

For optimal performance, both services are configured to use all available NVIDIA GPUs through the NVIDIA Container Toolkit.
