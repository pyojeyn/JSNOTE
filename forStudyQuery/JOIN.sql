-- LEFT OUTER JOIN : 각 테이블의 중복되는 값과, A테이블에만 있는 값만을 가지고 온다. 
select * from user u left outer join board b on u.user_id = b.writer;

-- RIGHT OUTER JOIN : 각 테이블의 중복되는 값과 B 테이블에 있는 값만을 가지고 온다.
select * from board b right outer join `user` u on b.writer = u.user_id;
