-- *실행 전제조건 
-- company table이 존재해야함
-- total_people table이 존재해야함(서울시 지자체별 인구수 데이터)


CREATE TABLE `db_fitness`.`count1_table` (
  `local` VARCHAR(500) NULL,
  `people_count` VARCHAR(500) NULL,
  `company_count` VARCHAR(500) NULL);


INSERT INTO db_fitness.count_table(local, people_count, company_count)
SELECT 
    t.`행정구역`,
    t.`총 인구수`,
    c.company_count
FROM 
    db_fitness.total_people t
LEFT JOIN 
(
    -- 지역구별로 회사 수를 계산하는 하위 쿼리
    SELECT 
        CASE 
            WHEN ADDRESS LIKE '%종로구%' THEN '종로구'
            WHEN ADDRESS LIKE '%중구%' THEN '중구'
            WHEN ADDRESS LIKE '%용산구%' THEN '용산구'
            WHEN ADDRESS LIKE '%성동구%' THEN '성동구'
            WHEN ADDRESS LIKE '%광진구%' THEN '광진구'
            WHEN ADDRESS LIKE '%동대문구%' THEN '동대문구'
            WHEN ADDRESS LIKE '%중랑구%' THEN '중랑구'
            WHEN ADDRESS LIKE '%성북구%' THEN '성북구'
            WHEN ADDRESS LIKE '%강북구%' THEN '강북구'
            WHEN ADDRESS LIKE '%도봉구%' THEN '도봉구'
            WHEN ADDRESS LIKE '%노원구%' THEN '노원구'
            WHEN ADDRESS LIKE '%은평구%' THEN '은평구'
            WHEN ADDRESS LIKE '%서대문구%' THEN '서대문구'
            WHEN ADDRESS LIKE '%마포구%' THEN '마포구'
            WHEN ADDRESS LIKE '%양천구%' THEN '양천구'
            WHEN ADDRESS LIKE '%강서구%' THEN '강서구'
            WHEN ADDRESS LIKE '%구로구%' THEN '구로구'
            WHEN ADDRESS LIKE '%금천구%' THEN '금천구'
            WHEN ADDRESS LIKE '%영등포구%' THEN '영등포구'
            WHEN ADDRESS LIKE '%동작구%' THEN '동작구'
            WHEN ADDRESS LIKE '%관악구%' THEN '관악구'
            WHEN ADDRESS LIKE '%서초구%' THEN '서초구'
            WHEN ADDRESS LIKE '%강남구%' THEN '강남구'
            WHEN ADDRESS LIKE '%송파구%' THEN '송파구'
            WHEN ADDRESS LIKE '%강동구%' THEN '강동구'
        END AS district,
        COUNT(*) AS company_count
    FROM 
        COMPANY
    GROUP BY 
        CASE 
            WHEN ADDRESS LIKE '%종로구%' THEN '종로구'
            WHEN ADDRESS LIKE '%중구%' THEN '중구'
            WHEN ADDRESS LIKE '%용산구%' THEN '용산구'
            WHEN ADDRESS LIKE '%성동구%' THEN '성동구'
            WHEN ADDRESS LIKE '%광진구%' THEN '광진구'
            WHEN ADDRESS LIKE '%동대문구%' THEN '동대문구'
            WHEN ADDRESS LIKE '%중랑구%' THEN '중랑구'
            WHEN ADDRESS LIKE '%성북구%' THEN '성북구'
            WHEN ADDRESS LIKE '%강북구%' THEN '강북구'
            WHEN ADDRESS LIKE '%도봉구%' THEN '도봉구'
            WHEN ADDRESS LIKE '%노원구%' THEN '노원구'
            WHEN ADDRESS LIKE '%은평구%' THEN '은평구'
            WHEN ADDRESS LIKE '%서대문구%' THEN '서대문구'
            WHEN ADDRESS LIKE '%마포구%' THEN '마포구'
            WHEN ADDRESS LIKE '%양천구%' THEN '양천구'
            WHEN ADDRESS LIKE '%강서구%' THEN '강서구'
            WHEN ADDRESS LIKE '%구로구%' THEN '구로구'
            WHEN ADDRESS LIKE '%금천구%' THEN '금천구'
            WHEN ADDRESS LIKE '%영등포구%' THEN '영등포구'
            WHEN ADDRESS LIKE '%동작구%' THEN '동작구'
            WHEN ADDRESS LIKE '%관악구%' THEN '관악구'
            WHEN ADDRESS LIKE '%서초구%' THEN '서초구'
            WHEN ADDRESS LIKE '%강남구%' THEN '강남구'
            WHEN ADDRESS LIKE '%송파구%' THEN '송파구'
            WHEN ADDRESS LIKE '%강동구%' THEN '강동구'
        END
) c ON t.행정구역 like concat('%', c.district, '%');

SELECT * FROM db_fitness.count_table;


-- '서울특별시 서울특별시 성동구 (1120000000)' =  '성동구'
-- '서울특별시 서울특별시 성동구 (1120000000)' like  concat('%', '성동구', '%')
-- '서울특별시 서울특별시 성동구 (1120000000)' like  '%성동구%'