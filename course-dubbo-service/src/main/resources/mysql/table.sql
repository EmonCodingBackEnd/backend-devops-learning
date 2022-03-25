drop table if exists pe_course;
create table if not exists pe_course
(
    id          int auto_increment primary key,
    title       varchar(64)  null,
    description varchar(512) null
);

drop table if exists pr_user_course;
create table if not exists pr_user_course
(
    user_id   int not null,
    course_id int not null,
    primary key (user_id, course_id)
);


