<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "<h2>Database Connection Test</h2>";

$host = getenv('MYSQLHOST') ?: 'mysql.railway.internal';
$port = getenv('MYSQLPORT') ?: '3306';
$user = getenv('MYSQLUSER') ?: 'root';
$pass = getenv('MYSQLPASSWORD') ?: '';
$dbname = getenv('MYSQLDATABASE') ?: 'railway';

$conn = @mysqli_connect($host, $user, $pass, $dbname, $port);

if (!$conn) {
    echo "<h3>Connection Failed: " . mysqli_connect_error() . "</h3>";
} else {
    echo "<h3>Connection Successful!</h3>";
    
    // Check users in 0_users to 4_users
    for ($i = 0; $i <= 4; $i++) {
        $table = "${i}_users";
        $res = @mysqli_query($conn, "SELECT user_id, password, real_name FROM $table");
        if ($res) {
            echo "<h4>Users in $table:</h4><ul>";
            while ($row = mysqli_fetch_assoc($res)) {
                echo "<li>Username: " . $row['user_id'] . " | Password (MD5): " . $row['password'] . " | Name: " . $row['real_name'] . "</li>";
            }
            echo "</ul>";
        } else {
            echo "<h4>Table $table not accessible or empty.</h4>";
        }
    }
    
    // Print current config_db.php if it exists
    if (file_exists("config_db.php")) {
        echo "<h4>config_db.php content:</h4>";
        echo "<pre>" . htmlspecialchars(file_get_contents("config_db.php")) . "</pre>";
    } else {
        echo "<h4>config_db.php does not exist</h4>";
    }
    
    mysqli_close($conn);
}
