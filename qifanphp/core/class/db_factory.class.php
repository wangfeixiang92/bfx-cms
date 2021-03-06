<?php
/**
 * db_factory.class.php 数据库工厂类
 *
 * @author           起梵 
 * @license          http://www.qifan.co
 * @lastmodify       2016-08-16 
 */
 
defined('IN_QIFANPHP') or exit('Access Denied');

class db_factory {
	
	public static $instances = null;
	public static $class = null;
	

	private function __construct() {
	}
	
	/**
	 * 返回当前终级类对象的实例
	 * @return object
	 */
	public static function get_instance() {
		if(self::$instances==null){
			self::$instances = new self();
			switch(C('db_type')) {
				case 'mysql' :
					qifan_base::load_sys_class('db_mysql','',0);
					self::$class = 'db_mysql';
					break;
				case 'mysqli' : 
					qifan_base::load_sys_class('db_mysqli','',0);
					self::$class = 'db_mysqli';
					break;
				case 'pdo' : 
					qifan_base::load_sys_class('db_pdo','',0);
					self::$class = 'db_pdo';
					break;
				default :
					qifan_base::load_sys_class('db_mysql','',0);
					self::$class = 'db_mysql';
			}
		}
		
		return self::$instances;
	}

	
	/**
	 * 初始化数据库驱动
	 * @return object
	 */
	public function connect($tabname) {		
		return new self::$class(array('db_host'=>C('db_host'), 'db_user'=>C('db_user'), 'db_pwd'=>C('db_pwd'), 'db_name'=>C('db_name'), 'db_port'=>C('db_port'), 'db_prefix'=>C('db_prefix')), $tabname);
	}
}
?>