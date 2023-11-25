#promotion table 데이터 추가 

use gamedb;

insert into promotion values(
'PC', 
'2022-05-05', 
'2022-05-12', 
'PC_Event.JPG', 
'PC_EventList.JPG', 
'https://store.steampowered.com/specials#tab=TopSellers' 
); 

insert into promotion values(
'PS', 
'2022-05-03', 
'2022-05-10', 
'PS_Event.JPG', 
'PS_EventList.JPG', 
'https://store.playstation.com/ko-kr/category/d5ddbb37-0ff9-4682-8b6a-de6389e93ee6/1' 
); 

insert into promotion values(
'Xbox', 
'2022-05-03', 
'2022-05-10', 
'Xbox_Event.JPG', 
'Xbox_EventList.JPG', 
'https://www.xbox.com/ko-KR/promotions/sales/sales-and-specials' 
); 

insert into promotion values(
'NS', 
'2022-04-27', 
'2022-05-11', 
'NS_Event.JPG', 
'NS_EventList.JPG', 
'https://store.nintendo.co.kr/games/sale' 
); 

select * from promotion; 

