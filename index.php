<?php
/**
 * index.php 文件单一入口
 *
 * @author           起梵 
 * @license          http://www.qifan.co
 * @lastmodify       2018-05-12
 */

 
//调试模式：开发阶段设为开启true，部署阶段设为关闭false。
define('APP_DEBUG', false);

//URL模式: 0=>mca兼容模式，1=>s兼容模式，2=>REWRITE模式，3=>SEO模式。
define('URL_MODEL', '3');

//qifanphp根路径
define('QIFANPHP_PATH', dirname(__FILE__).DIRECTORY_SEPARATOR); 

//加载qifanphp框架的入口文件      
require(QIFANPHP_PATH.'qifanphp'.DIRECTORY_SEPARATOR.'qifanphp.php'); 

//创建应用
qifan_base::creat_app();