<?php defined('IN_QIFANPHP') or exit('No permission resources.'); ?><!DOCTYPE HTML>
<html>
  <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	  <meta name="viewport" content="width=device-width, maximum-scale=1.0, initial-scale=1.0, user-scalable=no">
	  <title><?php echo $seo_title;?></title>
	  <link href="<?php echo STATIC_URL;?>css/mobile_category.css" rel="stylesheet" type="text/css" /> 
    <script type="text/javascript" src="<?php echo STATIC_URL;?>js/jquery-1.8.2.min.js"></script>	  
	  <script type="text/javascript" src="<?php echo STATIC_URL;?>js/mobile_simpler-sidebar.min.js"></script>
	  <meta name="keywords" content="<?php echo $keywords;?>" />
	  <meta name="description" content="<?php echo $description;?>" />
  </head>
  <body>
    <!--网站容器-->
    <div id="container">	
		<?php include template("mobile","header"); ?>	
		<!--主要内容-->
		<div id="main_article">	
		 <div id="content">
		  <h1><?php echo $title;?></h1>
		  <div id="info"><?php echo date("Y-m-d H:i:s",$inputtime);?>&nbsp;&nbsp;浏览：<?php echo $click;?>&nbsp;&nbsp;作者：<?php echo $nickname;?></div>
		   <?php echo $content;?>		  
		 </div>
          <div id="next">		  
			  <p>上一篇：<?php echo $pre;?></p>
			  <p>下一篇：<?php echo $next;?></p>
		  </div> 
		<!--评论区 开始-->
		<h3 class="ind_bt">评论区</h3>
		<div class="com_form">
		   <form action="<?php echo U('comment/index/init');?>" method="post"  onsubmit="return check_comm(this)">
				<input type="hidden" name="modelid" value="<?php echo $modelid;?>">
				<input type="hidden" name="catid" value="<?php echo $catid;?>">
				<input type="hidden" name="id" value="<?php echo $id;?>">
				<input type="hidden" name="title" value="<?php echo $title;?>">
				<input type="hidden" name="url" value="<?php echo $url;?>">
			<textarea class="textarea" id="content" name="content" placeholder="让评论变得如此简单~" required="required"></textarea>
			<p><input type="submit" class="sub_btn" name="dosubmit" value="提交"></p>
		   </form>
		</div>
		<div class="comment_list">
			<?php $tag = qifan_base::load_sys_class('qifan_tag');if(method_exists($tag, 'comment_list')) {$data = $tag->comment_list(array('modelid'=>$modelid,'catid'=>$catid,'id'=>$id,'limit'=>'20',));}?>
			<div class="comment_list_top">共<?php echo count($data);?>条评论</div>
			<div class="comment_list_body">
			   <ul>
					<?php if(is_array($data)) foreach($data as $v) { ?>
					 <li>
						<div class="comm_right">
						  <a class="user_name" href="<?php echo U('member/myhome/init', array('userid'=>$v['userid']));?>" target="blank"><?php echo $v['username'];?></a>
						  <p><?php echo nl2br($v['content']);?></p>
						   <p><span class="comm_time"><?php echo date('Y-m-d H:i:s',$v['inputtime']);?></span> <a href="javascript:toreply('<?php echo $v['id'];?>');" class="comm_a">回复</a></p>
						   
							<div id="rep_<?php echo $v['id'];?>" class="none">
							  <form action="<?php echo U('comment/index/init');?>" method="post"  onsubmit="return check_rep(this)">
								<input type="hidden" name="modelid" value="<?php echo $modelid;?>">
								<input type="hidden" name="catid" value="<?php echo $catid;?>">
								<input type="hidden" name="id" value="<?php echo $id;?>">
								<input type="hidden" name="title" value="<?php echo $title;?>">
								<input type="hidden" name="url" value="<?php echo $url;?>">
								<input type="hidden" name="reply" value="<?php echo $v['id'];?>">
								<input type="hidden" name="reply_to" value="<?php echo $v['username'];?>">
							   <textarea name="content" class="textarea textarea2" placeholder="让评论变得如此简单~" required="required"></textarea>
							   <input type="submit" class="sub_btn static" name="dosubmit" value="提交">
							  </form>
							</div>
						</div>
					 </li>
				    <?php } ?>
					<?php if(empty($data)) { ?><li>这篇文章还没有收到评论，赶紧来抢沙发吧~</li><?php } ?>
			   </ul>
			</div>
		</div> 
		<!--评论区 结束-->		  
		</div>
		 <div class="clearfix"></div>
		 <div id="article_img">
		  <h3 class='tit'>【随机新闻】</h3>
		  <ul>
			<?php $tag = qifan_base::load_sys_class('qifan_tag');if(method_exists($tag, 'lists')) {$data = $tag->lists(array('field'=>'id,catid,title,thumb,description','modelid'=>$modelid,'order'=>'RAND()','limit'=>'4',));}?>
			<?php if(is_array($data)) foreach($data as $k=>$v) { ?>		 
			  <li><a href="<?php echo U('mobile/index/show', array('catid'=>$v['catid'],'id'=>$v['id']));?>"><img src="<?php if(!empty($v['thumb'])) { ?><?php echo $v['thumb'];?><?php } else { ?><?php echo STATIC_URL;?>images/nopic.jpg<?php } ?>" alt="<?php echo $v['title'];?>"></a><a href="<?php echo U('mobile/index/show', array('catid'=>$v['catid'],'id'=>$v['id']));?>"><?php echo $v['title'];?></a><span><?php echo $v['description'];?></span></li>						
			<?php } ?>			   			 
		  </ul>		 
		 </div>	 
		<script>
		function toreply(obj){
			if($("#rep_" + obj).css("display") == "none"){
				$("#rep_" + obj).css("display", "block");
			}else{
				$("#rep_" + obj).css("display", "none");
			}
		}

		function check_comm(obj){
			var content = obj.content.value;
			if(content === ''){
				alert('你不打算说点什么吗？');
				return false;
			}
			return true;
		}

		function check_rep(obj){
			var content = obj.content.value;
			if(content === ''){
				alert('你不打算说点什么吗？');
				return false;
			}
			return true;
		}
		</script>		 
		<?php include template("mobile","footer"); ?>	