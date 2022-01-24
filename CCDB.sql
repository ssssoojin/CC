use ccdb;
create Table Member(
        userId varchar(40) primary key,
    userPwd varchar(40),
    userName varchar(40),
    userSex varchar(40),
    userBrith datetime,
    userEmail varchar(1000),
    userImage varchar(100)
);

create table Product(
	itemNo integer primary key auto_increment,
    category int,
    itemName varchar(100),
    price int default 0,
    image varchar(100)
);

create table cart(
        cartNo int primary key auto_increment,
        userId varchar(40),
        itemName varchar(100),
        color varchar(40),
        size varchar(40),
        quantity int default 1,
        price int,
        category int,
        image varchar(100),
        foreign key(userId) references member(userId) on delete cascade
);

insert into cart(userId,itemName,color, size,quantity,price,category,image) value('conan','aafsafaa','dsd','L',2,5000,1,'short_tshirt.png');
desc cart;
create table feed(
feedNo integer primary key auto_increment,
title varchar(300),
description varchar(1000),
imgTop varchar(100),
imgBottom varchar(100),
imgAccCustom varchar(100),
imgAccReal varchar(100),
color varchar(40),
size varchar(40),
regDate datetime default now(),
updateDate datetime default now(),
userId varchar(40) references member(userId) on delete cascade,
hit integer default 0);

create table payment(
        payNo varchar(40) primary key, 
        userId varchar(40),
        payDate datetime default current_timestamp,
        price int,
        images varchar(100),
        Recipient varchar(40),
        phone varchar(40),
        address varchar(100),
        detailaddress varchar(100),
        deliveryMemo varchar(300),
        foreign key(userId) references member(userId) on delete cascade
);

create table paymentItem(
	payNo varchar(40), 
	userId varchar(40),
	category int,
    image varchar(100),
    size varchar(40),
	color varchar(40),
    foreign key(userId) references member(userId) on delete cascade,
    foreign key(payNo) references payment(payNo) on delete cascade
);

select * from paymentItem;
desc payment;
update payment set Recipient="코난";

insert into payment(payNo, userId,price,images,phone,address,detailaddress,deliveryMemo) value('conansPayment','conan',15000,"short_tshirt.png/roseClip.png/hairBand.png","010-1234-0000","서울시","강남","문 앞에 놓아주세요");
insert into paymentItem value('conansPayment','conan',1,'short_tshirt.png','small','red');
insert into paymentItem value('conansPayment','conan',2,'pants.png','small','red');
insert into paymentItem value('conansPayment','conan',3,'hairBand.png','small','red');
insert into paymentItem value('conansPayment','conan',4,'roseClip.png','small','red');
delete from paymentitem where category=1;
drop table feed;
select * from cart;