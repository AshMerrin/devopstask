FROM node:18
WORKDIR /root/nodeapp
COPY package*.json ./
RUN npm install
COPY app.js ./
EXPOSE 3000
CMD ["node", "app.js"]
