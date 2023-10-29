FROM node:18
WORKDIR /root/nodeapp
COPY /root/nodeapp/package.json ./
RUN npm install
COPY /root/nodeapp/app.js ./
EXPOSE 3000
CMD ["node", "app.js"]

