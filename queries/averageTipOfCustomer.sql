Select customer.cname, AVG(bill.tip)
from bill, customer
where bill.c_id = customer.c_id
group by (customer.cname)