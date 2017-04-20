use bar;

/* dynamic part would be the priceTable.price which can be any float that people want to sort by */
select fooditem.fname, priceTable.price
from fooditem, priceTable
where fooditem.p_id = priceTable.p_id
and priceTable.price <= 17
order by priceTable.price asc


select drinks.dname, priceTable.price
from drinks, priceTable
where drinks.p_id = priceTable.p_id
and priceTable.price <= 17
order by priceTable.price asc
