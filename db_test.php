<?php
// Database connection debug script for FrontAccounting on Railway
header('Content-Type: text/plain');

$path_to_root = ".";
include_once($path_to_root . "/config_db.php");

echo "=== FrontAccounting DB Debug ===\n";
echo "Configured DB Connections:\n";
print_r($db_connections);

// Try to connect to connection 0
$conn = $db_connections[0];
echo "\nConnecting to connection 0 (Name: {$conn['name']})...\n";
echo "Host: {$conn['host']}\n";
echo "Port: {$conn['port']}\n";
echo "DBName: {$conn['dbname']}\n";
echo "Prefix: {$conn['tbpref']}\n";

$link = mysqli_connect($conn['host'], $conn['dbuser'], $conn['dbpassword'], $conn['dbname'], $conn['port'] ? $conn['port'] : 3306);
if (!$link) {
    echo "Connection failed: " . mysqli_connect_error() . "\n";
    exit;
}

echo "Connected successfully!\n";

$prefix = $conn['tbpref'];
$query = "SELECT debtor_no, name, inactive FROM {$prefix}debtors_master";
echo "Executing query: {$query}\n";

$result = mysqli_query($link, $query);
if (!$result) {
    echo "Query failed: " . mysqli_error($link) . "\n";
} else {
    echo "Rows found:\n";
    while ($row = mysqli_fetch_assoc($result)) {
        echo "- ID: {$row['debtor_no']}, Name: {$row['name']}, Inactive: {$row['inactive']}\n";
    }
}
?>
