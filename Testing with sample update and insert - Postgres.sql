update ORDERS_DATASET set ORDER_STATUS='deliver' where ORDER_ID='9b9273325c81fdbb834a17e020c6d131';

update order_reviews_dataset set REVIEW_SCORE=1 where ORDER_ID='9b9273325c81fdbb834a17e020c6d131';

update order_payments_dataset set PAYMENT_TYPE='cc' where ORDER_ID='9b9273325c81fdbb834a17e020c6d131';

insert into order_payments_dataset values ('test',1,'voucher',6,89.97);

insert into order_reviews_dataset values ('test2','test',5,'veio certinho.','2017-09-12 00:00:00.000','2017-09-15 23:15:16.000');

insert into ORDERS_DATASET values ('test','test1','delivered','2017-09-02 15:37:08.000','2017-09-02 15:50:16.000','2017-09-05 18:03:31.000','2017-09-11 18:23:11.000','2017-09-27 00:00:00.000');

