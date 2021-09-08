use jpp;
-- query to create the new branch
CREATE TABLE if not exists `jpp`.`tbl_branch` (
  `pk_branchId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `licenseNo` varchar(100) NOT NULL,
  `managerId` int(11) NOT NULL,
  `phoneNo` varchar(20) NOT NULL,
  `emailId` varchar(50) NULL,
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '0-INACTIVE 1-ACTIVE',
  `approved` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-NOT APPROVED 1-APPROVED BY MANAGER',
  `createdBy` int(11) NOT NULL,
  `createdAt` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedAt` DATETIME ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pk_branchId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

desc tbl_branch;