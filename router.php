<?php
// PHP router script for built-in server
// Fixes Railway reverse proxy HTTPS detection for session cookies

// Fix: Railway runs behind HTTPS proxy. X-Forwarded-Proto = https
// but $_SERVER['HTTPS'] is not set. Set it so session cookies work correctly.
if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
    $_SERVER['HTTPS'] = 'on';
}

// Also fix the host if forwarded
if (isset($_SERVER['HTTP_X_FORWARDED_HOST'])) {
    $_SERVER['HTTP_HOST'] = $_SERVER['HTTP_X_FORWARDED_HOST'];
}

// Ensure session cookies use correct settings for HTTPS behind proxy
ini_set('session.cookie_secure', '1');
ini_set('session.cookie_httponly', '1');
ini_set('session.cookie_samesite', 'Lax');

$uri = $_SERVER['REQUEST_URI'];
$path = parse_url($uri, PHP_URL_PATH);
$file = __DIR__ . $path;

// 404 for missing static files (never route them to index.php!)
$ext = pathinfo($path, PATHINFO_EXTENSION);
if ($ext && $ext !== 'php') {
    if (!file_exists($file)) {
        header("HTTP/1.1 404 Not Found");
        echo "404 Not Found";
        exit;
    }
}

// If the file exists and is not a directory, serve it directly
if ($path !== '/' && file_exists($file) && !is_dir($file)) {
    return false;
}

// If it's a directory, check for index.php
if (is_dir($file)) {
    $indexFile = rtrim($file, '/') . '/index.php';
    if (file_exists($indexFile)) {
        return false;
    }
}

// Default: serve index.php
$_SERVER['SCRIPT_NAME'] = '/index.php';
require __DIR__ . '/index.php';
