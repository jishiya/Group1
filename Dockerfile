FROM node:16.17.0-alpine3.16
WORKDIR /app
COPY package.json ./
COPY yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build 
EXPOSE 3000
CMD ["yarn", "start"]