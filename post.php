<?php
/**

*/
session_start();
//定义个常量，用来授权调用includes里面的文件
define('IN_TG',true);
//定义个常量，用来指定本页的内容
define('SCRIPT','post');
//引入公共文件
require dirname(__FILE__).'/includes/common.inc.php';
//登陆后才可以发帖
if (!isset($_COOKIE['username'])) {
	_location('发帖前，必须登录','login.php');
}
//将帖子写入数据库
if ($_GET['action'] == 'post') {
	_check_code($_POST['code'],$_SESSION['code']); //验证码判断
	if (!!$_rows = _fetch_array("SELECT 
																tg_uniqid,
																tg_post_time
													FROM 
																tg_user 
												 WHERE 
																tg_username='{$_COOKIE['username']}' 
													 LIMIT 
																1"
		)) {
		global $_system;
		//为了防止cookies伪造，还要比对一下唯一标识符uniqid()
		_uniqid($_rows['tg_uniqid'],$_COOKIE['uniqid']);
		//验证一下是否在规定的时间外发帖
		_timed(time(),$_rows['tg_post_time'],$_system['post']);
		include ROOT_PATH.'includes/check.func.php';
		//接受帖子内容
		$_clean = array();
		$_clean['username'] = $_COOKIE['username'];
		$_clean['type'] = $_POST['type'];
		$_clean['title'] = _check_post_title($_POST['title'],2,40);
		$_clean['content'] = _check_post_content($_POST['content'],10);
		$_clean = _mysql_string($_clean);
		//写入数据库
		_query("INSERT INTO tg_article (
																tg_username,
																tg_title,
																tg_type,
																tg_content,
																tg_date
															) 
											VALUES (
																'{$_clean['username']}',
																'{$_clean['title']}',
																'{$_clean['type']}',
																'{$_clean['content']}',
																NOW()
															)
		");
		if (_affected_rows() == 1) {
			$_clean['id'] = _insert_id();
			//setcookie('post_time',time());
			$_clean['time'] = time();
			_query("UPDATE tg_user SET tg_post_time='{$_clean['time']}' WHERE tg_username='{$_COOKIE['username']}'");
			_close();
			//_session_destroy();
			_location('帖子发表成功！','article.php?id='.$_clean['id']);
		} else {
			_close();
			//_session_destroy();
			_alert_back('帖子发表失败！');
		}
	}
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php 
	require ROOT_PATH.'includes/title.inc.php';
?>
<script type="text/javascript" src="js/code.js"></script>
<script type="text/javascript" src="js/post.js"></script>
</head>
<body>
<?php 
	require ROOT_PATH.'includes/header.inc.php';
?>

<div id="post">
	<h2>发表帖子</h2>
	<form method="post" name="post" action="?action=post">
		<dl>
			<dt>请认真填写一下内容</dt>
			<dd>
				类　　型：


            <label for="type1"><input type="radio" id="type16" name="type" value="1" checked="checked"/>  手杀</label>
			<label for="type2"><input type="radio" id="type16" name="type" value="2" />  网杀</label>
			<label for="type3"><input type="radio" id="type16" name="type" value="3" />  其他</label>
			<label for="type4"><input type="radio" id="type16" name="type" value="4" />  灌水</label>
			<label for="type5"><input type="radio" id="type16" name="type" value="6" /> 公告 </label>

			</dd>
			<dd>标　　题：<input type="text" name="title" class="text" /> (*必填，2-40位)</dd>
				<dd id="q">表　　情：　<a href="javascript:;">【王朗系列】</a>　 <a href="javascript:;">【郭嘉系列】</a>　 <a href="javascript:;">【甄姬系列】</a>　
			<dd>
				<?php include ROOT_PATH.'includes/ubb.inc.php'?>
				<textarea name="content" rows="19"></textarea>
			</dd>
			<dd>验 证 码：<input type="text" name="code" class="text yzm"  /> <img src="code.php" id="code" onclick="javascript:this.src='code.php?tm='+Math.random();" /> <input type="submit" class="submit" value="发表帖子" /></dd>
		</dl>
	</form>
</div>

<?php 
	require ROOT_PATH.'includes/footer.inc.php';
?>
</body>
</html>