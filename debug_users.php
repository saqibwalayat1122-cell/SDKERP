<?php
header('Content-Type: text/plain');

$host = getenv('MYSQLHOST') ?: 'mysql.railway.internal';
$port = getenv('MYSQLPORT') ?: '3306';
$dbname = getenv('MYSQLDATABASE') ?: 'railway';
$dbuser = getenv('MYSQLUSER') ?: 'root';
$dbpassword = getenv('MYSQLPASSWORD') ?: '';

echo "Connecting to MySQL: $host:$port (DB: $dbname)...\n";

$conn = @mysqli_connect($host, $dbuser, $dbpassword, $dbname, $port);

if (!$conn) {
    echo "Connection failed: " . mysqli_connect_error() . "\n";
    exit;
}

echo "Connection successful!\n\n";

$sql = "SELECT id, user_id, password, real_name, role_id, inactive FROM 0_users";
$res = mysqli_query($conn, $sql);

if ($res) {
    while ($row = mysqli_fetch_assoc($res)) {
        echo "ID: " . $row['id'] . "\n";
        echo "Username: " . $row['user_id'] . "\n";
        echo "Password MD5: " . $row['password'] . "\n";
        echo "Name: " . $row['real_name'] . "\n";
        echo "Role ID: " . $row['role_id'] . "\n";
        echo "Inactive: " . $row['inactive'] . "\n";
        echo "-------------------------\n";
    }
} else {
    echo "Query failed: " . mysqli_error($conn) . "\n";
}
