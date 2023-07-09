# Use Ubuntu as the base image

FROM ubuntu:latest

# Set DEBIAN_FRONTEND to noninteractive to prevent prompts

ENV DEBIAN_FRONTEND=noninteractive

# Update the package lists and install necessary packages

RUN apt-get update && \
    apt-get install -y \
        apache2 \
        php \
        libapache2-mod-php \
        && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory

WORKDIR /var/www/html

# Copy your web server application files to the container
COPY . /var/www/html

# Expose the default HTTP port

EXPOSE 80

# Start the Apache web server when the container launches
CMD ["apache2ctl", "-D", "FOREGROUND"]

