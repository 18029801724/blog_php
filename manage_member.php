<?php
/**

*/
session_start();
//定义个常量，用来授权调用includes里面的文件
define('IN_TG',true);
//定义个常量，用来指定本页的内容
define('SCRIPT','manage_member');
//引入公共文件
require dirname(__FILE__).'/includes/common.inc.php';
//必须是管理员才能登录
_manage_login();

//删除会员
if ($_GET['action'] == 'del' && isset($_GET['id'])) {
	if (!!$_rows = _fetch_array("SELECT 
																	tg_uniqid
														FROM 
																	tg_user 
													 WHERE 
																	tg_username='{$_COOKIE['username']}' 
														 LIMIT 
																	1"
	)) {
			_uniqid($_rows['tg_uniqid'],$_COOKIE['uniqid']);
			//删除会员
			_query("DELETE FROM 
														tg_user
										WHERE 
														tg_id='{$_GET['id']}' 
											LIMIT 
														1
				");
			if (_affected_rows() == 1) {
				_close();
				
				_location('删除会员成功！','manage_member.php');
			} else {
				_close();
				_alert_back('删除会员失败！');
			}
	} else {
		_alert_back('非法登录！');
	}
}
global $_pagesize,$_pagenum;
_page("SELECT tg_id FROM tg_user",15); 
$_result = _query("SELECT 
															tg_id,
															tg_username,
															tg_email,
															tg_reg_time
									FROM 
												tg_user 
							ORDER BY 
												tg_reg_time DESC 
									 LIMIT 
												$_pagenum,$_pagesize
							");	
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php 
	require ROOT_PATH.'includes/title.inc.php';
?>
<script type="text/javascript" src="js/member_message.js"></script>
</head>
<body>
<?php 
	require ROOT_PATH.'includes/header.inc.php';
?>

<div id="member">
<?php 
	require ROOT_PATH.'includes/manage.inc.php';
?>
	<div id="member_main">
		<h2>会员列表中心</h2>
		<form method="post" action="?action=delete">
		<table cellspacing="1">
			<tr><th>ID号</th><th>会员名</th><th>邮件</th><th>注册时间</th><th>操作</th></tr>
			<?php 
					$_html = array();
					while (!!$_rows = _fetch_array_list($_result)) {
						$_html['id'] = $_rows['tg_id'];
						$_html['username'] = $_rows['tg_username'];
						$_html['email'] = $_rows['tg_email'];
						$_html['reg_time'] = $_rows['tg_reg_time'];
						$_html = _html($_html);
			?>
			<tr><td><?php echo $_html['id']?></td><td><?php echo $_html['username']?></td><td><?php echo $_html['email']?></td><td><?php echo $_html['reg_time']?></td><td>[<a href="?action=del&id=<?php echo $_html['id']?>">秒删</a>]</td></tr>
			<?php }?>
			</table>
		</form>
		<?php 
			_free_result($_result);
			_paging(2);
		?>
	</div>
</div>

<?php 
	require ROOT_PATH.'includes/footer.inc.php';
?>
</body>
</html>