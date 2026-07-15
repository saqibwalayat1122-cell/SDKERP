<?php
// PHP router script for built-in server
// This handles .htaccess-like behavior for PHP built-in server

$uri = $_SERVER['REQUEST_URI'];
$path = parse_url($uri, PHP_URL_PATH);
$file = __DIR__ . $path;

// If the file exists and is not a directory, serve it directly
if ($path !== '/' && file_exists($file) && !is_dir($file)) {
    // Let PHP serve .php files, return false for static files
    if (pathinfo($file, PATHINFO_EXTENSION) === 'php') {
        return false;
    }
    // For static files (css, js, images, etc.), serve them
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
