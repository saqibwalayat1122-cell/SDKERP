<?php
// Database connection debug script for FrontAccounting on Railway
header('Content-Type: text/plain');

$path_to_root = ".";
include_once($path_to_root . "/config_db.php");

echo "=== FrontAccounting DB Debug ===\n";
echo "Configured DB Connections:\n";
print_r($db_connections);

// Disable mysqli exception throwing for compat
mysqli_report(MYSQLI_REPORT_OFF);

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
} else {
    echo "Connected successfully as user: ";
    $res = mysqli_query($link, "SELECT USER()");
    $row = mysqli_fetch_row($res);
    echo $row[0] . "\n";

    echo "\nAvailable databases for this user:\n";
    $res = mysqli_query($link, "SHOW DATABASES");
    while ($row = mysqli_fetch_row($res)) {
        echo "- {$row[0]}\n";
    }

    echo "\nQuerying debtors as sdkerp from '{$conn['dbname']}.{$conn['tbpref']}debtors_master':\n";
    $res = mysqli_query($link, "SELECT debtor_no, name FROM 0_debtors_master");
    if (!$res) {
        echo "Query failed: " . mysqli_error($link) . "\n";
    } else {
        while ($row = mysqli_fetch_assoc($res)) {
            echo "- ID: {$row['debtor_no']}, Name: {$row['name']}\n";
        }
    }
}

// Now let's try connecting as root using the root password from the environment
$root_pass = "itSEAOwfonWyhjQfFmkXVhtcsToscNaL";
echo "\nConnecting as root to database 'railway'...\n";
$root_link = mysqli_connect($conn['host'], "root", $root_pass, "railway", 3306);
if (!$root_link) {
    echo "Root connection failed: " . mysqli_connect_error() . "\n";
} else {
    echo "Root connected successfully!\n";
    echo "Available databases for root:\n";
    $res = mysqli_query($root_link, "SHOW DATABASES");
    while ($row = mysqli_fetch_row($res)) {
        echo "- {$row[0]}\n";
    }

    echo "\nQuerying debtors as root from 'railway.0_debtors_master':\n";
    $res = mysqli_query($root_link, "SELECT debtor_no, name FROM 0_debtors_master");
    if (!$res) {
        echo "Root query failed: " . mysqli_error($root_link) . "\n";
    } else {
        while ($row = mysqli_fetch_assoc($res)) {
            echo "- ID: {$row['debtor_no']}, Name: {$row['name']}\n";
        }
    }
}

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
