FROM php:8.2-cli

# Install MySQL/MySQLi extension
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy application files
COPY . /var/www/html/

# Set proper permissions
RUN chmod -R 777 /var/www/html/tmp \
    && chmod -R 777 /var/www/html/company

WORKDIR /var/www/html

# Use PHP built-in server with Railway's PORT
CMD php -S 0.0.0.0:${PORT:-80} -t /var/www/html
