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

INSERT INTO mvc_member(id, pass, name, age, gender) VALUES('admin', 'admin', 'MASTER', 0, 'male');

DESC notice_board;

SELECT * FROM notice_board;


-- 질답 게시판

CREATE TABLE question_answer(
	qna_num INT PRIMARY KEY auto_increment,	-- 번호
	qna_title VARCHAR(50) NOT NULL,			-- 제목
	qna_content TEXT NOT NULL,				-- 내용
	qna_re_ref INT NOT NULL,				-- 원본글 번호
	qna_re_lev INT NOT NULL,				-- 답변글 뷰 번호(깊이)
	qna_re_seq INT NOT NULL,				-- 답변글 정렬용 번호
	qna_writer_num INT,						-- 작성자 번호
	qna_readcount INT DEFAULT 0,			-- 조회수
	qna_delete char(1) default 'N',			-- 글 삭제 유무
	qna_date TIMESTAMP default now()		-- 작성시간
);

DESC question_answer;

ALTER TABLE question_answer ADD FOREIGN KEY(qna_writer_num) REFERENCES mvc_member(num);

SELECT * FROM question_answer;

SELECT Q.*, M.name AS qna_name FROM question_answer AS Q, mvc_member AS M WHERE Q.qna_writer_num = M.num ORDER BY Q.qna_re_ref DESC, Q.qna_re_seq ASC;
commit;

UPDATE question_answer SET qna_re_seq = 3 WHERE qna_num = 3;