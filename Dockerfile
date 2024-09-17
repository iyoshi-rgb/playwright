FROM mcr.microsoft.com/playwright:v1.47.1-noble

WORKDIR /app

COPY package.json .

RUN npm install

COPY take_screenshot.js .

CMD ["node", "take_screenshot.js"]
