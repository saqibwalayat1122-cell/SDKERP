<?php
$path_to_root = '.';
include_once('./includes/session.inc');

set_global_connection();

header('Content-Type: text/plain');

echo "Checking database user admin...\n";

$sql = "SELECT id, user_id, password, real_name, role_id, inactive FROM 0_users";
$res = db_query($sql, "select users");

if ($res) {
    while ($row = db_fetch($res)) {
        echo "ID: " . $row['id'] . "\n";
        echo "Username: " . $row['user_id'] . "\n";
        echo "Password MD5: " . $row['password'] . "\n";
        echo "Name: " . $row['real_name'] . "\n";
        echo "Role ID: " . $row['role_id'] . "\n";
        echo "Inactive: " . $row['inactive'] . "\n";
        echo "-------------------------\n";
    }
} else {
    echo "Query failed.\n";
}
