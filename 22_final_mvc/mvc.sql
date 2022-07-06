CREATE TABLE mvc_member(
	num INT PRIMARY KEY auto_increment,
	id VARCHAR(50) UNIQUE NOT NULL,
	pass VARCHAR(50) NOT NULL,
	name VARCHAR(50),
	age INT(3) default 0,
	gender VARCHAR(10),
	joinYN char(1) DEFAULT 'Y',
	regdate TIMESTAMP default now(),
	updatedate TIMESTAMP default now()
);

DESC mvc_member;

SELECT * FROM mvc_member;


-- 비밀번호 찾기에 사용될 코드를 저장한 뒤, 사용자에게 메일을 보내고 입력을 받아 비교하여 일치하는지 확인
CREATE TABLE test_code(
	id VARCHAR(50),
	code char(5)
);

DESC test_code;

SELECT * FROM test_code;

UPDATE mvc_member SET joinYN = 'Y';
commit;