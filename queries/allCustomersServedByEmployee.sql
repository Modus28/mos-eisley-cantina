/* dynamic part is the employee.ename, where takes in an employee name*/
select customer.cname
from customer, bill, employee
where customer.c_id = bill.c_id
and employee.e_id = bill.e_id
and employee.ename = "Kotori"