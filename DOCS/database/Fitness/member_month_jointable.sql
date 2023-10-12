SELECT * FROM db_fitness.member_information;

SELECT NAME, ADDRESS, GENDER_ID, JOIN_DATE FROM db_fitness.member_information;

-- * 전체 남자회원과 여자회원의 수
SELECT '남자' as `gender`, COUNT(*) AS gender_count
FROM member_information
WHERE gender_id LIKE '%01'
UNION
SELECT '여자' as `gender` ,COUNT(*) AS gender_count
FROM member_information
WHERE gender_id LIKE '%02';


-- * 월별 남여 회원가입 수
SELECT
    CASE
        WHEN gender_id = 'GEN01' THEN '남자'
        WHEN gender_id = 'GEN02' THEN '여자'
    END AS `gender`,
    DATE_FORMAT(join_date, '%Y-%m') AS join_month,
    COUNT(*) AS join_count
FROM member_information
GROUP BY
    CASE
        WHEN gender_id = 'GEN01' THEN '남자'
        WHEN gender_id = 'GEN02' THEN '여자'
    END,
    DATE_FORMAT(join_date, '%Y-%m')
ORDER BY
    `gender`, join_month;

