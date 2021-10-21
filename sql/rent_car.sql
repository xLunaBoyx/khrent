-- semi 계성 생성함

CREATE TABLE member (
	member_id	varchar2(20)		NOT NULL,
	member_pwd	varchar2(300)		NOT NULL,
	member_role	char(1)	DEFAULT 'U' 	NOT NULL,
	member_name	 varchar2(50)		NOT NULL,
	phone	char(11)		NOT NULL,
	mileage 	number	DEFAULT 0	NOT NULL,
	reg_date	date	DEFAULT sysdate	NOT NULL
);

ALTER TABLE member ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	member_id
);
alter table member add constraint ck_member_role check (member_role in ('U', 'A')); 

select * from member;
cde

insert into member
values (
    'honggd', '1234', 'U', '홍길동',
    '01012341234', 1000,  default
);