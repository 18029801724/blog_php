<?php
/**
* TestGuest Version1.0
* ================================================
* Copy 2010-2012 yc60
* Web: http://www.yc60.com
* ================================================
* Author: Lee
* Date: 2010-8-10
*/
//防止恶意调用
if (!defined('IN_TG')) {
	exit('Access Defined!');
}
?>
<script type="text/javascript" src="js/skin.js"></script>
<div id="header">
	<h1><a href="index.php">logo</a></h1>

	<ul>
		<li><a href="index.php">首页</a></li>
		<?php 
			if (isset($_COOKIE['username'])){
				echo '<li><a href="member.php" class="manage">'.$_COOKIE['username'].'·个人中心</a> '.$GLOBALS['message'].'</li>';
				echo "\n";
				echo '		<li><a href="blog.php">好友</a></li>';
				echo "\n";

			} else {	

				echo '<li><a href="login.php">登录</a></li>';
				echo "\n";
			}
		?>

		<li><a href="photo.php">相册</a></li>
		<li class="skin" onmouseover='inskin()' onmouseout='outskin()'>
			<a href="javascript:;">分类</a>
			<dl id="skin">
				<dd><a href="skin1.php">手 杀</a></dd>
				<dd><a href="skin2.php">网 杀</a></dd>
				<dd><a href="skin3.php">其 他</a></dd>
				<dd><a href="skin4.php">灌 水</a></dd>
			</dl>
		</li>
		
		<?php 
			if (isset($_COOKIE['username']) && isset($_SESSION['admin'])) {
				echo '<li><a href="manage.php" class="manage">管理</a></li> ';
				echo "\n";
								echo '<li><a href="register.php">注册</a></li>';
				echo "\n";
				echo "\t\t";
			}
			if (isset($_COOKIE['username'])){
				echo '<li><a href="logout.php">退出</a></li>';
			}
		?>
	</ul>
</div>