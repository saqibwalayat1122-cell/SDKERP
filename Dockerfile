FROM php:8.5-apache

# Install MySQL/MySQLi extension and other required extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Fix MPM conflict - keep only prefork
RUN a2dismod mpm_event 2>/dev/null; a2dismod mpm_worker 2>/dev/null; a2enmod mpm_prefork

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Update Apache config to allow .htaccess overrides
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Copy application files
COPY . /var/www/html/

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 777 /var/www/html/tmp \
    && chmod -R 777 /var/www/html/company

# Make entrypoint executable
RUN chmod +x /var/www/html/docker-entrypoint.sh

EXPOSE 80

# Use entrypoint script to set PORT at runtime
CMD ["/var/www/html/docker-entrypoint.sh"]
