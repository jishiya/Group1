FROM --platform=linux/amd64 node:16.17.0-alpine3.16 as build
WORKDIR /app
COPY package.json .
COPY yarn.lock .
RUN yarn install
COPY . .
RUN yarn build 


FROM --platform=linux/amd64 node:16.17.0-alpine3.16
copy --from=build /app /
EXPOSE 3000
CMD ["yarn", "start"]