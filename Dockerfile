FROM ubuntu:latest

# Install required utilities
RUN apt-get update && apt-get install -y \
    dos2unix \
    bc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the calculator.sh script into the container
COPY calculator.sh /app/calculator.sh

# Convert line endings to Unix-style
RUN dos2unix /app/calculator.sh

# Ensure the script has execute permissions
RUN chmod +x /app/calculator.sh

# Set the default command to execute calculator.sh
CMD ["bash", "/app/calculator.sh"]
