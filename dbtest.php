<?php
// Quick DB connection diagnostic
// REMOVE THIS FILE AFTER DEBUGGING!

$host = getenv('MYSQLHOST') ?: 'mysql.railway.internal';
$port = getenv('MYSQLPORT') ?: 3306;
$user = getenv('MYSQLUSER') ?: 'root';
$pass = getenv('MYSQLPASSWORD') ?: '';
$db   = getenv('MYSQLDATABASE') ?: 'railway';

echo "<h2>Railway DB Diagnostic</h2>";
echo "<pre>";
echo "Host: $host\n";
echo "Port: $port\n";
echo "User: $user\n";
echo "DB:   $db\n";
echo "Pass: " . (empty($pass) ? '(EMPTY!)' : '(set, length=' . strlen($pass) . ')') . "\n";
echo "\n";

// Test 1: Env vars from Railway (automatic)
echo "--- Test 1: Env-var based connection ---\n";
$conn = @mysqli_connect($host, $user, $pass, '', (int)$port);
if ($conn) {
    echo "SUCCESS connecting with env vars!\n";
    echo "MySQL version: " . mysqli_get_server_info($conn) . "\n";
    $sel = mysqli_select_db($conn, $db);
    echo "Select DB '$db': " . ($sel ? "OK" : "FAILED - " . mysqli_error($conn)) . "\n";
    mysqli_close($conn);
} else {
    echo "FAILED: " . mysqli_connect_error() . " (errno: " . mysqli_connect_errno() . ")\n";
}

echo "\n--- MYSQL_URL env var ---\n";
echo getenv('MYSQL_URL') ? getenv('MYSQL_URL') : "(not set)";
echo "\n";
echo "\n--- MYSQL_PUBLIC_URL env var ---\n";
echo getenv('MYSQL_PUBLIC_URL') ? getenv('MYSQL_PUBLIC_URL') : "(not set)";
echo "\n";

echo "</pre>";
?>
