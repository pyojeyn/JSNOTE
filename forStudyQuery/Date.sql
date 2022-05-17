-- 현재월의 마지막 날짜를 가져오는 방법 
SELECT LAST_DAY(NOW());

-- 현재월의 1일을 가져오는 방법
SELECT DATE_FORMAT(CONCAT(DATE_FORMAT( NOW(),'%Y-%m'),'-1'),'%Y-%m-%d')

-- 현재월 가져오는 방법  
SELECT DATE_FORMAT(NOW(),'%m');

-- 현재월에서 2개월 후 월 가져오는 방법
SELECT DATE_FORMAT( DATE_ADD(NOW(), INTERVAL + 2 MONTH), '%m' );

-- 월로 저장되어 있는 칼럼 조회 방법   : STUDY_START_DATE 컬럼의 월이 현재 월에서 현재월+2 월 사이에 있는 데이터 조회하기. 5월~7월사이
SELECT * FROM PROD_MST WHERE DATE_FORMAT(STUDY_START_DATE, '%m') BETWEEN DATE_FORMAT( NOW(), '%m' ) AND DATE_FORMAT( DATE_ADD(NOW(), INTERVAL + 2 MONTH), '%m' );