create table board(
	idx int not null auto_increment,
	title varchar(100) not null,
	writer varchar(10) not null,
	indate datetime default now(),
	contents varchar(2000) not null,
	primary key (idx)
);
drop table board
insert into board(title,writer,contents) values('제목1','노태민','게시판');
insert into board(title,writer,contents) values('제목2','노민태','게시판');
insert into board(title,writer,contents) values('제목3','태노민','게시판');

select * from board2;
insert into board2(title,contets, writer)
	select title,contents,writer from board2;
	
select count(idx) from board2;

select 
  idx, title, writer, indate,contents,id
from board2
order by idx desc
limit 0,10


/**/
create table member(
	id varchar(20) not null,
	pw varchar(50)not null,
	name varchar(10)not null,
	primary key (id)
	);

select * from member;

insert into member values('smhrd1','smhrd1','김운비');
insert into member values('smhrd2','smhrd2','선영표');
insert into member values('smhrd3','smhrd3','노태민');

insert into board3 (id,pw,name) values( #{id}, #{pw}, #{name})
        
select * from board2 where writer = '11';

create table board2(
	idx int not null auto_increment,
	title varchar(100) not null,
	writer varchar(10) not null,
	indate datetime default now(),
	contents varchar(2000) not null,
	id varchar(20),
	cnt int,
	primary key(idx)
 );
 

 insert into board2(title,contents,writer)(select title,contents, writer from board2);
 
 select count(*) * from board3;
 
CREATE TABLE board3(
  Id VARCHAR(50),
  Pw VARCHAR(100) NOT NULL,
  Name VARCHAR(30) NOT NULL,
  Mail VARCHAR(100) NOT NULL,
  Addr1 VARCHAR(100) NOT NULL,
  Addr2 VARCHAR(100) NOT NULL,
  Addr3 VARCHAR(100) NOT NULL,
  PRIMARY KEY(Id)
);

/*0~10 까지 들어오는 페이징 sql*/
SELECT
  idx,
  title,
writer,
indate,
contents,
 id
FROM board2
WHERE idx > 0
ORDER BY idx DESC,	writer DESC
LIMIT 0, 10 

insert into board2(idx,title,contents)
	select idx,contents from board2;



select * from 
        (select @rownum := @rownum + 1 as rn, idx, title, writer, contents, id 
        from board2, (select @rownum := 0)  as rowcolumn order by idx desc) as rownum_table   
where rn > 0 and rn <=10;






 commit;

 drop table board3

insert into board3 values('admin','admin','admin','admin','admin','admin','admin',1,sysdate(),1000000, 1000000); alter

select * from board3;

CREATE TABLE number(

	bno VARCHAR(10)
);

drop table number



/*페이징*/
insert into board2(title,contents,writer)(select title,contents, writer from board2);

select count(*) from board2;
/*검색 기능*/

select idx, title, writer, indate, id  
    from board2 
    where title like '%service%'
    order by idx desc 
    limit 10, 10;

    
select * from 
        (select @rownum := @rownum + 1 as rn, idx, title, writer, indate, id 
        from board2, (select @rownum := 0)  as rowcolumn order by idx desc) as tl
where rn > 10 and rn <=20;


select idx, title , writer , indate ,id
from board2 order by idx desc 
limit 10,10;

