#!/bin/bash
set -e

echo "=== FrontAccounting Railway Startup ==="

# Generate config_db.php from Railway environment variables
cat > /var/www/html/config_db.php << EOF
<?php

\$def_coy = 0;
\$tb_pref_counter = 5;

\$db_connections = array (
  0 =>
  array (
    'name' => 'Sidekick',
    'host' => getenv('MYSQLHOST') ?: 'localhost',
    'port' => getenv('MYSQLPORT') ?: '3306',
    'dbname' => getenv('MYSQLDATABASE') ?: 'frontacc',
    'collation' => 'utf8_general_ci',
    'tbpref' => '0_',
    'dbuser' => getenv('MYSQLUSER') ?: 'root',
    'dbpassword' => getenv('MYSQLPASSWORD') ?: '',
  ),
  1 =>
  array (
    'name' => 'Sidekick Corp',
    'host' => getenv('MYSQLHOST') ?: 'localhost',
    'port' => getenv('MYSQLPORT') ?: '3306',
    'dbname' => getenv('MYSQLDATABASE') ?: 'frontacc',
    'collation' => 'utf8_general_ci',
    'tbpref' => '1_',
    'dbuser' => getenv('MYSQLUSER') ?: 'root',
    'dbpassword' => getenv('MYSQLPASSWORD') ?: '',
  ),
  2 =>
  array (
    'name' => 'Sidekick Logistics',
    'host' => getenv('MYSQLHOST') ?: 'localhost',
    'port' => getenv('MYSQLPORT') ?: '3306',
    'dbname' => getenv('MYSQLDATABASE') ?: 'frontacc',
    'collation' => 'utf8_general_ci',
    'tbpref' => '2_',
    'dbuser' => getenv('MYSQLUSER') ?: 'root',
    'dbpassword' => getenv('MYSQLPASSWORD') ?: '',
  ),
  3 =>
  array (
    'name' => 'Sidekick Retail',
    'host' => getenv('MYSQLHOST') ?: 'localhost',
    'port' => getenv('MYSQLPORT') ?: '3306',
    'dbname' => getenv('MYSQLDATABASE') ?: 'frontacc',
    'collation' => 'utf8_general_ci',
    'tbpref' => '3_',
    'dbuser' => getenv('MYSQLUSER') ?: 'root',
    'dbpassword' => getenv('MYSQLPASSWORD') ?: '',
  ),
  4 =>
  array (
    'name' => 'Sidekick Services',
    'host' => getenv('MYSQLHOST') ?: 'localhost',
    'port' => getenv('MYSQLPORT') ?: '3306',
    'dbname' => getenv('MYSQLDATABASE') ?: 'frontacc',
    'collation' => 'utf8_general_ci',
    'tbpref' => '4_',
    'dbuser' => getenv('MYSQLUSER') ?: 'root',
    'dbpassword' => getenv('MYSQLPASSWORD') ?: '',
  ),
);
EOF

echo "✅ config_db.php generated successfully"

# Fix permissions
chown www-data:www-data /var/www/html/config_db.php
chmod 644 /var/www/html/config_db.php

# Database import (only if SQL backup exists and DB is empty)
DB_HOST="${MYSQLHOST:-localhost}"
DB_PORT="${MYSQLPORT:-3306}"
DB_NAME="${MYSQLDATABASE:-frontacc}"
DB_USER="${MYSQLUSER:-root}"
DB_PASS="${MYSQLPASSWORD:-}"

if [ -f /var/www/html/frontacc_backup.sql ]; then
    echo "📦 Checking if database needs import..."
    
    # Wait for MySQL to be ready (max 60 seconds)
    MAX_WAIT=60
    COUNT=0
    until mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -p"$DB_PASS" -e "SELECT 1;" > /dev/null 2>&1; do
        COUNT=$((COUNT+1))
        if [ $COUNT -ge $MAX_WAIT ]; then
            echo "⚠️ MySQL not ready after ${MAX_WAIT}s, skipping import"
            break
        fi
        echo "⏳ Waiting for MySQL... ($COUNT/$MAX_WAIT)"
        sleep 1
    done

    # Check if tables already exist
    TABLE_COUNT=$(mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "SHOW TABLES;" 2>/dev/null | wc -l || echo "0")
    
    if [ "$TABLE_COUNT" -le "1" ]; then
        echo "🚀 Importing database..."
        mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < /var/www/html/frontacc_backup.sql
        echo "✅ Database imported successfully!"
    else
        echo "✅ Database already has data (${TABLE_COUNT} tables), skipping import"
    fi
else
    echo "⚠️ No backup SQL file found, skipping database import"
fi

echo "🌐 Starting Apache..."
exec "$@"
