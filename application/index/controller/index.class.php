<?php
defined('IN_QIFANPHP') or exit('Access Denied');

class index{
	
	/**
	 * 首页
	 */
	public function init() {
		$site = get_config();
		$seo_title = $site['site_name'];
		$keywords = $site['site_keyword'];
		$description = $site['site_description'];
		include template('mobile', 'index');
	}
	
	
	/**
	 * 栏目列表页
	 */
	public function lists() {
		$catid = isset($_GET['catid']) ? intval($_GET['catid']) : 0;
		if(!$catid) showmsg(L('missing_parameter'),'stop');
		$catinfo = get_category($catid);
		if(!$catinfo) showmsg(L('category_not_existent'),'stop');
		extract($catinfo);
		
		//外部链接
		if($type == 2) showmsg(L('is_jump'), $pclink, 1);
		
		//SEO相关设置
		$site = get_config();
		$seo_title = $seo_title ? $seo_title : $catname.'_'.$site['site_name'];
		$keywords = $seo_keywords ? $seo_keywords : $site['site_keyword'];
		$description = $seo_description ? $seo_description : $site['site_description'];
		
		$template = $catid==$arrchildid ? $list_template : $category_template;
		//如果没有设置search,则为静态分页URL规则
		if(!isset($_GET['s']))
		define('LIST_URL', get_config('url_rule'));		
				
		include template('index', $template);
	}
	
	
	/*
	 * 内容页
	 */
	public function show() {
		$catid = isset($_GET['catid']) ? intval($_GET['catid']) : 0;
		$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
		if(!$catid || !$id) showmsg(L('missing_parameter'),'stop');
		
		$category = get_category($catid);
		if(!$category) showmsg(L('category_not_existent'),'stop');
		$modelid = $category['modelid'];
		$template = $category['show_template'];
		
		$modelinfo = get_modelinfo();
        $modelarr = array();
		foreach($modelinfo as $val){
			$modelarr[$val['modelid']] = $val['tablename'];
		}
		
		if(!isset($modelarr[$modelid]))  showmsg(L('model_not_existent'),'stop');
		$db = D($modelarr[$modelid]);
		$data = $db->where(array('id'=>$id))->find();
		if(!empty($data['diytpl'])) $template = $data['diytpl'];

		if(!$data || $data['status'] != 1) showmsg(L('content_not_existent'),'stop');
		extract($data);
		
		//会员组权限和阅读收费检测，手机端直接提示用PC打开浏览
		if($groupids_view || $readpoint) {
			showmsg(L('insufficient_authority_pc'), 'stop');
		}
		
		//SEO相关设置
		$site = get_config();
		
		//更新点击量 点赞量
		$db->update('`click` = `click`+1', array('id' => $id));
		$db->update('`dianzan` = `dianzan`+1', array('id' => $id));

		//内容分页
		if(strpos($content, '_qifancms_content_page_') !== false){
			$content = $this->_content_page($content);
		}	
		
		//获取相同分类的上一篇/下一篇内容	
		$pre = $db->field('id,catid,title')->where(array('id<'=>$id , 'status'=>'1' , 'catid'=>$catid))->order('id DESC')->find();
		$next = $db->field('id,catid,title')->where(array('id>'=>$id , 'status'=>'1', 'catid'=>$catid))->order('id ASC')->find();
		$pre = $pre ? '<a href="'.U('mobile/index/show', array('catid'=>$pre['catid'],'id'=>$pre['id'])).'">'.$pre['title'].'</a>' : L('already_is_first');
		$next = $next ? '<a href="'.U('mobile/index/show', array('catid'=>$next['catid'],'id'=>$next['id'])).'">'.$next['title'].'</a>' : L('already_is_last');
		

		function get_file($filename){
			return trim(substr(file_get_contents($filename), 15));
		}
		function set_file($filename, $content) {
			if($fp = fopen($filename, 'w+')){
				$startTime = microtime();
				do {
					$canWrite = flock($fp, LOCK_EX);
					if(!$canWrite) usleep(round(rand(0, 100)*1000));
				} while ((!$canWrite) && ((microtime()-$startTime) < 1000));
	
				if ($canWrite) {
					fwrite($fp, "<?php exit();?>" . $content);
				}
				fclose($fp);
			}
		}

		$appid = $site['wx_appid'];
		$appsecret = $site['wx_secret'];
		$path = $site['site_url'];

		$file1 = dirname(__FILE__).'/access_token.php';
		if(!file_exists($file1)){
			set_file($file1, '');
		}
		$data1 = json_decode(get_file($file1));
		if (empty($data1) || $data1->expire_time < time()) {
			$token_access_url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" .$appid. "&secret=" .$appsecret;
			$res = file_get_contents($token_access_url); //获取文件内容或获取网络请求的内容
			$result = json_decode($res, true); //接受一个 JSON 格式的字符串并且把它转换为 PHP 变量
			$access_token = $result['access_token'];
			if ($access_token) {
				$data = new stdClass();
				$data->expire_time = time() + 7000;
				$data->access_token = $access_token;
				set_file($file1, json_encode($data));
			}
		} else {
			$access_token = $data1->access_token;
		}


		$file2 = dirname(__FILE__).'/jsapi_ticket.php';
		if(!file_exists($file2)){
			set_file($file2, '');
		}
		$data2 = json_decode(get_file($file2));
		if (empty($data2) || $data2->expire_time < time()) {
			$ticket_url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=$access_token&type=jsapi&offset_type=1";
			$ress = file_get_contents($ticket_url); //获取文件内容或获取网络请求的内容
			$results = json_decode($ress, true); //接受一个 JSON 格式的字符串并且把它转换为 PHP 变量
			$ticket = $results['ticket'];
			if ($ticket) {
				$data = new stdClass();
				$data->expire_time = time() + 7000;
				$data->jsapi_ticket = $ticket;
				set_file($file2, json_encode($data));
			}
		} else {
			$ticket = $data2->jsapi_ticket;
		}

		function randomkeys($length) { 
			$pattern = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLOMNOPQRSTUVWXYZ';
			for($i=0;$i<$length;$i++) 
			{ 
				$key .= $pattern{mt_rand(0,35)};    //生成php随机数 
			} 
			return $key; 
		} 
		$noncestr = strval(randomkeys(16));
		$timestamp = time();

		$urls = explode('html&', $_SERVER['QUERY_STRING']);
		if(strlen($urls[1]) > 0){
			$url = U('mobile/index/show', array('catid'=>$catid,'id'=>$id)).'?'.$urls[1];
		}else{
			$url = U('mobile/index/show', array('catid'=>$catid,'id'=>$id));
		}
		$parameters = array("noncestr" => $noncestr,
								"jsapi_ticket" => $ticket,
								"timestamp" => $timestamp,
								"url" => $url);
		ksort($parameters);

		$string1 = "";
		foreach ($parameters as $key => $val){
			$string1 .= $key."=".$val."&";
		}
		$string1 = substr($string1,0,-1);
		$signature = sha1($string1);
		include template('mobile', $template);
	}
	
	
	/**
	 * 阅读收费检测
	 */
	private function _check_readpoint($flag, $readpoint, $url) {
		$userid = intval(get_cookie('_userid'));
		if(!$userid){
			showmsg(L('need_login'), url_referer(get_url()), 2);
		}
		
		//检查24小时内是否支付过
		$data = D('pay_spend')->field('creat_time')->where(array('userid'=>$userid,'remarks'=>$flag))->order('id DESC')->find();
		if($data && $data['creat_time']+86400 > SYS_TIME) {
			return true;
		}
		
		$data = D('member')->field('point,vip,overduedate')->where(array('userid'=>$userid))->find();
		
		//检查是否为vip会员
		if($data['vip']){
			if($data['overduedate'] > SYS_TIME)	return true; 
			D('member')->update(array('vip'=>0), array('userid'=>$userid));
		}
		
		$point = $data['point'];
		if($point < $readpoint){
			showmsg(L('not_enough').$readpoint.L('point').'，'.L('can_not_read'), 'stop');
		}else{
			$parurl = 'par='.string_auth($flag.'|'.$readpoint.'|'.$url);
			include template('index', 'authority_confirm');
			exit();
		}
	}


