# Use a node alpine image as the base image
FROM node:alpine

# Create app directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all files from the current directory to the container
COPY . .

# Build the app
RUN npm run build

# Install serve
RUN npm install -g serve

# Expose port 8083
EXPOSE 3000

# Serve the app
CMD ["serve", "-s", "dist"]
