# Use an official PHP image as the base
FROM php:8.1.2

# Set the working directory in the container
WORKDIR /var/www/html

# Copy your PHP application files into the container
COPY db.inc.php index.php samplepage.php index.html_bkp /var/www/html/

# Install necessary dependencies if any (e.g., PHP extensions, libraries)
RUN docker-php-ext-install mysqli

# Install Apache
RUN apt-get update && apt-get install -y apache2

# Enable PHP module for Apache
RUN ln -s /etc/apache2/mods-available/php8.load /etc/apache2/mods-enabled/php8.load

# Expose the port your application runs on (if necessary)
EXPOSE 80

# Specify the command to run your application
CMD ["apache2ctl", "-D", "FOREGROUND"]
