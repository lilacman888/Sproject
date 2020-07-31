select * from seq;
select * from tab;

select * from board;

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