#!/bin/bash
set -e

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

echo "config_db.php generated successfully"

# Fix permissions
chown www-data:www-data /var/www/html/config_db.php
chmod 644 /var/www/html/config_db.php

exec "$@"
