drop database if exists `fincode`;
create database `fincode` default CHARACTER set utf8;
use `fincode`;
drop table if exists `user`;
drop table if exists `stock_detail`;
drop table if exists `stock`;
drop table if exists `industry`;
create table user
(
    id           int unsigned auto_increment          not null
        primary key,
    passport     varchar(255)                         null,
    password     varchar(255)                         null,
    salt         varchar(255)                         null,
    nickname     varchar(255)                         null,
    gmt_created  datetime   default CURRENT_TIMESTAMP null,
    gmt_modified datetime   default CURRENT_TIMESTAMP null
);


create table industry
(
    id           int                                  not null
        primary key,
    name         varchar(255)                         null,
    is_deleted   tinyint(1) default 0                 null,
    gmt_created  datetime   default CURRENT_TIMESTAMP null,
    gmt_modified datetime   default CURRENT_TIMESTAMP null
);


create table stock
(
    id           int unsigned auto_increment
        primary key,
    name         varchar(32)                          null,
    ts_code      varchar(32)                          null,
    industry_id  int                                  null,
    is_deleted   tinyint(1) default 0                 null,
    gmt_created  datetime   default CURRENT_TIMESTAMP null,
    gmt_modified datetime   default CURRENT_TIMESTAMP null,
    constraint stock_industry_id_fk
        foreign key (industry_id) references industry (id)
);

create table stock_detail
(
    id           int auto_increment
        primary key,
    stock_id     int unsigned                         null,
    name         varchar(32)                          null,
    enname       varchar(255)                         null,
    ts_code      varchar(32)                          null,
    list_date    varchar(32)                          null,
    area         varchar(32)                          null,
    industry_id  int                                  null,
    is_deleted   tinyint(1) default 0                 null,
    gmt_created  datetime   default CURRENT_TIMESTAMP null,
    gmt_modified datetime   default CURRENT_TIMESTAMP null,
    ext_info     text                                 null,
    constraint stock_detail_stock_fk
        foreign key (stock_id) references stock (id)
);

drop table if exists `stock_price`;
create table stock_price
(
    id        bigint auto_increment
        primary key,
    amount    double      null,
    `change`  double      null,
    close     double      null,
    high      double      null,
    low       double      null,
    open      double      null,
    companyId varchar(32) null,
    pct_chg   double      null,
    pre_close double      null,
    vol       double      null,
    time      int         null
);


-- fincode.stock_followed definition
drop table if exists `stock_followed`;
CREATE TABLE `stock_followed` (
  `id`          int unsigned    auto_increment NOT NULL,
  `user_id`     int unsigned    NOT NULL,
  `stock_id`    int unsigned    NOT NULL,
  `is_deleted`  tinyint(1)      default 0 NOT NULL,
  gmt_created  datetime   default CURRENT_TIMESTAMP NULL,
  gmt_modified datetime   default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL,

  PRIMARY KEY (`id`),

  KEY `fk_stock_id` (`stock_id`),
  CONSTRAINT `fk_stock_id` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
