# ベースイメージとして Ubuntu を使用
FROM ubuntu:22.04

# 必要な依存関係をインストール
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    fonts-liberation \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libgbm-dev \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libxss1 \
    libxtst6 \
    fonts-noto-color-emoji \
    libdrm2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnotify4 \
    libnss3 \
    libx11-6 \
    libxext6 \
    libxfixes3 \
    libxrender1 \
    libxi6 \
    libasound2 \
    libwayland-client0 \
    libwayland-egl1 \
    libwayland-server0 \
    libappindicator3-1 \
    libxkbcommon0 \
    libcurl4 \
    xdg-utils \
    xvfb \
    wget \
    && apt-get clean

# Node.js と npm をインストール
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@latest

# Playwright をインストール
RUN npm install playwright

# 作業ディレクトリを設定
WORKDIR /app

# package.json をコピーして依存関係をインストール
COPY package.json .

RUN npm install

# スクリプトファイルをコピー
COPY take_screenshot.js .

# Playwright で必要なブラウザバイナリをインストール
RUN npx playwright install --with-deps

# スクリプトを実行
CMD ["npm", "run", "dev"]

