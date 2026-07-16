<?php
// Fix HTTPS for Railway proxy
if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
    $_SERVER['HTTPS'] = 'on';
}

header('Content-Type: text/plain');

$cookie_name = 'FA' . md5('/var/www/html/includes');
session_name($cookie_name);

$save_path = '/var/www/html/tmp/';
if (is_writable($save_path)) {
    ini_set('session.save_path', $save_path);
}

// Set session cookie options
$https = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off');
session_set_cookie_params(0, '/', null, $https, true);

session_start();

echo "COOKIE NAME: " . $cookie_name . "\n";
echo "SESSION ID: " . session_id() . "\n";
echo "SESSION SAVE PATH: " . session_save_path() . "\n";
echo "INCOMING COOKIES:\n";
print_r($_COOKIE);

echo "\nSESSION DATA:\n";
print_r($_SESSION);
