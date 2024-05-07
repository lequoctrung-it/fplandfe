# Use an official Node.js runtime as the base image
FROM node:18 as build-stage

# Set the working directory in the container to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY ../package*.json ./

# Install production dependencies.
RUN npm install

# Copy the current directory contents into the container at /app
COPY ../ .

# Build the app for production
RUN npm run build

# Start a new stage
FROM nginx:stable-alpine as production-stage

# Copy the custom nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the built app to nginx server root directory
COPY --from=build-stage ../app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]

# Run from root directory
# docker build -t fpland-frontend:prod -f docker/production.Dockerfile .