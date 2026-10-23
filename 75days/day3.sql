https://leetcode.com/problems/find-expensive-cities/

WITH average_price_city AS (select city,avg(l.price) as city_price
from listings l
group by city),
average_national_price as (
    select avg(price) as total_price from listings
)
select c.city
from average_price_city c
CROSS JOIN average_national_price n
where n.total_price < c.city_price

The national average is a single-row result, so I cross join it to the per-city averages. 
That puts the national value next to every city without needing a join key, and then I filter for cities whose average is higher.”

If they push back on CROSS JOIN: “Since the right side is guaranteed 
  to be one row, the cross join cannot multiply rows. A scalar subquery in HAVING would be equivalent.
