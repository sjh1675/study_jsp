-- alx + x, alt + c
show tables;

CREATE TABLE IF NOT EXISTS member(
	num INT PRIMARY KEY auto_increment,
	name VARCHAR(50),
	addr VARCHAR(300)
);

DESC member;

INSERT INTO member(name, addr) VALUES('박주신', '평양');