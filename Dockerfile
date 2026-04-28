# Dockerfile

# Use the official Node.js 18 image as a base
FROM node:18

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json into the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application files into the container
COPY . .

# Expose port 3000 (or whatever port your app runs on)
EXPOSE 3000

# Command to run the application
CMD [ "node", "index.js" ]