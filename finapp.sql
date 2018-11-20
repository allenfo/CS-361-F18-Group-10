CREATE TABLE `fin_people` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `numacct` int(4) DEFAULT NULL,
  `annual_inc` int(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `numacct` (`finacct`),
  FOREIGN KEY (`finacct`) REFERENCES `fin_acct` (`acct_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;


CREATE TABLE `fin_acct` (
  `acct_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `acct_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`acct_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;


CREATE TABLE `fin_acct_info` (
  `aid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `fin_year` int (4) NOT NULL DEFAULT '1980',
  `month_name` varchar(20) NOT NULL DEFAULT '0',
  `spending_food` int (11) NOT NULL DEFAULT '0',
  `spending_housing`(11) NOT NULL DEFAULT '0',
  `spending_insurance` (11) NOT NULL DEFAULT '0',
  `spending_utilities` (11) NOT NULL DEFAULT '0',
  `spending_medical` (11) NOT NULL DEFAULT '0',
  `spending_misc` (11) NOT NULL DEFAULT '0'
  PRIMARY KEY (`aid`,`uid`),
  KEY `uid` (`uid`),
  FOREIGN KEY (`aid`) REFERENCES `fin_acct` (`acct_id`),
  FOREIGN KEY (`uid`) REFERENCES `fin_people` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;