ARG BUILD_FROM
FROM ${BUILD_FROM}

RUN npm install -g @grinev/opencode-telegram-bot

COPY run.sh /
RUN chmod +x /run.sh

CMD ["/run.sh"]
