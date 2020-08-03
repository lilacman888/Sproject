select * from seq;
select * from tab;

select * from board;
select to_char(board_reg_date,'HH24:mi:ss') from board;

drop table board;

SELECT TO_CHAR(cast(board_reg_date as timestamp) at time zone 'UTC', 'dd-mon-yyyy hh24:mi:ss.ff tzr') FROM board;
create table board(
	board_num number primary key,		-- key
	board_writer varchar2(20) not null,
	board_subject varchar2(50) not null,
	board_content varchar2(2000) not null,
	board_readcount number default 0,
	board_ref number not null,
	board_re_step number not null,
	board_re_level number not null,
	board_reg_date date not null,
	board_del char(1)
);

insert into board values((select nvl(max(board_num),0) + 1 from board),'TEST', 'TEST','TEST',0,(select nvl(max(board_num),0) + 1 from board),0,0,sysdate,'n');
commit;
create table board5 (
	num number primary key, -- key
	writer varchar2(20) not null, -- 작성자
	subject varchar2(50) not null, -- 제목
	content varchar2(500) not null, -- 본문
	email varchar2(30) , -- 이메일
	readcount number default 0, -- 읽은 횟수
	passwd varchar2(12) not null, -- 암호
	ref number not null, -- 답변글끼리 그룹
	re_step number not null, -- ref내의 순서
	re_level number not null, -- 들여쓰기
	ip varchar2(20) not null, -- 작성자 ip
	reg_date date not null, -- 작성일
	del char(1)
);
update board set readcount = 51 where num = 250;


select * from board5;




drop table joindb purge;

/* 화원가입 */
CREATE TABLE joindb (
	code NUMBER(20) NOT NULL, 
	join_id VARCHAR2(20) NOT NULL, /* 회원아이디 */
	passwd1 VARCHAR2(10) NOT NULL, /* 회원비번 */
	passwd2 VARCHAR2(10), /* 회원비번확인 */
	join_name VARCHAR2(10) NOT NULL, /* 성명 */
	join_date VARCHAR2(7) NOT NULL, /* 생년월일 */
	join_num VARCHAR2(8) NOT NULL, /* 주민번호 뒷자리 */
	addr_num VARCHAR2(10), /* 우편번호 */
	addr1 VARCHAR2(50), /* 주소 */
	addr2 VARCHAR2(50), /* 나머지 주소 */
	tel VARCHAR2(20), /* 집전화번호 */
	phone VARCHAR2(20), /* 휴대전화번호 */
	email VARCHAR2(30), /* 이메일 */
	join_joindate date, /* 가입 날짜 */
	join_deldate date, /* 탈퇴 날짜 */	
	join_delcont  VARCHAR2(10) /* 탈퇴회원여부 */
);


create sequence join_code_seq 
increment by 1 start with 1 nocache;


insert into joindb (
	code,
	join_id,passwd1,passwd2,
	join_name,join_date,join_num,
	addr_num,addr1,addr2,
	tel,phone,email,
	join_joindate,join_deldate,join_delcont)
values(join_code_seq .nextval,
	'33333','33333','22222',
	'33333','123456','1234567',
	'18577','경기 화성시 팔탄면 3.1만세로771번길 8','7777',
	'02-7777-7777','010-7777-7777','7777@naver.com',
	sysdate,sysdate,1);

update joindb set
      passwd2='22222'
      where join_id='33333';

-- joindb.sql
select * from tab;
select * from seq;
select * from joindb;
select join_code_seq.nextval from dual;
commit;