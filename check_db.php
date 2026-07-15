<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "<h2>Database Connection Test</h2>";

$host = getenv('MYSQLHOST') ?: 'mysql.railway.internal';
$port = getenv('MYSQLPORT') ?: '3306';
$user = getenv('MYSQLUSER') ?: 'root';
$pass = getenv('MYSQLPASSWORD') ?: '';
$dbname = getenv('MYSQLDATABASE') ?: 'railway';

echo "Host: $host<br>";
echo "Port: $port<br>";
echo "User: $user<br>";
echo "Database: $dbname<br>";

$conn = @mysqli_connect($host, $user, $pass, $dbname, $port);

if (!$conn) {
    echo "<h3>Connection Failed: " . mysqli_connect_error() . "</h3>";
} else {
    echo "<h3>Connection Successful!</h3>";
    $result = mysqli_query($conn, "SHOW TABLES");
    if ($result) {
        echo "<h4>Tables found:</h4><ul>";
        while ($row = mysqli_fetch_row($result)) {
            echo "<li>" . $row[0] . "</li>";
        }
        echo "</ul>";
    } else {
        echo "Error running SHOW TABLES: " . mysqli_error($conn);
    }
    mysqli_close($conn);
}
