-- Basic structure
select 
      column0                                                           as column0
    , count(*)                                                          as count_all
    , count(distinct column1)                                           as column1
    , count(distinct case when column2 is not null then column3 end)    as column5
    , round(count(distinct column5)*1.0/791 * 100, 2)                   as column6
    , round(
            count(distinct column1) * 1.0
            / 
            count(distinct column2),
            2)                                                          as column7
    , case when column1 < 10 then '<10'
           when column1 >= 10 and column1 < 50 then '10-50'
           else '>=200' end                                             as column8
           
from 
    table_name
where 1=1
    and column1 > column2
group by
      column0
    , case when column1 < 10 then '<10'
           when column1 >= 10 and column1 < 50 then '10-50'
           else '>=50' end
having 
        column5 >= 1.3 
    and column6 < 3
order by 
    count_all desc	

	
-- CTE (Common Table Expression)
with tmp_table_name as
    (
        select 
              column0
            , count(*) as count_all
        from 
            df
        group by 
            column0
    )

select * from tmp_table_name


-- Window functions examples


-- Hierarchical queries


----------- Other
-- ALIAS
SELECT attribute_name AS attribute_name_2
SELECT attribute_name = max(attribute_name_2)

-- CASE WHEN 
CASE WHEN attribute_name = 3 THEN 1 ELSE 0 END

-- JOIN
table1 JOIN table2 ON table1.attribute_name = table2.attribute_name


	
-- WINDOW functions		
MIN(attribute_name) OVER (PARTITION BY attribute_name2)
MAX(attribute_name) OVER (PARTITION BY attribute_name2)
LAG(attribute_name) OVER (PARTITION BY attribute_name2 order by attribute_name3)
LAST_VALUE(attribute_name) OVER (PARTITION BY attribute_name2 order by attribute_name3)
FIRST_VALUE(attribute_name) OVER (PARTITION BY attribute_name2 order by attribute_name3)

-- Numbers
ROUND(attribute_name, 2)
	
-- Change data types
CAST(attribute_name AS int)       
CAST(attribute_name AS date)
CONVERT(date, attribute_name)

-- DATES
GETDATE()
SYSDATETIME()
now(-2d)
EOMONTH(date1)
startofday(date1)

DATEDIFF(day, date1, date2)
DATEDIFF(dd, date1, date2)
DATEDIFF(d, date1, date2)
DATEDIFF(yy, date1, date2)

DATEADD(day, -1,  date1)
DATEADD(mm, -12,  date1)
DATEADD(yy, 2,  date1)

SELECT YEAR(0), MONTH(0), DAY(0);

-- STRINGS
SUBSTRING(attribute_name, 1, 13)
REPLICATE('0', 15 - len(attribute_name))
CONCAT(attribute_name1, '.', attribute_name2)
STRING_AGG(attribute_name, '; ')
STRING_AGG(attribute_name, ', ') WITHIN GROUP (ORDER BY attribute_name)


-- STATISTICS
SELECT
	  PERCENTILE_CONT(0.3) WITHIN GROUP (ORDER BY attribute_name) OVER () as p30
	, PERCENTILE_CONT(0.4) WITHIN GROUP (ORDER BY attribute_name) OVER () as p40
	, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY attribute_name) OVER () as p50
FROM table1

-----------------------------------------------
-- DATABASE INFO
SELECT distinct
	Table_Catalog,
	Column_Name,
	Table_Schema,
	Table_Name
FROM INFORMATION_SCHEMA.COLUMNS


-- "view" definition
select top(10) *
from sys.objects     o
join sys.sql_modules m on m.object_id = o.object_id
where 1=1
  --and o.object_id = object_id( 'qwe')
  and o.type      = 'V'
  and name like '%qwe%'

