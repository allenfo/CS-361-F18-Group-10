CREATE TABLE `fin_people` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `annual_inc` int(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
  )ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

INSERT INTO fin_people (user_id,fname,lname,address,age,annual_inc) VALUES (1,'Mike','Alpha','Sanfrancisco CA',30,80000);

CREATE TABLE `fin_acct` (
  `acct_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `acct_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`acct_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

INSERT INTO fin_acct (acct_id,name,acct_type) VALUES (1,'Wells Fargo','Bank');

CREATE TABLE `fin_acct_info` (
  `aid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `fin_year` int (4) NOT NULL DEFAULT '1980',
  `month_name` varchar(20) NOT NULL DEFAULT '0',
  `s_date` DATE NOT NULL,
  `category` varchar(30) NOT NULL,
  `spending` int (11) NOT NULL DEFAULT '0', 
  FOREIGN KEY (`aid`) REFERENCES `fin_acct` (`acct_id`),
  FOREIGN KEY (`uid`) REFERENCES `fin_people` (`user_id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;


INSERT INTO fin_acct_info (aid,uid,fin_year,month_name, s_date, category,spending) VALUES 
  (1,1, 2018, 'October', '2018-10-01','food',59),(1,1,2018,'October','2018-10-04','housing',1200),(1,1,2018,'October','2018-10-04','insurance',80),
  (1,1,2018,'October','2018-10-06','utilities',110),(1,1,2018,'October','2018-10-07','misc',54),(1,1,2018,'October','2018-10-11','food',63),(1,1, 2018, 'October', '2018-10-13','food',54),(1,1, 2018, 'October', '2018-10-24','food',70),
  (1,1, 2018, 'October', '2018-10-16','misc',48),(1,1, 2018, 'October', '2018-10-21','misc',52),
  (1,1, 2018, 'November', '2018-11-02','food',50),(1,1,2018,'November','2018-11-04','housing',1200),(1,1,2018,'November','2018-11-04','insurance',80),
  (1,1,2018,'November','2018-11-08','utilities',100),(1,1,2018,'November','2018-11-08','misc',60),(1,1,2018,'November','2018-11-09','food',80),(1,1, 2018, 'November', '2018-11-15','food',55),(1,1, 2018, 'November', '2018-11-21','food',78),
  (1,1, 2018, 'November', '2018-11-14','misc',42),(1,1, 2018, 'November', '2018-11-20','misc',50);

