SELECT COUNT(*) AS TOTALCNT FROM board; -- 	총 글의 개수! 
SELECT * FROM board LIMIT 5; -- 처음부터 5번째 까지 
SELECT * FROM board ORDER BY id DESC LIMIT 5; -- 최신순으로 5개까지 !!
SELECT * FROM board LIMIT 0,10; -- 첫번째부터 10개까지 가져와.
SELECT * FROM board ORDER BY id DESC LIMIT 10,15; -- 최신 순으로 10번째부터 15째 글 가져와