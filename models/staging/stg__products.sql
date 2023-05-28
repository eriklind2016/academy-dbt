with
    source_product as (
        select
            cast(productid as int) as product_id	
            , cast(productsubcategoryid as int) as productsubcategory_id 				
            , `name` 					
            , productnumber						
            , makeflag						
            , finishedgoodsflag						
            , color						
            , safetystocklevel						
            , reorderpoint						
            , standardcost						
            , listprice						
            , size						
            , sizeunitmeasurecode						
            , weightunitmeasurecode						
            , `weight` 					
            , daystomanufacture						
            , productline						
            , class						
            , style												
            , productmodelid						
            , sellstartdate						
            , sellenddate						
            , discontinueddate 						
            , rowguid						
            , modifieddate	
        from {{ source('erp', 'product') }}
    )
select *
from source_product