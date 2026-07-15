<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "<h2>Session/DB Diagnostic</h2>";

try {
    $path_to_root = ".";
    // Check if files exist
    echo "config_db.php exists: " . (file_exists("config_db.php") ? "Yes" : "No") . "<br>";
    echo "config.php exists: " . (file_exists("config.php") ? "Yes" : "No") . "<br>";
    
    // Include config_db.php to check connection info
    include("config_db.php");
    echo "Default Company ID: " . (isset($def_coy) ? $def_coy : "not set") . "<br>";
    echo "DB Connections count: " . (isset($db_connections) ? count($db_connections) : "not set") . "<br>";
    
    if (isset($db_connections[0])) {
        echo "Company 0 host: " . $db_connections[0]['host'] . "<br>";
        echo "Company 0 dbuser: " . $db_connections[0]['dbuser'] . "<br>";
        echo "Company 0 dbname: " . $db_connections[0]['dbname'] . "<br>";
        echo "Company 0 tbpref: " . $db_connections[0]['tbpref'] . "<br>";
    }
    
    // Include session.inc and catch any error/exception
    echo "Starting session.inc include...<br>";
    include("includes/session.inc");
    echo "session.inc included successfully!<br>";
    
} catch (Throwable $t) {
    echo "<h3>Exception caught during startup:</h3>";
    echo "Type: " . get_class($t) . "<br>";
    echo "Message: " . $t->getMessage() . "<br>";
    echo "File: " . $t->getFile() . "<br>";
    echo "Line: " . $t->getLine() . "<br>";
    echo "<pre>" . $t->getTraceAsString() . "</pre>";
}
