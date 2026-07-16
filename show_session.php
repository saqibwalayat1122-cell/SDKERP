<?php
// Fix HTTPS for Railway
if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
    $_SERVER['HTTPS'] = 'on';
}

$path_to_root = '.';
include_once('./includes/session.inc');

header('Content-Type: text/plain');

echo "SESSION ID: " . session_id() . "\n\n";
echo "SESSION DATA:\n";
print_r($_SESSION);
