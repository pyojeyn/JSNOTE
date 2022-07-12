-- 1. 파일에 관한 고유한 값을 hidden 값으로 보냄. 
-- 2. 기존에 있는 그 값과 수정할때 보낸 hidden 값을 비교후 수정 처리 해야함; 
			
select * from slaid; 

SELECT file_path, count(*) cnt  FROM slaid  
Group by file_path
having count(*) > 1

SELECT file_size  , count(*) cnt  FROM slaid  
Group by file_size  
having count(*) > 1