create database today;

create table lifetime_card(
	card_id int primary key auto_increment,
    date TIMESTAMP not null,
    content varchar(500) not null,
    image_path varchar(1000)
);

select * from lifetime_card;



create table gallery(
	img_id int primary key auto_increment,
    title varchar(100),
    date TIMESTAMP DEFAULT NOW(),
    image_path varchar(1000)
);

select * from gallery;

drop table gallery;




create table user(
	user_id varchar(80) primary key,
    password varchar(80) not null,
    name varchar(100) not null,
    nickname varchar(100),
    reg_date TIMESTAMP DEFAULT NOW(),
    session_id VARCHAR(80) NOT NULL DEFAULT 'none',
    limit_time TIMESTAMP
);





create table pet(
	pet_id int primary key auto_increment,
    user_id varchar(80),
    pet_name varchar(100) not null,
    age int not null,
    gender VARCHAR(10) NOT NULL CHECK (gender IN ('남', '여')),
    feature varchar(300),
    image_path varchar(1000),
    foreign key (user_id) references user(user_id)
);

select * from user;


