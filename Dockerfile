FROM node:20-bookworm-slim

# Install ffmpeg + basic utilities
RUN apt-get update && \
    apt-get install -y ffmpeg tini && \
    rm -rf /var/lib/apt/lists/*

# Install n8n globally
RUN npm install -g n8n@2.6.4

# Create n8n user
RUN useradd -m node
USER node
WORKDIR /home/node

EXPOSE 5678

ENTRYPOINT ["tini", "--"]
CMD ["n8n"]
