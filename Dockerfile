FROM node:13-alpine as build

WORKDIR /src

COPY package*.json /src

RUN npm install -g ionic

RUN npm install

COPY ./ /src/

RUN npm run-script build

FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY --from=build /src/www/ /usr/share/nginx/html/