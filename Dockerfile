FROM n8nio/n8n:latest

USER root
RUN npm install -g @blotato/n8n-nodes-blotato
USER node

CMD ["n8n"]
