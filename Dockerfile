# Use a base image with Bash already installed
FROM ubuntu:latest


# Copy the script to the container
COPY helloworld.sh .

# Make the script executable
RUN chmod +x helloworld.sh

#Expose
EXPOSE 80

# Set the command to run when the container starts
CMD ["./helloworld.sh"]
