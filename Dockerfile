# Use the official Node.js 14 image from Docker Hub
FROM node:18

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install the project dependencies
RUN npm install

# Copy the rest of your app's source code
COPY . .

# Expose port 5173 for the Vue app
EXPOSE 5173

## Run the application in development mode with hot-reloading enabled
CMD ["npm", "run", "dev"]