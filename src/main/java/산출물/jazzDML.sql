SELECT * FROM jazz.product;

use jazz;

select * from product;
select * from productOption;
-- INSERT PRODUCTOPTION
insert into productOption(pCode, pSize, pStock)
values(1, 220, 30);
insert into productOption(pCode, pSize, pStock)
values(1, 230, 30);
insert into productOption(pCode, pSize, pStock)
values(1, 240, 30);
insert into productOption(pCode, pSize, pStock)
values(1, 250, 30);
insert into productOption(pCode, pSize, pStock)
values(1, 260, 30);
insert into productOption(pCode, pSize, pStock)
values(1, 270, 30);
insert into productOption(pCode, pSize, pStock)
values(1, 280, 30);

insert into productOption(pCode, pSize, pStock)
values(2, 220, 30);
insert into productOption(pCode, pSize, pStock)
values(2, 230, 30);
insert into productOption(pCode, pSize, pStock)
values(2, 240, 30);
insert into productOption(pCode, pSize, pStock)
values(2, 250, 30);
insert into productOption(pCode, pSize, pStock)
values(2, 260, 30);
insert into productOption(pCode, pSize, pStock)
values(2, 270, 30);
insert into productOption(pCode, pSize, pStock)
values(2, 280, 30);
insert into productOption(pCode, pSize, pStock)
values(2, 290, 30);
insert into productOption(pCode, pSize, pStock)
values(2, 300, 30);





select * from product;
select * from productOption;


-- INSERT PRODUCT
insert into product(pName, pBrandName, pPrice, pInsertDate, pImage)
values('나이키 조던', 'NIKE', 129000, now(), 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150601_105%2Ffodfod82_1433144666254RY8Vm_JPEG%2FIMG_8285.jpg&type=sc960_832');

insert into product(pName, pBrandName, pPrice, pInsertDate, pImage)
values('나이키 덩크 로우 레트로', 'NIKE', 139000, now(), 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b1bcbca4-e853-4df7-b329-5be3c61ee057/%EB%8D%A9%ED%81%AC-%EB%A1%9C%EC%9A%B0-%EB%A0%88%ED%8A%B8%EB%A1%9C-%EB%82%A8%EC%84%B1-%EC%8B%A0%EB%B0%9C-bDdzzUjf.png');

insert into product(pName, pBrandName, pPrice, pInsertDate, pImage)
values('나이키 에어 포스 1 07', 'NIKE', 119000, now(), '')
