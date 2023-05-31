with dates as (
    select 
        date as full_date,
        extract(day from date) as day,
        extract(month from date) as month,
        extract(year from date) as year,
        format_timestamp('%A', timestamp(date)) as day_of_week_name,
        extract(dayofweek from date) as day_of_week_number,
        extract(week from date) as week_of_year,
        extract(quarter from date) as quarter
    from unnest(
        generate_date_array(
            date('2011-05-01'), 
            date('2014-06-30')
        )
    ) as date
)
select *
from dates
