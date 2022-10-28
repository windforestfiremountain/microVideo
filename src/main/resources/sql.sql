drop table if exists t_admin;

drop table if exists t_user;

drop table if exists t_video;


/*==============================================================*/
/* Table: t_admin                                               */
/*==============================================================*/
create table t_admin
(
   id                   int not null auto_increment,
   name                 varchar(32),
   account              varchar(32),
   password             varchar(32),
   primary key (id)
);

alter table t_admin comment '管理员表';

insert into t_admin values (1,'管理员','admin','123');

/*==============================================================*/
/* Table: t_user                                                */
/*==============================================================*/
create table t_user
(
   id                   int not null auto_increment,
   nick_name            varchar(32),
   account              varchar(32),
   password             varchar(32),
   gender               varchar(8),
   birthday             varchar(32),
   phone                varchar(16),
   email                varchar(64),
   description          text,
   birthplace           varchar(16),
   primary key (id)
);

alter table t_user comment '普通用户表';

insert into t_user values (1,'张三','zhangsan','123','男','2002-10-10','13966668888','13966668888@qq.com','好人一个.','江苏,南京');
-- insert into t_user values (2,'李四','lisi','123','女','2003-10-10','13966668887','13966668887@qq.com','坏人一个.','广西,柳州');


/*==============================================================*/
/* Table: t_video                                               */
/*==============================================================*/
create table t_video
(
    id                   int not null auto_increment,
    name                 varchar(32),
    author               varchar(32),
    type                 varchar(32),
    create_time          varchar(32),
    time_length          int, -- 单位是分钟
    video_path           varchar(64),
    cover_path           varchar(64),
    description          text,
    primary key (id)
);

alter table t_video comment '视频表';

insert into t_video values(1,'关于我爱水群这件事','胡扯','生活','2022-10-26 19:12:10',5,'/gywasqzjs.mp4','/gywasqzjs.png','水群');
