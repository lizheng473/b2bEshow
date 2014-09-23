--20140921ÐÞ¸ÄProduct±í
alter table Product add  material varchar(50);
alter table Product add  origin varchar(50);
alter table Product add   size varchar(50);
alter table Product add   comcode  char(8) after userid ;
alter table Product add   imgpath  varchar(100) after img ;
alter table Product add   price  double after img ;