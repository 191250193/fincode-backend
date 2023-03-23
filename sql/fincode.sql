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

create table strategy
(
    id           int
        primary key,
    name         varchar(32)                          null,
    type         varchar(32)                          null,
    is_deleted   tinyint(1) default 0                 null,
    gmt_created  datetime   default CURRENT_TIMESTAMP null,
    gmt_modified datetime   default CURRENT_TIMESTAMP null,
    func_enabled int                                  null
);

create table stock_tip_overall
(
    stock_id                int       not null,
    strategy_id             int       not null,
    industry_id             int       null,
    day_span                int       null,
    history_profit_rate     double    null,
    history_match_rate      double    null,
    industry_match_rate     double    null,
    profit_index            double    null,
    is_deleted     tinyint(1) default 0      null,
    gmt_created  datetime   default CURRENT_TIMESTAMP null,
    gmt_modified datetime   default CURRENT_TIMESTAMP null,
    profit_rate             double     null,
    match_rate              double     null,
    all_count               int        null,
    return_index            double     null,
    primary key (stock_id, strategy_id)
);

create table stock_tip_daily
(
    id           int auto_increment
        primary key,
    stock_id     int  null ,
    strategy_id  int  null ,
    type         varchar(255) null,
    trade_date   int null ,
    high         double null,
    low          double null,
    open         double null,
    close        double null,
    is_deleted   tinyint(1) default 0 null,
    gmt_created  datetime   default CURRENT_TIMESTAMP null,
    gmt_modified datetime   default CURRENT_TIMESTAMP null,
    ext_info     varchar(255) null,
    next_day_open double null,
    next_day_date int null,
    is_hit        int null
);

create table stock_tip_data
(
    id           int auto_increment
        primary key,
    sell_tip_id  int null,
    buy_tip_id   int null,
    profit_rate  double null,
    stock_id     int null,
    strategy_id  int null,
    buy_in_date  int null,
    sell_out_date int null
);

