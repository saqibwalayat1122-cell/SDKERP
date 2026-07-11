#!/bin/bash

echo "=== FrontAccounting Railway Startup ==="
echo "🔍 PORT: ${PORT:-not-set}"
echo "🔍 MYSQLHOST: ${MYSQLHOST:-not-set}"

# Get DB connection details from environment
DB_HOST="${MYSQLHOST:-localhost}"
DB_PORT="${MYSQLPORT:-3306}"
DB_NAME="${MYSQLDATABASE:-frontacc}"
DB_USER="${MYSQLUSER:-root}"
DB_PASS="${MYSQLPASSWORD:-}"

# Generate config_db.php from environment variables
cat > /var/www/html/config_db.php << PHPEOF
<?php

\$def_coy = 0;
\$tb_pref_counter = 5;

\$db_connections = array (
  0 =>
  array (
    'name' => 'Sidekick',
    'host' => '${DB_HOST}',
    'port' => '${DB_PORT}',
    'dbname' => '${DB_NAME}',
    'collation' => 'utf8_general_ci',
    'tbpref' => '0_',
    'dbuser' => '${DB_USER}',
    'dbpassword' => '${DB_PASS}',
  ),
  1 =>
  array (
    'name' => 'Sidekick Corp',
    'host' => '${DB_HOST}',
    'port' => '${DB_PORT}',
    'dbname' => '${DB_NAME}',
    'collation' => 'utf8_general_ci',
    'tbpref' => '1_',
    'dbuser' => '${DB_USER}',
    'dbpassword' => '${DB_PASS}',
  ),
  2 =>
  array (
    'name' => 'Sidekick Logistics',
    'host' => '${DB_HOST}',
    'port' => '${DB_PORT}',
    'dbname' => '${DB_NAME}',
    'collation' => 'utf8_general_ci',
    'tbpref' => '2_',
    'dbuser' => '${DB_USER}',
    'dbpassword' => '${DB_PASS}',
  ),
  3 =>
  array (
    'name' => 'Sidekick Retail',
    'host' => '${DB_HOST}',
    'port' => '${DB_PORT}',
    'dbname' => '${DB_NAME}',
    'collation' => 'utf8_general_ci',
    'tbpref' => '3_',
    'dbuser' => '${DB_USER}',
    'dbpassword' => '${DB_PASS}',
  ),
  4 =>
  array (
    'name' => 'Sidekick Services',
    'host' => '${DB_HOST}',
    'port' => '${DB_PORT}',
    'dbname' => '${DB_NAME}',
    'collation' => 'utf8_general_ci',
    'tbpref' => '4_',
    'dbuser' => '${DB_USER}',
    'dbpassword' => '${DB_PASS}',
  ),
);
PHPEOF

echo "✅ config_db.php generated"

# Fix permissions
chown www-data:www-data /var/www/html/config_db.php 2>/dev/null || true
chmod 644 /var/www/html/config_db.php

# DB import in background
(
  echo "📦 Background: Waiting for MySQL at ${DB_HOST}:${DB_PORT}..."
  MAX_WAIT=120
  COUNT=0
  until mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -p"$DB_PASS" -e "SELECT 1;" > /dev/null 2>&1; do
    COUNT=$((COUNT+1))
    if [ $COUNT -ge $MAX_WAIT ]; then
      echo "⚠️ MySQL not reachable after ${MAX_WAIT}s"
      exit 0
    fi
    echo "⏳ Waiting for MySQL... ($COUNT/$MAX_WAIT)"
    sleep 1
  done

  echo "✅ MySQL connected!"

  if [ -f /var/www/html/frontacc_backup.sql ]; then
    TABLE_COUNT=$(mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "SHOW TABLES;" 2>/dev/null | wc -l || echo "0")
    if [ "$TABLE_COUNT" -le "1" ]; then
      echo "🚀 Importing database..."
      mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < /var/www/html/frontacc_backup.sql
      echo "✅ Database imported!"
    else
      echo "✅ DB already has ${TABLE_COUNT} tables, skipping import"
    fi
  fi
) &

# Configure Apache for Railway PORT (Railway injects PORT=8080)
APP_PORT="${PORT:-80}"
echo "📡 Setting Apache to listen on port: ${APP_PORT}"

# Update ports.conf
sed -i "s/Listen 80/Listen ${APP_PORT}/g" /etc/apache2/ports.conf

# Update VirtualHost port
sed -i "s/<VirtualHost \*:80>/<VirtualHost *:${APP_PORT}>/g" /etc/apache2/sites-available/000-default.conf

# Fix ServerName warning
echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Start Apache directly (source envvars required on Ubuntu)
echo "🌐 Starting Apache on port ${APP_PORT}..."
source /etc/apache2/envvars
exec apache2 -D FOREGROUND
