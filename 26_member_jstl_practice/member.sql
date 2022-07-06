DROP TABLE IF EXISTS big_member;
CREATE TABLE IF NOT EXISTS big_member(
	u_num INT primary key auto_increment, 	-- 회원번호
	u_id VARCHAR(30) unique,			  	-- 회원아이디
	u_pass VARCHAR(30) NOT NULL,			-- 비밀번호
	u_age int,								-- 나이
	u_gender VARCHAR(10), 				    -- 성별
	u_join char(1) default 'Y',				-- 회원탈퇴 여부 Y == 가입상태
	u_regdate TIMESTAMP default now() 		-- 회원가입일	 
);

-- 회원 가입 시
INSERT INTO big_member(u_id,u_pass,u_age,u_gender) 
VALUES('admin', 'admin' , 20, 'male');

-- 회원탈퇴 시
-- UPDATE big_member SET u_join = 'N' WHERE u_num = 회원번호;
commit;

-- 관리자가 아니고 탈퇴한 회원이 아닌 정보 출력
SELECT * FROM big_member 
WHERE u_id != 'admin' AND u_join = 'Y' 
ORDER BY u_num DESC


SELECT * FROM big_member;

-- sysdate : 동일 쿼리라도 호출 되는 시점에 시간 출력
SELECT sysdate();

-- 공지사항 notice_board

CREATE TABLE notice_board(
	n_num INT PRIMARY KEY auto_increment, -- 공지번호
	n_category VARCHAR(20), -- 공지 분류
	n_author VARCHAR(50), 	-- 작성자
	n_title VARCHAR(50), 	-- 내용
	n_content TEXT,
	n_date TIMESTAMP default now()
);

SELECT * FROM notice_board;

drop table notice_board;

INSERT INTO notice_board(n_category, n_title, n_author, n_content) SELECT n_category, n_title, n_author, n_content FROM notice_board;
commit;

-- 답변형 게시글 qna_board

CREATE TABLE qna_board(
	qna_num INT PRIMARY KEY auto_increment, -- 게시글 번호
	qna_name VARCHAR(20) NOT NULL,			-- 작성자
	qna_title VARCHAR(50) NOT NULL,			-- 제목
	qna_content TEXT NOT NULL,				-- 내용
	qna_re_ref INT NOT NULL,				-- 원본 글 번호
	qna_re_lev INT NOT NULL,				-- 답변 뷰 깊이
	qna_re_seq INT NOT NULL,				-- 답변 글 정렬 순서	
	qna_writer_num INT,						-- 글 작성자 번호
	qna_readcount INT default 0,			-- 조회수
	qna_date TIMESTAMP default now()		-- 작성 시간
);

DESC qna_board;


INSERT INTO qna_board VALUES(null, '최기근', '첫번째 게시글입니다.', '냉무', 0, 0, 0, 1, 0, now());
SELECT LAST_INSERT_ID();
UPDATE qna_board SET qna_re_ref = LAST_INSERT_ID() WHERE qna_num = LAST_INSERT_ID();


ALTER TABLE qna_board ADD qna_delete char(1) DEFAULT 'N' AFTER qna_readcount;

SELECT * FROM qna_board;

INSERT INTO 