▶ mysql 프로그래머스 레벨1 도전중

1. 상위 n개 레코드
ANIMAL_INS 테이블은 동물 보호소에 들어온 동물의 정보를 담은 테이블입니다. ANIMAL_INS 테이블 구조는 다음과 같으며, ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE는 각각 동물의 아이디, 생물 종, 보호 시작일, 보호 시작 시 상태, 이름, 성별 및 중성화 여부를 나타냅니다.

- 동물 보호소에 가장 먼저 들어온 동물의 이름을 조회하는 SQL 문을 작성해주세요.
※ 보호소에 가장 먼저 들어온 동물은 한 마리인 경우만 테스트 케이스로 주어집니다.


SELECT NAME
FROM ANIMAL_INS 
ORDER BY DATETIME
LIMIT 1;


→ LIMIT 구를 이용해 상위 N개 행만 조회
 limit 0, 1 : 위에서 0부터 1까지의 정보 추출
 limit 1 : 위에서 1개의 정보 추출



2. 어린 동물 찾기 
동물 보호소에 들어온 동물 중 젊은 동물1의 아이디와 이름을 조회하는 SQL 문을 작성해주세요. 이때 결과는 아이디 순으로 조회해주세요.
※INTAKE_CONDITION이 Aged가 아닌 경우를 뜻함 
- 오라클에서는 where 절에 != 을 넣어 주면 되는것인데 mysql에서는 <> 를 사용한다.


SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS 
WHERE INTAKE_CONDITION <>'Aged'











3. 경기도에 위치한 식품창고 목록 출력하기
FOOD_WAREHOUSE 테이블에서 경기도에 위치한 창고의 ID, 이름, 주소, 냉동시설 여부를 조회하는 SQL문을 작성해주세요. 이때 냉동시설 여부가 NULL인 경우, 'N'으로 출력시켜 주시고 결과는 창고 ID를 기준으로 오름차순 정렬해주세요.


SELECT WAREHOUSE_ID, WAREHOUSE_NAME, ADDRESS, IFNULL(FREEZER_YN, 'N') AS FREEZER_YN
FROM FOOD_WAREHOUSE 
WHERE ADDRESS LIKE CONCAT('%', '경기도' ,'%')
ORDER BY WAREHOUSE_ID ASC



4. 조건에 맞는 회원수 구하기
2021년에 가입한 회원 중 나이가 20세 이상 29세 이하인 회원은 USER_ID 가 1, 3, 5 인 회원들 이므로, 다음과 같이 결과가 나와야 합니다.


SELECT COUNT(*) AS USERS
FROM USER_INFO 
WHERE AGE >=20 AND AGE <= 29
AND YEAR(JOINED) = 2021

- YEAR()함수
 : 날짜에서 연도를 추출하는 Mysql 함수
 : 또한 아래처럼 like concat으로 찾아도 된다.

AND JOINED LIKE CONCAT ('2021','%')



5. 평균 일일 대여 요금 구하기
CAR_RENTAL_COMPANY_CAR 테이블에서 자동차 종류가 'SUV'인 자동차들의 평균 일일 대여 요금을 출력하는 SQL문을 작성해주세요. 이때 평균 일일 대여 요금은 소수 첫 번째 자리에서 반올림하고, 컬럼명은 AVERAGE_FEE 로 지정해주세요.


SELECT ROUND(AVG(DAILY_FEE)) AS AVERAGE_FEE
FROM CAR_RENTAL_COMPANY_CAR 
WHERE CAR_TYPE = 'SUV'

- AVG() 함수 : 집계함수, 평균을 구해준다.
  ● 집계함수 : COUNT(개수), SUM(총합), AVG(평균), GROUP BY(묶음)
- ROUND(숫자, 반올림할 자릿수) 함수 : 숫자를 반올림할 자릿수 + 1 자릿수에서 반올림 
         (숫자, 0 ) -> . 뒤로 올린다는 소리! 이럴땐 안써줘도 상관없다.
- TRUNCATE(숫자, 버릴 자릿수) - 숫자를 버릴 자릿수 아래로 버림 
                           - 반드시 버릴 자릿수를 명시해 주어야 함 

6. 흉부외과 또는 일반외과 의사 목록 출력하기
DOCTOR 테이블에서 진료과가 흉부외과(CS)이거나 일반외과(GS)인 의사의 이름, 의사ID, 진료과, 고용일자를 조회하는 SQL문을 작성해주세요. 이때 결과는 고용일자를 기준으로 내림차순 정렬하고, 고용일자가 같다면 이름을 기준으로 오름차순 정렬해주세요.


SELECT DR_NAME, DR_ID, MCDP_CD, DATE_FORMAT(HIRE_YMD, '%Y-%m-%d') AS HIRE_YMD
FROM DOCTOR 
WHERE MCDP_CD = 'CS' OR MCDP_CD = 'GS'
ORDER BY HIRE_YMD DESC, DR_NAME 

