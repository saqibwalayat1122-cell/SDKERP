<?php
header('Content-Type: text/plain');

$host = getenv('MYSQLHOST') ?: 'mysql.railway.internal';
$port = getenv('MYSQLPORT') ?: '3306';
$dbname = getenv('MYSQLDATABASE') ?: 'railway';
$dbuser = getenv('MYSQLUSER') ?: 'root';
$dbpassword = getenv('MYSQLPASSWORD') ?: '';

echo "Connecting directly to MySQL to test auth...\n";

$conn = @mysqli_connect($host, $dbuser, $dbpassword, $dbname, $port);

if (!$conn) {
    echo "Connection failed: " . mysqli_connect_error() . "\n";
    exit;
}

echo "Connection successful!\n\n";

$md5 = md5('admin123');
echo "Checking admin user with password md5 of 'admin123' ($md5):\n";

$sql = "SELECT * FROM 0_users WHERE user_id = 'admin' AND password = '$md5'";
$res = mysqli_query($conn, $sql);

if ($res) {
    $rows = mysqli_num_rows($res);
    echo "Manual SQL Rows count: " . $rows . "\n";
    if ($rows > 0) {
        $row = mysqli_fetch_assoc($res);
        echo "User ID in DB: " . $row['user_id'] . "\n";
        echo "Real Name: " . $row['real_name'] . "\n";
        echo "Inactive: " . $row['inactive'] . "\n";
        echo "Authentication status: SUCCESS!\n";
    } else {
        echo "Authentication status: FAILED! No matching user/password combination.\n";
    }
} else {
    echo "Query failed: " . mysqli_error($conn) . "\n";
}
