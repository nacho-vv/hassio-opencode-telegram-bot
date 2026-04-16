FROM ghcr.io/home-assistant/amd64-homeassistant:stable

RUN core-nginx-install nginx

ENV NPM_CONFIG_LOGLEVEL=warn

RUN npm install -g @grinev/opencode-telegram-bot

COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 8099

CMD ["/run.sh"]
