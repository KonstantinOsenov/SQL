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




