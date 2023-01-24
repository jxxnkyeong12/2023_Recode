▶ mysql 프로그래머스 레벨2 도전중


1. 중복 제거하기
동물 보호소에 들어온 동물의 이름은 몇 개인지 조회하는 SQL 문을 작성해주세요. 이때 이름이 NULL인 경우는 집계하지 않으며 중복되는 이름은 하나로 칩니다.


SELECT COUNT(DISTINCT NAME) AS count
FROM ANIMAL_INS 
WHERE NAME IS NOT NULL

- DISTINCT를 해당 컬럼 옆에 해줘야 한다. 근데 뒤에 있는 컬럼 모두 대상으로 봐서 오류가 날수 있으니 고려 잘 해서 넣어주기!


2.이름에 el이 들어가는 동물 찾기
보호소에 돌아가신 할머니가 기르던 개를 찾는 사람이 찾아왔습니다. 이 사람이 말하길 할머니가 기르던 개는 이름에 'el'이 들어간다고 합니다. 동물 보호소에 들어온 동물 이름 중, 이름에 "EL"이 들어가는 개의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 이때 결과는 이름 순으로 조회해주세요. 단, 이름의 대소문자는 구분하지 않습니다.


SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE NAME LIKE CONCAT('%', 'el' ,'%')
AND ANIMAL_TYPE = 'Dog'
ORDER BY NAME 

- mysql에서 like는 기본적으로 대소문자를 가리지 않는다.
- 즉, 대소문자를 구별하여 패턴을 찾기 위해서는 BINARY를 사용해야 한다.
 : LIKE BINARY '%TEST%';







3. 동명 동물 수 찾기
동물 보호소에 들어온 동물 이름 중 두 번 이상 쓰인 이름과 해당 이름이 쓰인 횟수를 조회하는 SQL문을 작성해주세요. 이때 결과는 이름이 없는 동물은 집계에서 제외하며, 결과는 이름 순으로 조회해주세요.


SELECT NAME, COUNT(NAME) AS COUNT
FROM ANIMAL_INS 
GROUP BY NAME 
HAVING COUNT(NAME) >1
ORDER BY NAME

- 같은 이름을 찾는거니까 중복 제거가 아니다 DISTINCT 제외!
- 이름을 그룹으로 묶어줘야 하니까 GROUP BY를 써준다.
- HAVING 절이 뒤따르는 것은 공식! 1개 이상의 같은 이름이 있다면! 이라는 조건절 만들어 주기



4. 중성화 여부 파악하기
보호소의 동물이 중성화되었는지 아닌지 파악하려 합니다. 중성화된 동물은 SEX_UPON_INTAKE 컬럼에 'Neutered' 또는 'Spayed'라는 단어가 들어있습니다. 동물의 아이디와 이름, 중성화 여부를 아이디 순으로 조회하는 SQL문을 작성해주세요. 이때 중성화가 되어있다면 'O', 아니라면 'X'라고 표시해주세요.


SELECT  ANIMAL_ID
        , NAME  
        , CASE
             WHEN (SEX_UPON_INTAKE LIKE '%Neutered%' OR SEX_UPON_INTAKE LIKE '%Spayed%') 
             THEN 'O'
             ELSE 'X'
          END AS 중성화
FROM  ANIMAL_INS    


- case 문 안쪽에 조건문 넣을 때, like ‘%%’이렇게 해주기