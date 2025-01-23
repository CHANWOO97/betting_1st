-- 계정 생성 및 권한 부여
alter session set "_ORACLE_SCRIPT"=true;
create user betman identified by betting;
grant dba to betman;

CREATE SEQUENCE user_seq
START WITH 1
INCREMENT BY 1
NOCACHE;
drop SEQUENCE user_seq;
-- 유저(회원/관리자) 테이블
drop table users;
CREATE TABLE users (
--  userid number DEFAULT user_seq.nextval primary key, -- 시퀀스로 자동 증가 (불필요함)
    userid varchar2(50) primary key,       -- user id
    password varchar2(100) not null, -- user password
    username varchar2(100) not null,
    address varchar2(50) not null,
    tel varchar2(50) not null,
    email varchar2(100),
    reg_date date default SYSDATE,
    user_role varchar2(20) default 'user', -- user / admin 으로 회원과 관리자를 나눔
    point number default 100000, -- point 유저가 회원가입시 가지고 있는 point
    del char(1) default 'n'
);
update users set del = 'n' where userid='k2';
update users set point = 100000 where userid='k1';
ALTER TABLE users MODIFY (point DEFAULT 100000);
select * from users;
insert into users (userid, password, username,  tel, address, email) values('k1', '1', 'test', '010-1234-1234', '안산', 'test@gmail.com');
insert into users (userid, password, username, tel, address, email, user_role) values('master', '1234', 'test', '010-1234-5678', '안산', 'master@gmail.com','admin');

create table board (
	num number primary key, -- key
	id varchar2(50),       -- users id
	subject varchar2(50) not null, -- 제목
	content varchar2(500) not null, -- 본문
	readcount number default 0, -- 읽은 횟수
--	password varchar2(100) not null, -- 암호
--	ref number not null, -- 답변글끼리 그룹
--	re_step number not null, -- ref내의 순서
--	re_level number not null, -- 들여쓰기
	reg_date date not null, -- 작성일
	del char(1) default 'n'
);
select * from board;

select count(*) from board;


CREATE TABLE games (
    gameid NUMBER PRIMARY KEY ,               -- 경기 ID (고유 번호)
    hometeam VARCHAR2(100) NOT NULL,         -- 홈 팀 이름
    awayteam VARCHAR2(100) NOT NULL,         -- 원정 팀 이름
    gamedate DATE NOT NULL,                  -- 경기 날짜
    gametime VARCHAR2(10) NOT NULL,          -- 경기 시간 (HH:MM 형식)
    sporttype VARCHAR2(50) NOT NULL,         -- 종목 (축구, 농구 등)
    status VARCHAR2(20) DEFAULT 'scheduled',  -- 경기 상태 (예: scheduled, completed)
    gameresult varchar2(20),				 -- 게임의 결과값
    userselect varchar2(20) default 'n',				-- user 선택값
    created DATE DEFAULT SYSDATE,           -- 등록일
    del char(1) default 'n'					-- 삭제
);
alter table games add userselect varchar(20) DEFAULT 'n';

-- bet 대한 결과 테이블은 보류
select hometeam, awayteam, sporttype, gamedate, gametime, gameresult, s.* 
from sale s, games g   
where userid = 'k1' and s.gameid = g.gameid and s.result='확정'    
order by saledate desc;

select * from games where gameid = 25;
update games set status = 'completed' where gameid = 26;
drop table games;
drop SEQUENCE game_seq;

CREATE SEQUENCE game_seq -- 경기 ID를 자동으로 증가시키기 위한 시퀀스.
START WITH 1
INCREMENT BY 1
NOCACHE;

INSERT INTO games (gameid, hometeam, awayteam, gamedate, gametime, sporttype)
VALUES (game_seq.NEXTVAL, '수원FC', '서울E', TO_DATE('2024-12-30', 'YYYY-MM-DD'), '18:00', '축구');

INSERT INTO games (gameid, hometeam, awayteam, gamedate, gametime, sporttype)
VALUES (game_seq.NEXTVAL, 'KT 소닉붐', '울산 모비스', TO_DATE('2024-12-31', 'YYYY-MM-DD'), '19:00', '농구');

INSERT INTO games (gameid, hometeam, awayteam, gamedate, gametime, sporttype)
VALUES (game_seq.NEXTVAL, '대구', '충남아산', TO_DATE('2025-01-02', 'YYYY-MM-DD'), '14:00', '축구');

INSERT INTO games (gameid, hometeam, awayteam, gamedate, gametime, sporttype)
VALUES (game_seq.NEXTVAL, '서울E', '전북', TO_DATE('2025-01-03', 'YYYY-MM-DD'), '16:00', '축구');


select * from games;
------------------------------------------------------------------------------------------------------------
-- product table 장바구니 테이블
drop table payment;

CREATE SEQUENCE pay_seq -- 장바구니 ID를 자동으로 증가시키기 위한 시퀀스.
START WITH 1
INCREMENT BY 1
NOCACHE;


--create table payment(
--	payid number default pay_seq.nextval primary key,
--	saleid number, 	userid varchar2(50), gameid number,
--	price number not null,
--	paytime date default sysdate not null, -- 구매 시간
--	foreign key(saleid) references sale(saleid),
--	foreign key(userid) references users(userid),
--	foreign key(gameid) references games(gameid)
--);

------------------------------------------------------------------------------------------------------------
-- sale table 구매테이블
drop table sale;
drop sequence sale_seq;
CREATE SEQUENCE sale_seq -- 장바구니 ID를 자동으로 증가시키기 위한 시퀀스.
START WITH 1
INCREMENT BY 1
NOCACHE;

create table sale (
	saleid number default sale_seq.nextval primary key,
	userresult varchar2(20) not null, -- user의 승무패의 결과
	result varchar(20) default '미정',-- 게임 구매 확정 결과 (미정/확정)
	checked varchar(20) default 'n', -- 게임 적중 결과
	saledate DATE,
	salepoint number default 0, -- 게임 구매 포인트 
	userid varchar2(50) references users(userid),
	gameid number references games(gameid)
);

alter table sale add checked varchar(20) default 'n';
update sale set checked = 'y' where saleid = 4;

select * from users;
select * from sale;

select hometeam, awayteam, sporttype, s.* from sale s, games g
		where userid = 'k1' and s.gameid = g.gameid 
	 	order by saleid desc
		offset 1 rows fetch first 10 rows only;
select hometeam, awayteam, sporttype, gamedate, gametime, point, s.* from sale s, games g, users u  
		where s.gameid = g.gameid and s.userid = u.userid and u.userid = 'k1'   
		order by s.saleid desc  offset 1 rows fetch first 10 rows only

select * from sale where userid = 'k1';
delete from sale;
delete from sale where saleid = 1;
select * from games;

select hometeam, awayteam, sporttype, gamedate, gametime, gameresult, s.* from sale s, games g
where userid = 'k1' and s.gameid = g.gameid and s.result='확정'
order by saledate desc;



select	g.*, s.saleid
		from games g, sale s
		where status = 'scheduled' and g.gameid = s.gameid
		order by gamedate desc, gametime desc
		offset 0 rows fetch first 10 rows only;
		
select * from games where gameid = 24;
select * from sale where gameid = 24;

select hometeam, awayteam, sporttype, gamedate, gametime, gameresult, s.* from sale s, games g
		where s.gameid = g.gameid and s.result='확정'
	 	order by saleid desc
		offset 1 rows fetch first 10 rows only
		
select password from users;
 zFlLyp
