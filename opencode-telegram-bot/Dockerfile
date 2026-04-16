FROM node:20-slim

ENV NPM_CONFIG_LOGLEVEL=warn

RUN npm install -g @grinev/opencode-telegram-bot

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
