FROM n8nio/n8n:latest

# Switch to root to install global npm packages
USER root

# Create a dedicated directory for global npm installs (avoids overwriting system paths)
RUN mkdir -p /home/node/.npm-global

# Configure npm to use this directory
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

# Add npm-global bin to PATH
ENV PATH=/home/node/.npm-global/bin:$PATH

# Install community nodes
RUN npm install -g @blotato/n8n-nodes-blotato

# Fix permissions
RUN chown -R node:node /home/node/.npm-global

# Switch back to the node user
USER node

# Start n8n
CMD ["n8n"]
