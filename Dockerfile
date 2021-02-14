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
COPY ./ /app/

RUN npm install -g ionic

RUN ionic build
# Bind the port that the image will run on
EXPOSE 8100
# Define the Docker image's behavior at runtime
CMD ["ionic", "serve"]
