# Step 1: Use a base image with Node.js installed
FROM node:18-alpine as build

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy package.json and package-lock.json to the container
COPY package*.json ./

# Step 4: Install project dependencies
RUN npm install

# Step 5: Copy the rest of the application code into the container
COPY . .

# Step 6: Build the project
RUN npm run build

# Step 7: Use a smaller image to serve the build
FROM nginx:alpine

# Step 8: Copy the build from the previous stage to NGINX's default directory
COPY --from=build /app/dist /usr/share/nginx/html

# Step 9: Expose port 80 for the application
EXPOSE 80

# Step 10: Start NGINX to serve the built app
CMD ["nginx", "-g", "daemon off;"]
