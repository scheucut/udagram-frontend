# Use NodeJS base image
FROM node:13

# Create app directory
WORKDIR /app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json /app/

# Install dependencies
RUN npm install

# Copy app source
COPY . .

RUN npm install -g @ionic/cli

RUN ionic build
# Bind the port that the image will run on
#FROM nginx:alpine
#RUN rm -rf /usr/share/nginx/html/*
EXPOSE 8100
# Define the Docker image's behavior at runtime
#COPY --from=build  /usr/src/app/www /usr/share/nginx/html
CMD ["ionnic", "serve","prod"]
