<?php defined('IN_QIFANPHP') or exit('No permission resources.'); ?><header id="header" name="top">
  <a href="javascript:history.go(-1);" id="fh" title="返回上一页"><img src="<?php echo STATIC_URL;?>images/fh.png"></a> 
  <img src="<?php echo STATIC_URL;?>images/menu.png" id="menu" title="菜单选项">
  <h2><?php echo $title;?></h2>		 
</header>
<nav class="sidebar" id="nav">
	<ul>
		<li><a href="<?php echo U('mobile/index/init');?>">网站首页</a></li>
		<?php $tag = qifan_base::load_sys_class('qifan_tag');if(method_exists($tag, 'nav')) {$nav_data = $tag->nav(array('field'=>'mobname,catid,type,pclink','where'=>"parentid=0",'limit'=>'20','return'=>'nav_data',));}?>
		<?php if(is_array($nav_data)) foreach($nav_data as $v) { ?>
		<li><a href="<?php if($v['type']!=2) { ?><?php echo U('mobile/index/lists', array('catid'=>$v['catid']));?><?php } else { ?><?php echo $v['pclink'];?><?php } ?>"><?php echo $v['mobname'];?></a></li>
		<?php } ?>
	</ul>
</nav>
<script type="text/javascript">
	$(function() {
		$('#nav').simplerSidebar({
			opener: '#menu',
			sidebar: {
				align: 'left',
				width: 250
			}
		});
	});
</script>	