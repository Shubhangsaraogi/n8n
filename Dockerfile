FROM n8nio/n8n:latest

# Switch to root to allow global installs
USER root

# Install community nodes
RUN npm_config_prefix=/home/node/.npm-global \
    npm install -g @blotato/n8n-nodes-blotato

# Ensure permissions
RUN chown -R node:node /home/node/.npm-global

# Switch back to node user
USER node

# Make sure global npm bin is in PATH
ENV PATH=/home/node/.npm-global/bin:$PATH

CMD ["n8n"]
