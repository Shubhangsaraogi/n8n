FROM docker.io/n8nio/n8n:latest

USER root

# Install ffmpeg (Debian)
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    rm -rf /var/lib/apt/lists/*

USER node
