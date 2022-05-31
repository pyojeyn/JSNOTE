
-- 자가 복사 (SELF COPY) 페이징 테스트를 위해
-- 자가 복사를 이용하면 테이블에 저장된 데이터 *2 만큼의 데이터가 INSERT 됨. 
INSERT INTO board(writer, title, content) SELECT writer , title , content FROM board;