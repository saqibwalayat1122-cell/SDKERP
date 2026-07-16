<?php
header('Content-Type: text/plain');

$host = getenv('MYSQLHOST') ?: 'mysql.railway.internal';
$port = getenv('MYSQLPORT') ?: '3306';
$dbname = getenv('MYSQLDATABASE') ?: 'railway';
$dbuser = getenv('MYSQLUSER') ?: 'root';
$dbpassword = getenv('MYSQLPASSWORD') ?: '';

echo "Connecting directly to MySQL to check security roles...\n";

$conn = @mysqli_connect($host, $dbuser, $dbpassword, $dbname, $port);

if (!$conn) {
    echo "Connection failed: " . mysqli_connect_error() . "\n";
    exit;
}

echo "Connection successful!\n\n";

echo "Checking security roles table (0_security_roles):\n";
$sql = "SELECT id, role, description, sections, areas, inactive FROM 0_security_roles";
$res = mysqli_query($conn, $sql);

if ($res) {
    $rows = mysqli_num_rows($res);
    echo "Security Roles count: " . $rows . "\n";
    if ($rows > 0) {
        while ($row = mysqli_fetch_assoc($res)) {
            echo "ID: " . $row['id'] . "\n";
            echo "Role Name: " . $row['role'] . "\n";
            echo "Description: " . $row['description'] . "\n";
            echo "Inactive: " . $row['inactive'] . "\n";
            echo "-------------------------\n";
        }
    } else {
        echo "No security roles found!\n";
    }
} else {
    echo "Query failed: " . mysqli_error($conn) . "\n";
}
