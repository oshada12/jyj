FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install && npm install qrcode-terminal  && npm install xfarr-api && npm i pm2 -g && pm2 start index.js && pm2 save && pm2 log
COPY . .

EXPOSE 5000

CMD ["node", "index.js"]
