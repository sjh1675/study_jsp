-- 이름, 비밀번호, 메세지

CREATE TABLE IF NOT EXISTS test_guestbook(
	id INT PRIMARY KEY auto_increment,
	guestName VARCHAR(20) NOT NULL,
	password VARCHAR(30) NOT NULL,
	message Text
);

show tables;

commit;

SELECT * FROM test_guestbook ORDER BY id DESC;

INSERT INTO test_guestbook(guestName, password, message) SELECT guestName, password, message FROM test_guestbook;

SELECT * FROM test_guestbook ORDER BY id DESC limit 0, 3;

SELECT count(id) FROM test_guestbook;