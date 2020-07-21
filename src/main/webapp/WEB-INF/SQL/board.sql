select * from seq;
select * from tab;

select * from board;

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
)