- 뒤의 시간을 자르고 싶다면 DATE_FORMAT을 써주면 된다. 이때 앞에 ‘%Y’ 대문자 Y로 바꿔주면 2023-01-24 이런식으로 나오게 되고 소문자 y로 쓰게 되면 23-01-24 이런식으로 나오게 된다!
- 고용일자를 기준으로 내림차순 정렬, 이름이 같다면 뒤에 이름 컬럼을 적어주되, 기본이 ASC인가보다.. 이런식으로 적는걸 보면..! (다른사람들거 보니까 ASC로 적어도 되나봄!) 이런식의 문제가 종종 등장한다... 당황하지 말고 알아두자



7. 12세 이하인 여자 환자 목록 출력하기
PATIENT 테이블에서 12세 이하인 여자환자의 환자이름, 환자번호, 성별코드, 나이, 전화번호를 조회하는 SQL문을 작성해주세요. 이때 전화번호가 없는 경우, 'NONE'으로 출력시켜 주시고 결과는 나이를 기준으로 내림차순 정렬하고, 나이 같다면 환자이름을 기준으로 오름차순 정렬해주세요.


SELECT PT_NAME, PT_NO, GEND_CD, AGE, IFNULL(TLNO, 'NONE') AS TLNO
FROM PATIENT 
WHERE AGE <= 12 AND GEND_CD = 'W'
ORDER BY AGE DESC, PT_NAME


만약 mybatis mapper.xml 에서 비교 연산자를 처리하는 방법 
                          : <=, >=, <, > 

<![CDATA[ 비교연산자 ]]> 이렇게 처리해주면 된다

<![CDATA[ 
SELECT PT_NAME, PT_NO, GEND_CD, AGE, IFNULL(TLNO, 'NONE') AS TLNO
FROM PATIENT 
WHERE AGE <= 12 AND GEND_CD = 'W'
ORDER BY AGE DESC, PT_NAME
 ]]>



8. 과일로 만든 아이스크림 고르기
상반기 아이스크림 총주문량이 3,000보다 높으면서 아이스크림의 주 성분이 과일인 아이스크림의 맛을 총주문량이 큰 순서대로 조회하는 SQL 문을 작성해주세요.


SELECT f.FLAVOR
FROM FIRST_HALF f LEFT JOIN ICECREAM_INFO i 
ON f.FLAVOR = i.FLAVOR
WHERE f.TOTAL_ORDER >  3000 
AND i.INGREDIENT_TYPE LIKE 'fruit_based'
ORDER BY f.TOTAL_ORDER DESC

- 외래키 i.FLAVOR를 조인해주고, 어지간하면 무언가를 찾을때는 like를 써주자!





9. 최댓값 구하기 
가장 최근에 들어온 동물은 언제 들어왔는지 조회하는 SQL 문을 작성해주세요.


SELECT MAX(DATETIME) AS 시간
FROM ANIMAL_INS 

– datetime도 max가 되는구나



10. 조건에 맞는 도서 리스트 출력하기
BOOK 테이블에서 2021년에 출판된 '인문' 카테고리에 속하는 도서 리스트를 찾아서 도서 ID(BOOK_ID), 출판일 (PUBLISHED_DATE)을 출력하는 SQL문을 작성해주세요.
결과는 출판일을 기준으로 오름차순 정렬해주세요.


SELECT BOOK_ID, DATE_FORMAT( PUBLISHED_DATE , '%Y-%m-%d') AS PUBLISHED_DATE
FROM BOOK
WHERE CATEGORY LIKE '인문'
AND PUBLISHED_DATE  LIKE '2021%'
ORDER BY PUBLISHED_DATE ASC







11. 자동차 대여 기록에서 장기/단기 대여 구분하기
CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 대여 시작일이 2022년 9월에 속하는 대여 기록에 대해서 대여 기간이 30일 이상이면 '장기 대여' 그렇지 않으면 '단기 대여' 로 표시하는 컬럼(컬럼명: RENT_TYPE)을 추가하여 대여기록을 출력하는 SQL문을 작성해주세요. 결과는 대여 기록 ID를 기준으로 내림차순 정렬해주세요.

- 두 날짜간의 차이 가져오기 함수
: 단순히 일 차이를 가져올 때 사용하는 것이 DATEDIFF 함수.
 이 외에도 차이를 연, 분기, 월, 주, 일, 시, 분, 초를 지정하여 가져올 때 사용하는 TIMESTAMPDIFF 함수입니다.


SELECT  HISTORY_ID
        , CAR_ID
        , DATE_FORMAT(START_DATE, '%Y-%m-%d') AS START_DATE
        , DATE_FORMAT(END_DATE, '%Y-%m-%d') AS END_DATE
        , CASE 
            WHEN  DATEDIFF(END_DATE, START_DATE) + 1 >= 30
            THEN "장기 대여"
            ELSE "단기 대여"
          END AS RENT_TYPE
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
WHERE START_DATE LIKE ('2022-09%')
ORDER BY HISTORY_ID DESC;