	/**
	 * 内容分页
	 */
	private function _content_page($content) {
		$arr = explode('_qifancms_content_page_', $content);
		$page = isset($_GET['page']) ? max(intval($_GET['page']), 1) : 1;
		$total_page = count($arr);
		$off = $page-1<$total_page ? $page-1 : $total_page-1;

		$pages = '<div id="page">';
		if(URL_MODEL == 3){
			$pages .= $page<=1 ? '<a href="?page=1" class="nopage">'.L('pre_page').'</a>' : '<a href="?page='.($page-1).'" class="prepage">'.L('pre_page').'</a>';
			for($i=1; $i<=$total_page; $i++){  
				$class = $i==$page ? ' curpage' : '';
				$pages.='<a href="?page='.$i.'" class="listpage'.$class.'">'.$i.'</a>'; 
			}
			$pages .= $page>=$total_page ? '<a href="?page='.$page.'" class="nopage">'.L('next_page').'</a>' : '<a href="?page='.($page+1).'" class="prepage">'.L('next_page').'</a>';						
		}else{
			qifan_base::load_sys_class('page','',0);
			$page = new page($total_page, 1);
			$pages .= $page->getpre().$page->getlist().$page->getnext();		
		}
		$pages .= '</div>';

		return $arr[$off].$pages;
	}

}