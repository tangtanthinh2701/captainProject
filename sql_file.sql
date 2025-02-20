create database captainProject;
use captainProject;
create table User(
	id varchar(11) not null,
    userName varchar(50) not null,
    password text not null,
    email varchar(50),
    primary key(id)
);
create table Video(
	id varchar(11) not null,
    caption text,
    hashtag text,
    creatorId varchar(11) not null,
    updateTime datetime,
    videoUrl text,
    format text,
    view bigint,
    reaction bigint,
    comment bigint,
    favorite bigint,
    share bigint,
    isTrend boolean,
    status boolean,
    primary key(id),
    constraint fk_creatorId foreign key(creatorId) references User(id)
);
create table Condition_crawl(
	id varchar(11) not null,
    conditionName text,
    properties text,
    primary key(id)
);
create table Project_condition(
	id varchar(11) not null,
    projectId varchar(11) not null,
    conditionId varchar(11) not null,
    primary key(id)
);
alter table Project_condition add constraint fk_projectId foreign key(projectId) references Project(id);
alter table Project_condition add constraint fk_conditionId foreign key(conditionId) references Condition_crawl(id);
create table Project(
	id varchar(11) not null,
    title text,
    creatorId varchar(11) not null,
    primary key(id)
);
alter table Project add constraint fk_contentcreatorId foreign key(creatorId) references User(id);
create table Topic(
	id varchar(11) not null,
    topicName text,
    primary key(id)
);
create table Topic_video(
	id varchar(11) not null,
    topicId varchar(11) not null,
    videoId varchar(11) not null,
    primary key(id),
    constraint fk_topicId foreign key(topicId) references Topic(id),
    constraint fk_videoId foreign key(videoId) references Video(id)
);