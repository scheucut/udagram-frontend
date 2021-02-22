FROM node:13-alpine as build
WORKDIR /app
COPY package*.json /app/
RUN npm install -g ionic
RUN npm install
COPY . .
#RUN npm run-script build:prod
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder ./www/ /usr/share/nginx/html/
EXPOSE 8100
# Define the Docker image's behavior at runtime
#COPY --from=build  /usr/src/app/www /usr/share/nginx/html
CMD ["ionnic", "serve","prod"]