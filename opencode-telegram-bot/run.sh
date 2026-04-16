#!/bin/bash
set -e

CONFIG_PATH="/data/options.json"

TELEGRAM_BOT_TOKEN=$(jq -r '.telegram_bot_token // empty' "$CONFIG_PATH")
TELEGRAM_USER_ID=$(jq -r '.telegram_user_id // empty' "$CONFIG_PATH")
OPENCODE_API_URL=$(jq -r '.opencode_api_url // "http://192.168.1.141:4096"' "$CONFIG_PATH")
OPENCODE_MODEL_PROVIDER=$(jq -r '.opencode_model_provider // "opencode"' "$CONFIG_PATH")
OPENCODE_MODEL_ID=$(jq -r '.opencode_model_id // "big-pickle"' "$CONFIG_PATH")

if [ -z "$TELEGRAM_BOT_TOKEN" ] || [ -z "$TELEGRAM_USER_ID" ]; then
    echo "ERROR: telegram_bot_token and telegram_user_id are required"
    exit 1
fi

CONFIG_DIR="/config/opencode-telegram-bot"
mkdir -p "$CONFIG_DIR"

cat > "$CONFIG_DIR/.env" << ENVEOF
TELEGRAM_BOT_TOKEN=${TELEGRAM_BOT_TOKEN}
TELEGRAM_ALLOWED_USER_ID=${TELEGRAM_USER_ID}
OPENCODE_API_URL=${OPENCODE_API_URL}
OPENCODE_MODEL_PROVIDER=${OPENCODE_MODEL_PROVIDER}
OPENCODE_MODEL_ID=${OPENCODE_MODEL_ID}
LOG_LEVEL=info
ENVEOF

echo "Starting OpenCode Telegram Bot..."
echo "API URL: ${OPENCODE_API_URL}"

exec opencode-telegram start --config-dir "$CONFIG_DIR"
