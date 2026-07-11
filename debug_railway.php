<?php
// Railway Debug - DELETE AFTER DEBUGGING
// Access: https://sdkerp.up.railway.app/debug_railway.php

echo "<pre style='font-family:monospace;padding:20px;background:#1e1e1e;color:#00ff00;'>";
echo "=== RAILWAY DEBUG INFO ===\n\n";

// 1. Environment Variables
echo "--- ENV VARIABLES ---\n";
echo "MYSQLHOST: " . ($_ENV['MYSQLHOST'] ?? getenv('MYSQLHOST') ?? 'NOT SET') . "\n";
echo "MYSQLPORT: " . ($_ENV['MYSQLPORT'] ?? getenv('MYSQLPORT') ?? 'NOT SET') . "\n";
echo "MYSQLDATABASE: " . ($_ENV['MYSQLDATABASE'] ?? getenv('MYSQLDATABASE') ?? 'NOT SET') . "\n";
echo "MYSQLUSER: " . ($_ENV['MYSQLUSER'] ?? getenv('MYSQLUSER') ?? 'NOT SET') . "\n";
$env_pass = $_ENV['MYSQLPASSWORD'] ?? getenv('MYSQLPASSWORD') ?? '';
echo "MYSQLPASSWORD length: " . strlen($env_pass) . "\n";
if (strlen($env_pass) > 4) {
    echo "MYSQLPASSWORD prefix/suffix: " . substr($env_pass, 0, 2) . "..." . substr($env_pass, -2) . "\n";
} else {
    echo "MYSQLPASSWORD value: " . ($env_pass ? 'Set but short' : 'EMPTY') . "\n";
}
echo "PORT: " . ($_ENV['PORT'] ?? getenv('PORT') ?? 'NOT SET') . "\n";
echo "HTTP_X_FORWARDED_FOR: " . ($_SERVER['HTTP_X_FORWARDED_FOR'] ?? 'NOT SET') . "\n";
echo "REMOTE_ADDR: " . ($_SERVER['REMOTE_ADDR'] ?? 'NOT SET') . "\n\n";

// 2. config_db.php check
echo "--- CONFIG_DB.PHP ---\n";
$config_pass = '';
if (file_exists(__DIR__ . '/config_db.php')) {
    echo "EXISTS: YES\n";
    require_once __DIR__ . '/config_db.php';
    echo "def_coy: $def_coy\n";
    echo "DB Host: " . $db_connections[0]['host'] . "\n";
    echo "DB Name: " . $db_connections[0]['dbname'] . "\n";
    echo "DB User: " . $db_connections[0]['dbuser'] . "\n";
    echo "Table Prefix: " . $db_connections[0]['tbpref'] . "\n";
    $config_pass = $db_connections[0]['dbpassword'];
    echo "DB Password length: " . strlen($config_pass) . "\n";
    if (strlen($config_pass) > 4) {
        echo "DB Password prefix/suffix: " . substr($config_pass, 0, 2) . "..." . substr($config_pass, -2) . "\n";
    }
} else {
    echo "EXISTS: NO - config_db.php MISSING!\n";
}
echo "\n";

// 3. Database Connection Test
echo "--- DATABASE CONNECTION (using config_db.php values) ---\n";
if (!empty($db_connections[0])) {
    $host = $db_connections[0]['host'];
    $port = $db_connections[0]['port'] ?? '3306';
    $dbname = $db_connections[0]['dbname'];
    $user = $db_connections[0]['dbuser'];
    $pass = $db_connections[0]['dbpassword'];
} else {
    $host = getenv('MYSQLHOST') ?: 'localhost';
    $port = getenv('MYSQLPORT') ?: '3306';
    $dbname = getenv('MYSQLDATABASE') ?: 'frontacc';
    $user = getenv('MYSQLUSER') ?: 'root';
    $pass = getenv('MYSQLPASSWORD') ?: '';
}

try {
    $pdo = new PDO("mysql:host=$host;port=$port;dbname=$dbname", $user, $pass);
    echo "CONNECTION: SUCCESS\n";
    
    // Count tables
    $stmt = $pdo->query("SHOW TABLES");
    $tables = $stmt->fetchAll(PDO::FETCH_COLUMN);
    echo "TOTAL TABLES: " . count($tables) . "\n";
    
    if (count($tables) > 0) {
        echo "FIRST 10 TABLES:\n";
        foreach (array_slice($tables, 0, 10) as $t) {
            echo "  - $t\n";
        }
        
        // Check users table
        $prefix = '0_';
        if (in_array($prefix . 'users', $tables)) {
            $stmt = $pdo->query("SELECT user_id, user_id as user_name, inactive FROM {$prefix}users LIMIT 5");
            $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
            echo "\nUSERS IN DB:\n";
            foreach ($users as $u) {
                echo "  - User ID: " . $u['user_id'] . " (inactive: " . $u['inactive'] . ")\n";
            }
        } else {
            echo "WARNING: Table {$prefix}users NOT FOUND!\n";
        }
        
        // Check security roles
        if (in_array($prefix . 'security_roles', $tables)) {
            $stmt = $pdo->query("SELECT COUNT(*) FROM {$prefix}security_roles");
            echo "\nSECURITY ROLES COUNT: " . $stmt->fetchColumn() . "\n";
        } else {
            echo "WARNING: {$prefix}security_roles NOT FOUND!\n";
        }
        
    } else {
        echo "WARNING: NO TABLES FOUND - Database is EMPTY!\n";
        echo "SQL backup may not have been imported yet.\n";
    }
    
} catch (Exception $e) {
    echo "CONNECTION: FAILED\n";
    echo "ERROR: " . $e->getMessage() . "\n";
}

// 4. PHP Session Test
echo "\n--- PHP SESSION ---\n";
session_start();
$_SESSION['test_key'] = 'test_value_' . time();
echo "Session Save Path: " . session_save_path() . "\n";
echo "Session ID: " . session_id() . "\n";
echo "Session Write: " . ($_SESSION['test_key'] ? 'OK' : 'FAILED') . "\n";

// 5. File Permissions
echo "\n--- FILE PERMISSIONS ---\n";
echo "tmp/ writable: " . (is_writable(__DIR__ . '/tmp') ? 'YES' : 'NO') . "\n";
echo "company/ writable: " . (is_writable(__DIR__ . '/company') ? 'YES' : 'NO') . "\n";
echo "config_db.php readable: " . (is_readable(__DIR__ . '/config_db.php') ? 'YES' : 'NO') . "\n";
$sess_path = session_save_path() ?: '/var/lib/php/sessions';
echo "Session path writable: " . (is_writable($sess_path) ? 'YES' : 'NO') . "\n";

echo "\n=== END DEBUG ===\n";
echo "</pre>";
?>
