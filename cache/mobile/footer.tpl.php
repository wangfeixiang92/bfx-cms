<?php defined('IN_QIFANPHP') or exit('No permission resources.'); ?>		<div id="fanhui">
		  <a href="#top">返回顶部</a>
		</div>
		<!--底部导航-->
		<div id="f_nav">
			<ul>
			<li><a href="<?php echo U('guestbook');?>">留言板</a></li>
			<?php if(is_array($nav_data)) foreach($nav_data as $v) { ?>
			<li><a href="<?php if($v['type']!=2) { ?><?php echo U('mobile/index/lists', array('catid'=>$v['catid']));?><?php } else { ?><?php echo $v['pclink'];?><?php } ?>"><?php echo $v['mobname'];?></a></li>
			<?php } ?>				 
			</ul>	 
		</div>
		<!--网站底部-->
		<footer id="footer">
		   手机版 | <a href="<?php echo $site['site_url'];?>">电脑版</a> <?php echo $site['site_code'];?>
		  <p><?php echo $site['site_copyright'];?></p>
		  <p>Powered by <a href="http://www.qifan.co" target="_blank">qifancms</a> © 2014-2019</p>
		  <!-- 为了支持qifancms的发展,请您保留qifancms内容管理系统的链接信息,谢谢! -->	
		</footer>
    </div>
  </body>
</html>