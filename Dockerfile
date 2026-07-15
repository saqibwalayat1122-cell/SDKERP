FROM php:8.2-cli

# Install MySQL/MySQLi extension
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable error display for debugging
RUN echo "display_errors=On\nerror_reporting=E_ALL\nlog_errors=On" > /usr/local/etc/php/conf.d/errors.ini

# Copy application files
COPY . /var/www/html/

# Set proper permissions
RUN chmod -R 777 /var/www/html/tmp \
    && chmod -R 777 /var/www/html/company

WORKDIR /var/www/html

# Use PHP built-in server with router
CMD php -S 0.0.0.0:${PORT:-80} -t /var/www/html router.php
