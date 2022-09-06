-- WHERE 절 안에서의 CASE 문. 


-- 1
SELECT PROD_NM
    FROM PROD_MST
WHERE FR_CLASSROOM_TYPE = '003'
    AND DATE_FORMAT(PROD_STUDY_START, '%Y%M') = DATE_FORMAT(20220921, '%Y%M')
    AND DATE_FORMAT(PROD_STUDY_START, '%d') = 21
    -- 이 부분 ↓ 1번째 방법
    AND CASE WHEN PROGRAM_CATE = '001' THEN PROGRAM_CATE = '001'
    WHEN PROGRAM_CATE = 'D16014001' THEN PROGRAM_CATE = 'D16014001' END LIMIT 1

-- ***
    CASE WHEN '조건식1' THEN '결과1'
         WHEN '조건식2' THEN '결과2' 
         ELSE '결과3' 
    END


-- ================================================================================
-- 2 
SELECT PROD_NM
    FROM PROD_MST
WHERE FR_CLASSROOM_TYPE = '003'
    AND DATE_FORMAT(PROD_STUDY_START, '%Y%M') = DATE_FORMAT(20220921, '%Y%M')
    AND DATE_FORMAT(PROD_STUDY_START, '%d') = 21
    -- 이 부분 ↓ 2번째 방법
    AND CASE PROGRAM_CATE WHEN '001' THEN PROGRAM_CATE = '001'
    WHEN 'D16014001' THEN PROGRAM_CATE = 'D16014001' END LIMIT 1        

-- ***
    CASE '조건절을 걸 컬럼명' 
    WHEN '조건식1' THEN '결과1'
    WHEN '조건식2' THEN '결과2'
    ELSE '결과3'
    END

		 				