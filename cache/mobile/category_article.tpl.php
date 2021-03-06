<?php defined('IN_QIFANPHP') or exit('No permission resources.'); ?><!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>裂变大厅</title>
		<link href="<?php echo STATIC_URL;?>css/index.css" rel="stylesheet">
		<link href="<?php echo STATIC_URL;?>css/iconfont.css" rel="stylesheet">
		<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
		<script src="<?php echo STATIC_URL;?>js/swipe.js"></script>
		<script src="<?php echo STATIC_URL;?>js/jquery-1.8.2.min.js"></script>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row search" id="search">
			<form method="get" action="<?php echo SITE_URL;?>index.php">
				<div class="col-lg-6">
					<div class="input-group" id="searchtxt">
						<input type="hidden" name="m" value="search" />
						<input type="hidden" name="modelid" value="1" id="modelid" />
						<input name="q" type="text" class="form-control" placeholder="输入关键字"/>
						  <span class="input-group-btn">
							<button class="btn btn-search" type="submit" id="searchbtn"><span class="glyphicon glyphicon-zoom-in"><i class="iconfont icon-sousuo"></i></span>
							</button>
						  </span>
					</div><!-- input-group -->
				</div>
			</form>
			</div>
			<div class="banner">
				<div id="swipe">
					<div class="swipe">
						<?php $tag = qifan_base::load_sys_class('qifan_tag');if(method_exists($tag, 'banner')) {$data = $tag->banner(array('limit'=>'5',));}?>
						<?php if(is_array($data)) foreach($data as $v) { ?>
						<a href="<?php echo $v['url'];?>">
							<img style="width:100%;" src="<?php echo $v['image'];?>">
						</a>
						<?php } ?>
					</div>
				</div>
			</div>
			<div class="row navs">
				<ul class="nav nav-tabs" role="tablist" style="width:100%; " id="navul">
					<?php $tag = qifan_base::load_sys_class('qifan_tag');if(method_exists($tag, 'nav')) {$nav_data = $tag->nav(array('field'=>'mobname,catid,catdir','where'=>"parentid=0",'limit'=>'5','return'=>'nav_data',));}?>
					<?php if(is_array($nav_data)) foreach($nav_data as $v) { ?>
					<a role="presentation" class="active <?php if(isset($catid) && $v['catid']==$catid) { ?>non<?php } ?>" href="<?php echo U('mobile/index/lists','catid='.$v['catid']);?>">
						<span class="glyphicon glyphicon-play-circle"><i class="iconfont icon-<?php echo $v['catdir'];?>"></i></span>
						<span class="sp"><?php echo $v['mobname'];?></span>
					</a>
					<?php } ?>
				</ul>
				<script>
                    var num = $("#navul a").length;
					$(".active").css("width",100/num + '%');
				</script>
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane" id="id1" style="display:block;">
						<div class="row content3">
							<div class=" video-content">
								<table class="table table-striped">
									<tbody>
									<?php $tag = qifan_base::load_sys_class('qifan_tag');if(method_exists($tag, 'lists')) {$data = $tag->lists(array('field'=>'url,id,catid,title,inputtime,click,thumb','catid'=>$catid,'page'=>'page',));$pages = $tag->pages();}?>
									<?php if(is_array($data)) foreach($data as $v) { ?>
										<tr>
											<td>
												<a href="<?php echo $v['url'];?>" class="bbb">
													<div class="col-xs-3 video-picture ">
														<img src="<?php echo $v['thumb'];?>" alt="..." class="img-rounded" style="float:left">
													</div>
													<div class="col-xs-9 video-infomition " style="padding:0 ">
														<div class="video-title ">
															<div class="col-xs-12" style="padding:0"><p><?php echo $v['title'];?></p></div>
														</div>
														<div class=" video-time">
															<div class=" col-xs-12" style="padding:0">
																<p><span class="l"><?php echo date('Y-m-d',$v['inputtime']);?></span><span class="r">播放&nbsp;<?php echo $v['click'];?></span></p>
															</div>
														</div>
													</div>
												</a>
											</td>
										</tr>
										<?php } ?>
									</tbody>
								</table>
							</div>
						</div> 
					</div>
				</div>
				<!-- Tab panes -->
			</div>
			<!--nav class="navbar navbar-default navbar-fixed-bottom footer">
				<div class="btn-group btn-group-justified btn-group-footer " role="group" aria-label="...">
					<div class="btn-group" role="group">
						<a href="index.php">
							<button type="button" class="btn btn-default btn-footer"><span class="buttonfotter">素材库</span>&nbsp; <span class="glyphicon glyphicon-home" style="color: #3e3e3e;"></span></button>
						</a>
					</div>
					<div class="btn-group" role="group">
						<a href="admin">
							<button type="button" class="btn btn-default btn-footer"><span class="buttonfotter">个人中心</span>&nbsp; <span class="glyphicon glyphicon-user" style="color: #3e3e3e;"></span></button>
						</a>
					</div>
				</div>
			</nav-->
		</div>
		<script type="text/javascript">	
			//set swipeHeight
			var w = $('#swipe').width();
			var h = w * 0.7 +'px';
			$('.detail_huandeng,#swipe,.swipe,.swipe a,.swipe img').height(h);		
			//swipe
			var $swi=$("#swipe");
			swipe = Swipe(document.getElementById('swipe'), {
			startSlide: 0,
			auto: 3000,
			transitionEnd: function(index, element) {
			$swi.removeClass("on").eq(index).addClass("on")
			}
			});
		</script>
	</body>
</html>