FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install Apache + PHP 8.1 (package manager auto-configures correct MPM)
RUN apt-get update && apt-get install -y \
    apache2 \
    php8.1 \
    libapache2-mod-php8.1 \
    php8.1-mysql \
    php8.1-gd \
    php8.1-mbstring \
    php8.1-zip \
    php8.1-xml \
    php8.1-curl \
    php8.1-intl \
    default-mysql-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Enable Apache modules (libapache2-mod-php8.1 auto-enables mpm_prefork)
RUN a2enmod rewrite php8.1

# Set working directory
WORKDIR /var/www/html

# Copy all project files
COPY . /var/www/html/

# Copy and set up entrypoint
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Set permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 777 /var/www/html/tmp \
    && chmod -R 777 /var/www/html/company

# Apache virtual host config
RUN echo '<VirtualHost *:80>\n\
    DocumentRoot /var/www/html\n\
    <Directory /var/www/html>\n\
        AllowOverride All\n\
        Require all granted\n\
        Options -Indexes\n\
    </Directory>\n\
    ErrorLog ${APACHE_LOG_DIR}/error.log\n\
    CustomLog ${APACHE_LOG_DIR}/access.log combined\n\
</VirtualHost>' > /etc/apache2/sites-available/000-default.conf

# Verify Apache config
RUN apache2ctl configtest && echo "Apache config OK"

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
