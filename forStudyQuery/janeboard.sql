

CREATE database janeboard;

use janeboard ;

CREATE table user(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id varchar(20) not null,
	user_pw varchar(100) not null,
	user_nkname varchar(20) not null,
	user_regdate date default now()
);

-- DROP table user;

INSERT INTO user (user_id, user_pw, user_nkname) values ("jane", "1234", "jennyboo");
INSERT INTO user (user_id, user_pw, user_nkname) values ("hoon", "1234", "prince");
SELECT * FROM user;
DELETE FROM user WHERE id=73;
alter table user modify user_id varchar(20) unique not null;
alter table user add user_hobby varchar(100);


CREATE table board(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	writer VARCHAR(50) not null, 
	title varchar(50) not null,
	content text not null,
	board_regdate date default now(),
	FOREIGN KEY(writer) REFERENCES user(user_id)
	ON UPDATE CASCADE
);

select * from board;
select * from board where writer='java'; -- 글쓴이로 꺼내오기.
select * from board where id='8'; -- 리스트에서 클릭하면 아이디로 꺼내올기.
insert into board (title,content,writer) values("안녕","첫번쨰글","black");

SELECT * FROM user WHERE user_regdate BETWEEN DATE_FORMAT( NOW(), '%m' ) AND DATE_FORMAT( DATE_ADD(NOW(), INTERVAL + 2 MONTH), '%m' );

SELECT COUNT(*) AS TOTALCNT FROM board; -- 	총 글의 개수! 
SELECT * FROM board LIMIT 5; -- 처음부터 5번째 까지 
SELECT * FROM board ORDER BY id DESC LIMIT 5; -- 최신순으로 5개까지 !!
SELECT * FROM board LIMIT 0,10; -- 첫번째부터 10개까지 가져와.
SELECT * FROM board ORDER BY id DESC LIMIT 10,15; -- 최신 순으로 10번째부터 15째 글 가져와,

-- drop table board;

-- ====================================================================================================================================
 


-- 자가 복사 (SELF COPY) 페이징 테스트를 위해
-- 자가 복사를 이용하면 테이블에 저장된 데이터 *2 만큼의 데이터가 INSERT 됨. 
INSERT INTO board(writer, title, content) SELECT writer , title , content FROM board;


-- LEFT OUTER JOIN : 각 테이블의 중복되는 값과, A테이블에만 있는 값만을 가지고 온다. 
select * from user u left outer join board b on u.user_id = b.writer;

-- RIGHT OUTER JOIN : 각 테이블의 중복되는 값과 B 테이블에 있는 값만을 가지고 온다.
select * from board b right outer join `user` u on b.writer = u.user_id;

select * from board b inner join `user` u on b.writer = u.user_id;


select * from user;
SELECT id,user_id, user_pw, user_nkname, user_regdate, user_hobby
        FROM user
        WHERE user_id = '미주'
          



delete from user where user_id in ('배개', 'burger') AND user_hobby = '1,4' ;

select * from board; -- 0620 게시판에 파일 업로드 할 것임.

CREATE TABLE board_file(
	idx INT NOT NULL AUTO_INCREMENT COMMENT '파일 번호 (PK)',
	board_id INT NOT NULL COMMENT '게시글 번호 (FK)',
	original_name varchar(300) NOT NULL COMMENT '원본 파일',
	save_name VARCHAR(40) NOT NULL COMMENT '저장 파일명',
    size INT NOT NULL COMMENT '파일 크기',
    delete_yn ENUM('Y', 'N') NOT NULL DEFAULT 'N' COMMENT '삭제 여부',
    insert_time DATETIME NOT NULL DEFAULT NOW() COMMENT '등록일',
    delete_time DATETIME NULL COMMENT '삭제일',
    PRIMARY KEY (idx)
) comment '첨부파일';

alter table board_file add constraint fk_attach_board_id foreign key (board_id) references board(id);

select * from board_file;
select * from board;
