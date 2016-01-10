SET FOREIGN_KEY_CHECKS=0;
truncate table aggregatecolumn;
truncate table aggregatecolumn_map_aggregateitem;
truncate table aggregateitem  ;
truncate table piaggregate  ;
truncate table aggregateitemtype_map_aggregateitem ;
truncate table piaggregate_map_aggregatecolumn  ;
truncate table tag_map_aggregateitem  ;
SET FOREIGN_KEY_CHECKS=1;


CREATE TABLE `asset` (
 `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(256) NOT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

CREATE TABLE `picontent_map_image` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `assetid` tinyint(3) unsigned NOT NULL,
  `picontentid` tinyint(3) NOT NULl,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`assetid`) REFERENCES `asset` (`id`),
  FOREIGN KEY (`picontentid`) REFERENCES `picontent` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
