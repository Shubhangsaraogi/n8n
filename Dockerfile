FROM docker.io/n8nio/n8n:latest

USER root

# Install ffmpeg
RUN apk add --no-cache ffmpeg

# Optional: verify installation
RUN ffmpeg -version

USER node
