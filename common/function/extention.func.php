<?php
/**
 * extention.func.php   用户自定义函数库
 *
 * @author           起梵 
 * @license          http://www.qifan.co
 * @lastmodify       2018-03-18
 */

//获取客户端ip
function get_real_ip(){

    $ip=false;

    if(!empty($_SERVER['HTTP_CLIENT_IP'])){
        $ip=$_SERVER['HTTP_CLIENT_IP'];
    }
    if(!empty($_SERVER['HTTP_X_FORWARDED_FOR'])){
        $ips=explode (', ', $_SERVER['HTTP_X_FORWARDED_FOR']);
        if($ip){
            array_unshift($ips, $ip);
            $ip=false;
        }
        for ($i=0; $i < count($ips); $i++){
            if(!eregi ('^(10│172.16│192.168).', $ips[$i])){
                $ip=$ips[$i];
                break;
            }
        }
    }
    return ($ip ? $ip : $_SERVER['REMOTE_ADDR']);
}


//获取ip地址
function  getIpAddress($ip){
    $ip = @file_get_contents("http://ip.taobao.com/service/getIpInfo.php?ip=".$ip);
    $ip = json_decode($ip,true);
    if($ip['data']['isp_id'] == 'local'){
        return [];
    }
    return $ip;
}

/**
 *  省市城市名称替换
 *
 * @param str string 需要替换的字符串
 * @param $ipaddr 阿里云获取IP地址数组
 * @param $type 1:替换省级  2:替换市级
 * @return string
 *
 * */

function cityReplace($str='',$ipaddr,$type=1){
    echo $str;die;
    preg_match_all('/^\[\*province:<\x{2460}-\x{2468}>+\*\]/$u',$str,$new);
    var_dump($new);die;


    $strArr = explode("[*province:",$str);
    var_dump($strArr);die;


}