use bar;
/*dynamic part would be the bill.c_id to any customer */


select bill.billNum, sum(priceTable.price * foodpurchase.qty)
from foodpurchase, bill, fooditem, priceTable
where foodpurchase.billNum = bill.billNum
and bill.c_id = 00000
and fooditem.f_id = foodpurchase.f_id
and fooditem.p_id = priceTable.p_id
group by(bill.billNum)


select bill.billNum, sum(priceTable.price * drinkpurchase.qty)
from drinkpurchase, bill, drinks, priceTable
where drinkpurchase.billNum = bill.billNum
and bill.c_id = 00000
and drinks.d_id = drinkpurchase.d_id
and drinks.p_id = priceTable.p_id
group by(bill.billNum)

/*
Delimiter \\
CREATE PROCEDURE sumfoodpurchaseofcustomer(c_id integer(5))
BEGIN
SET @q1 =CONCAT("select bill.billNum, sum(priceTable.price * foodpurchase.qty)
from foodpurchase, bill, fooditem, priceTable
where foodpurchase.billNum = bill.billNum
and bill.c_id =", c_id," and fooditem.f_id = foodpurchase.f_id
and fooditem.p_id = priceTable.p_id
group by(bill.billNum)");
Prepare stmt1 From @q1;
execute stmt1;
deallocate prepare stmt1;
End\\

Delimiter \\
CREATE PROCEDURE sumfoodpurchaseofcustomer(c_id integer(5))
BEGIN
SET @q1 =CONCAT("select bill.billNum, sum(priceTable.price * foodpurchase.qty)
from foodpurchase, bill, fooditem, priceTable
where foodpurchase.billNum = bill.billNum
and bill.c_id =", c_id," and fooditem.f_id = foodpurchase.f_id
and fooditem.p_id = priceTable.p_id
group by(bill.billNum)");
Prepare stmt1 From @q1;
execute stmt1;
deallocate prepare stmt1;
End\\



call sumfoodpurchaseofcustomer(00000);

*/

