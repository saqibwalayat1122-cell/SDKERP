<?php

$def_coy = 0;
$tb_pref_counter = 1;

$db_connections = array (
  0 => 
  array (
    'name' => 'Sidekick',
    'host' => getenv('MYSQLHOST') ?: 'mysql.railway.internal',
    'port' => getenv('MYSQLPORT') ?: '3306',
    'dbname' => getenv('MYSQLDATABASE') ?: 'railway',
    'collation' => 'utf8_general_ci',
    'tbpref' => '0_',
    'dbuser' => getenv('MYSQLUSER') ?: 'root',
    'dbpassword' => getenv('MYSQLPASSWORD') ?: '',
  ),
);
