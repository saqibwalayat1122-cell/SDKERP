<?php
// debug_login_flow.php - Test full login flow

// Fix HTTPS for Railway
if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
    $_SERVER['HTTPS'] = 'on';
}

$path_to_root = '.';

echo "<h2>Login Flow Debug</h2>";

// Step 1: Include session.inc (starts session, checks login)
echo "<b>Step 1: Including session.inc...</b><br>";
ob_start();
include_once('./includes/session.inc');
$session_output = ob_get_clean();

echo "Session started OK<br>";
echo "Session ID: " . session_id() . "<br>";
echo "wa_current_user exists: " . (isset($_SESSION['wa_current_user']) ? 'YES' : 'NO') . "<br>";

if (isset($_SESSION['wa_current_user'])) {
    $u = $_SESSION['wa_current_user'];
    echo "User logged in: " . ($u->logged ? 'YES' : 'NO') . "<br>";
    echo "User ID: " . $u->user . "<br>";
    echo "User name: " . $u->name . "<br>";
    echo "Company: " . $u->company . "<br>";
    echo "Role set count: " . count($u->role_set) . "<br>";
    echo "Login name: " . $u->loginname . "<br>";
}

echo "<br><b>Step 2: App object check...</b><br>";
echo "App exists in session: " . (isset($_SESSION['App']) ? 'YES' : 'NO') . "<br>";
if (isset($_SESSION['App'])) {
    $app = $_SESSION['App'];
    echo "App applications count: " . count($app->applications) . "<br>";
    foreach ($app->applications as $key => $a) {
        echo "- Application: " . $key . " (". get_class($a) .")<br>";
    }
    echo "Selected app: " . htmlspecialchars(print_r($app->get_selected_application(), true)) . "<br>";
}

echo "<br><b>Step 3: DB Connection test...</b><br>";
set_global_connection();
$result = db_query("SELECT id, user_id, real_name, access FROM 0_users LIMIT 5", "test");
if ($result) {
    echo "DB OK, users found:<br>";
    while ($row = db_fetch($result)) {
        echo "- ID:{$row['id']} user:{$row['user_id']} name:{$row['real_name']} access:{$row['access']}<br>";
    }
} else {
    echo "DB query failed: " . db_error_msg(db_connection()) . "<br>";
}

echo "<br><b>Step 4: SysPrefs check...</b><br>";
echo "SysPrefs class: " . get_class($SysPrefs) . "<br>";
echo "db_ok: " . ($SysPrefs->db_ok ? 'YES' : 'NO') . "<br>";
echo "hide_inaccessible_menu_items: " . ($SysPrefs->hide_inaccessible_menu_items ?? 'NOT SET') . "<br>";

echo "<br><b>Step 5: Force init App...</b><br>";
if (!isset($_SESSION['App']) || !$_SESSION['wa_current_user']->logged) {
    echo "Not logged in - showing login link<br>";
    echo "<a href='/index.php'>Go to login page</a>";
} else {
    echo "Logged in as: " . $_SESSION['wa_current_user']->name . "<br>";
    echo "Try: <a href='/index.php'>index.php</a><br>";
    
    // Try to manually init app
    if (!isset($_SESSION['App'])) {
        $_SESSION['App'] = new front_accounting();
        $_SESSION['App']->init();
        echo "App initialized manually<br>";
    }
    
    $app = $_SESSION['App'];
    echo "Applications count: " . count($app->applications) . "<br>";
    
    // Check access
    $selected = $app->get_selected_application();
    echo "Selected app: " . (is_object($selected) ? get_class($selected) : 'NULL/NONE') . "<br>";
    
    if ($selected) {
        $can_access = $_SESSION['wa_current_user']->check_application_access($selected);
        echo "check_application_access: " . ($can_access ? 'TRUE (can see)' : 'FALSE (hidden!)') . "<br>";
        echo "Modules in selected app: " . count($selected->modules) . "<br>";
    }
}

echo "<br><b>Session output (first 500 chars):</b><br>";
echo "<pre>" . htmlspecialchars(substr($session_output, 0, 500)) . "</pre>";
