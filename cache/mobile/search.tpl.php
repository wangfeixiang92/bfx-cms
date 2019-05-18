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
		<script>
		 wx.config({
					debug:false,
					appId: 'wxb9dfd86b80be1efc',
					timestamp: '1541664666',
					nonceStr: 'LJQnL7ngtkczDFhU',
					signature: '5432e0931de036b8b691a41c01e24b93a2c46501',
					jsApiList: [
					   'onMenuShareTimeline',
						'onMenuShareAppMessage',
					   'hideMenuItems',
					   'showMenuItems'
						]
				});
				wx.error(function (res) {
					console.log(res);
				});
		</script>
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
			<div class="row banner">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<!--div class="carousel-inner" role="listbox">
						<?php $tag = qifan_base::load_sys_class('qifan_tag');if(method_exists($tag, 'lists')) {$data = $tag->lists(array('field'=>'id,catid,title,thumb','modelid'=>'1','thumb'=>'1','limit'=>'3',));}?>
						<?php if(is_array($data)) foreach($data as $v) { ?>
						<div class="item" align="center">
								<a href="<?php echo U('mobile/index/show', array('catid'=>$v['catid'],'id'=>$v['id']));?>">
									<img src="<?php echo $v['thumb'];?>" alt="niasfsdf">
								</a>
						</div>
						<?php } ?>
					</div-->
					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true" style="color:#ffffff"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="color:#ffffff"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="row navs">
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane" style="display:block;">
						<div class="row content3" style="">
							<div class=" video-content">
								<table class="table table-striped">
									<tbody>
										<?php if(is_array($search_data)) foreach($search_data as $v) { ?>
										<tr>
											<td>
												<a href="<?php echo U('mobile/index/show', array('catid'=>$v['catid'],'id'=>$v['id']));?>">
													<div class="col-xs-3 video-picture ">
														<img src="<?php echo $v['thumb'];?>" alt="..." class="img-rounded" style="float:left">
													</div>
													<div class="col-xs-9 video-infomition " style="padding:0 ">
														<div class=" video-title " style="margin-left:10px">
															<div class="col-xs-12" style="padding:0"><p><?php echo $v['title'];?></p></div>

														</div>
														<div class=" video-time" style="margin-left:10px">
															<div class=" col-xs-12" style="padding:0">
																<p><?php echo date('Y-m-d',$v['inputtime']);?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;播放&nbsp;
																	 <?php echo $v['click'];?>
																</p>
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
			<nav class="navbar navbar-default navbar-fixed-bottom footer">
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
			</nav>
		</div>
		<script src="<?php echo STATIC_URL;?>js/jquery-1.8.2.min.js"></script>
		<script>
			$(function () {
				$('#c1').addClass('non');
				$('#c1').click(function(){
					$('#id1').show();
					$('#c1').addClass('non');
					$('#id2,#id3').hide();
					$('#c2,#c3').removeClass('non');
				});
				$('#c2').click(function(){
					$('#id2').show();
					$('#c2').addClass('non');
					$('#id1,#id3').hide();
					$('#c1,#c3').removeClass('non');
				});
				$('#c3').click(function(){
					$('#id3').show();
					$('#c3').addClass('non');
					$('#id1,#id2').hide();
					$('#c1,#c2').removeClass('non');
				}); 
			});
		</script>
	</body>
</html>