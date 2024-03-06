FROM ubuntu:latest

# Update package lists and install necessary packages
RUN apt-get update && \
    apt-get install -y apache2 unzip zip curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and extract the web content
RUN cp /mnt/project/website/web.html /var/www/html/ 
RUN unzip /var/www/html/web.html -d /var/www/html/ && \
    #rm /var/www/html/oxer.zip


# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
