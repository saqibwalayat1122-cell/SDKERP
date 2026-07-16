<?php
// debug_cookie.php - Test session cookie behavior
echo "<h2>Cookie/Session Debug</h2>";
echo "HTTPS: " . (isset($_SERVER['HTTPS']) ? $_SERVER['HTTPS'] : 'NOT SET') . "<br>";
echo "X-Forwarded-Proto: " . (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) ? $_SERVER['HTTP_X_FORWARDED_PROTO'] : 'NOT SET') . "<br>";
echo "HTTP_HOST: " . $_SERVER['HTTP_HOST'] . "<br>";
echo "REQUEST_URI: " . $_SERVER['REQUEST_URI'] . "<br><br>";

// Show current cookies
echo "<b>Incoming Cookies:</b><br>";
foreach($_COOKIE as $k => $v) {
    echo htmlspecialchars($k) . " = " . htmlspecialchars(substr($v, 0, 30)) . "<br>";
}
echo "<br>";

// Start session
session_name("TESTSESSION");
session_start();

echo "<b>Session ID:</b> " . session_id() . "<br>";
echo "<b>Session save path:</b> " . session_save_path() . "<br>";

// Test write
$_SESSION['test'] = time();
echo "<b>Session test value written:</b> " . $_SESSION['test'] . "<br>";

// Check if session file exists
$sess_path = session_save_path() ?: sys_get_temp_dir();
$sess_file = $sess_path . '/sess_' . session_id();
echo "<b>Session file path:</b> $sess_file<br>";
echo "<b>Session file exists:</b> " . (file_exists($sess_file) ? 'YES' : 'NO') . "<br>";
echo "<b>Writable path:</b> " . (is_writable($sess_path) ? 'YES' : 'NO') . "<br><br>";

// Check tmp folder
echo "<b>/var/www/html/tmp writable:</b> " . (is_writable('/var/www/html/tmp') ? 'YES' : 'NO') . "<br>";
echo "<b>/tmp writable:</b> " . (is_writable('/tmp') ? 'YES' : 'NO') . "<br><br>";

echo "<a href='debug_cookie.php'>Refresh to test cookie persistence</a><br>";
echo "<b>Cookie header being sent:</b> ";
echo session_get_cookie_params()['secure'] ? 'Secure=true' : 'Secure=false';
echo ", HttpOnly=" . (session_get_cookie_params()['httponly'] ? 'true' : 'false');
echo "<br>";
