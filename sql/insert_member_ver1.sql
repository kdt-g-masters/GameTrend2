# user table 데이터 추가

insert into member values(
'admin', 
'1234', 
'관리자', 
null, 
null, 
null, 
'admin@gametrend.com', 
null, 
null
);

insert into member values( 
'aaa', 
'123', 
'짱구', 
'2000-05-05', 
0, 
'01011112222',
'aaa@gametrend.com',
null,
now() 
); 

insert into member values( 
'bbb', 
'456', 
'철수', 
'2000-07-25', 
0, 
'01011113333',
'bbb@gametrend.com',
null,
now()
); 

insert into member values( 
'ccc', 
'789', 
'짱아', 
'2003-03-12', 
1, 
'01011114444',
'ccc@gametrend.com',
null,
now()
); 

insert into member values( 
'ddd', 
'147', 
'흰둥이', 
'2018-06-04', 
0,
'01011115555', 
'ddd@gametrend.com',
null,
now() 
); 

insert into member values( 
'eee', 
'258', 
'유리', 
'2003-09-11', 
1, 
'01011116666',
'eee@gametrend.com',
null,
now() 
);

insert into member values( 
'fff', 
'578', 
'나미리', 
'1980-03-11', 
1, 
'01011117777',
'fff@gametrend.com',
null,
now() 
);

insert into member values( 
'ggg', 
'147', 
'봉미선', 
'1970-09-15', 
1, 
'01011118888',
'ggg@gametrend.com',
null,
now() 
);

insert into member values( 
'hhh', 
'987', 
'신형식', 
'1970-01-21', 
0, 
'01011119999',
'hhh@gametrend.com',
null,
now() 
);

insert into member values( 
'iii', 
'765', 
'맹구', 
'2003-07-31', 
1, 
'01022220000',
'iii@gametrend.com',
null,
now() 
);

insert into member values( 
'jjj', 
'432', 
'수지', 
'2003-05-19', 
0, 
'01022221111',
'jjj@gametrend.com',
null,
now() 
);

select * from member;

# ㄴ성은, 남자는 0 / 여자는 1 
# ㄴ폰은, '01011112222' 형식으로 
# ㄴ프로필 사진은 없어도 된다 