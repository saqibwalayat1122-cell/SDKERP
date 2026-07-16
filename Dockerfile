FROM php:8.2-cli

# Install MySQL/MySQLi extension
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Session and error config
RUN echo "display_errors=On" > /usr/local/etc/php/conf.d/custom.ini && \
    echo "error_reporting=E_ALL" >> /usr/local/etc/php/conf.d/custom.ini && \
    echo "log_errors=On" >> /usr/local/etc/php/conf.d/custom.ini && \
    echo "session.gc_maxlifetime=36000" >> /usr/local/etc/php/conf.d/custom.ini && \
    echo "session.cookie_httponly=1" >> /usr/local/etc/php/conf.d/custom.ini && \
    echo "session.use_strict_mode=1" >> /usr/local/etc/php/conf.d/custom.ini

# Copy application files
COPY . /var/www/html/

# Set proper permissions and pre-create writable directories
RUN chmod -R 777 /var/www/html/tmp \
    && chmod -R 777 /var/www/html/company \
    && mkdir -p /var/www/html/company/0/js_cache \
    && mkdir -p /var/www/html/company/0/backup \
    && mkdir -p /var/www/html/company/0/pdf_files \
    && mkdir -p /var/www/html/company/0/images \
    && chmod -R 777 /var/www/html/company/0 \
    && chmod -R 777 /var/www/html/tmp

WORKDIR /var/www/html

# Use PHP built-in server with router
CMD php -S 0.0.0.0:${PORT:-80} -t /var/www/html router.php
