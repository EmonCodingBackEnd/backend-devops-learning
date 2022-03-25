drop table if exists pe_user;
create table if not exists pe_user
(
    id        int auto_increment primary key,
    username  varchar(32) not null,
    password  varchar(32) not null,
    real_name varchar(32) null,
    mobile    varchar(20) null,
    email     varchar(32) null
);

drop table if exists pe_teacher;
create table if not exists pe_teacher
(
    user_id int         not null primary key,
    intro   varchar(64) null,
    stars   int         null
);
