# Use an official Node.js runtime as a parent image
FROM node:20-slim

# Set working directory inside the container
WORKDIR /app

# Copy package files first to leverage Docker caching
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application
COPY . .

# Expose the application port
ENV PORT=7860
EXPOSE 7860

# Start the application
CMD ["node", "index.js"]
