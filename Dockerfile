# Use a base image
FROM nginx:latest

# Copy the HTML file to the appropriate location in the container
COPY index.html /usr/share/nginx/html

# Expose port 80 for web traffic
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
