--20140921修改Product表
alter table Product add  material varchar(50);
alter table Product add  origin varchar(50);
alter table Product add   size varchar(50);
alter table Product add   comcode  char(8) after userid ;
alter table Product add   imgpath  varchar(100) after img ;
alter table Product add   price  double after img ;

--20140927增加订单表orderform
--drop table orderform
CREATE TABLE orderform (
id INT(11) NOT NULL AUTO_INCREMENT,
ordersize     varchar(50),
orderquality  double, --货物数量
orderamount   double, --订单价格
realamount    double, --实际价格
customercode  varchar(20), --客户代码
customername  varchar(100), --客户名称
customertel   varchar(50),
customeraddress  varchar(200),
addTime DATETIME,  --订单时间
status  char(2),   --订单状态
userId INT(11),    --订单处理人
comcode char(8),    --供应商代码
productid   INT(11),
productname VARCHAR(100),
productcontent VARCHAR(21845),
productimg VARCHAR(100),
sequence INT(11),
productCategoryId INT(11),
PRIMARY KEY (id) )
ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;;

--20141010增加车间表
drop table  workshop ;
CREATE TABLE workshop
( 
    id INT(11) NOT NULL AUTO_INCREMENT COMMENT '车间ID',
    name varchar(100)  COMMENT '车间名称', 
    managerid int(11) COMMENT '车间主任ID',
    managername varchar(255) COMMENT '车间主任名称', 
    tel varchar(100) COMMENT '车间电话', 
    qq varchar(100) COMMENT '车间qq', 
    valid varchar(100) COMMENT '车间有效标志位', 
    remark varchar(100) COMMENT '车间备注',
    PRIMARY KEY  (id)
)ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--20141010增加生产任务表
drop table  productionTask ;
CREATE TABLE productionTask
( 
    id INT(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
    orderfromid int(11) NOT NULL, 
    workshopid int(11) not null,
    status   char(1) ,--生产任务状态
    addTime DATETIME,  --插入时间
    endTime DATETIME,  --完成时间
    operateuserid   varchar(50),    --操作员
    operateusername   varchar(50),
    comcode varchar(50),
    valid varchar(100) ,  -- '生产任务有效标志位', 
    remark varchar(100) , -- '生产任务备注',
    PRIMARY KEY  (id)
)ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;