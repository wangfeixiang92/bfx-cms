DROP TABLE IF EXISTS `qifancms_banner_type`;
CREATE TABLE `qifancms_banner_type` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;