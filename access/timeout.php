<?php
/**********************************************************************
    Copyright (C) FrontAccounting, LLC.
	Released under the terms of the GNU General Public License, GPL, 
	as published by the Free Software Foundation, either version 3 
	of the License, or (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
    See the License here <http://www.gnu.org/licenses/gpl-3.0.html>.
***********************************************************************/
/*
	User authentication page popped up after login timeout during ajax call.
*/
$path_to_root = '..';
$page_security = 'SA_OPEN';
include_once($path_to_root . "/includes/session.inc");

ob_start();
include($path_to_root .'/access/login.php');
$page = ob_get_clean();

if (get_post('SubmitUser') && $_SESSION['wa_current_user']->logged_in()) {
	// After successful login repeat last ajax call when opened as timeout popup.
	// Otherwise redirect to the main application page.
	$script = "<script>
	var o = opener;
	try {
		if (o && o.JsHttpRequest && typeof o.JsHttpRequest.request == 'function') {
			o.JsHttpRequest.request(document.getElementsByName('SubmitUser')[0], o.document.forms[0]);
			window.close();
		} else if (o) {
			o.location = '$path_to_root/index.php';
			window.close();
		} else {
			window.location = '$path_to_root/index.php';
		}
	} catch (e) {
		window.location = '$path_to_root/index.php';
	}
</script><noscript><center><p>Login successful. <a href='$path_to_root/index.php'>Click here to continue</a>.</p></center></noscript>";
	$page = preg_replace('~</body>\s*</html>~i', $script.'</body></html>', $page, 1);
}
echo $page;
