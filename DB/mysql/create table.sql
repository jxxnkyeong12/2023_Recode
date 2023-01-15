SELECT x.*  FROM Album x

CREATE TABLE test_board_jin.`member` (
	seq INT auto_increment NOT NULL,
	mb_nickname(15),
	mb_id varchar(50) NOT NULL,
	mb_pw varchar(100) NOT NULL,
	mb_gender varchar(15) default '여' 
	address varhcar(100),
	address_more(100),
	post int(5)
	mb_tell varchar(15),
	
	PRIMARY KEY(seq)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;
