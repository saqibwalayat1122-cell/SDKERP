<?php
header('Content-Type: text/plain');

$path_to_root = '.';
include_once('./includes/session.inc');

set_global_connection();

echo "Testing get_user_auth('admin', md5('admin123'))...\n";
$md5 = md5('admin123');
echo "MD5 of admin123 is: $md5\n";

$res = get_user_auth('admin', $md5);
echo "Result of get_user_auth: " . ($res ? "TRUE (Auth Succeeded!)" : "FALSE (Auth Failed!)") . "\n";

// Let's run the SQL query manually to see what it returns
$sql = "SELECT * FROM 0_users WHERE user_id = 'admin' AND password = '$md5'";
$db_res = db_query($sql, "test");
echo "Manual SQL Rows count: " . db_num_rows($db_res) . "\n";
if (db_num_rows($db_res) > 0) {
    $row = db_fetch($db_res);
    echo "User name in DB: " . $row['real_name'] . "\n";
    echo "Inactive status: " . $row['inactive'] . "\n";
}
