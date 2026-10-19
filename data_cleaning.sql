-- Data cleaning of Nashville housing data
-- Displaying the data 

select *
from nh_dataset
limit 5 ;

-- 1. standardising the date

alter table nh_dataset 
alter column saledate type date
using cast (saledate as date );


--2. breaking down the address into individual columns address and city 

SELECT
    SPLIT_PART(propertyaddress, ',', 1) AS address,
    TRIM(SPLIT_PART(propertyaddress, ',', 2)) AS city
FROM nh_dataset

-- updating the table 
alter table nh_dataset 
add column  property_split_address varchar(225);

update nh_dataset nd 
set property_split_address = SPLIT_PART(propertyaddress, ',', 1) ;

alter table nh_dataset 
add column property_split_city varchar(225);

update nh_dataset nd 
set property_split_city = TRIM(SPLIT_PART(propertyaddress, ',', 2));




-- 3. breaking down  the owner address into individual columns

select
TRIM(SPLIT_PART(owneraddress, ',', 1)),
TRIM(SPLIT_PART(owneraddress, ',', 2)),
TRIM(SPLIT_PART(owneraddress, ',', 3))

from nh_dataset
-- updating the table 
alter table nh_dataset 
add column owner_split_address varchar(225);

update nh_dataset nd 
set owner_split_address= TRIM(SPLIT_PART(owneraddress, ',', 1));

alter table nh_dataset 
add column owner_split_city varchar(225);

update nh_dataset nd 
set owner_split_city = TRIM(SPLIT_PART(owneraddress, ',', 2));

alter table nh_dataset 
add column owner_split_state varchar(225);

update nh_dataset 
set owner_split_state =  TRIM(SPLIT_PART(owneraddress, ',', 3));


-- 4. change Y and N to Yes and No in "sold as vacant" column

select soldasvacant,
case when soldasvacant = 'Y' then 'Yes'
	when soldasvacant = 'N'then 'No'
	else soldasvacant
end
from nh_dataset;

--update the column
update nh_dataset 
set soldasvacant= case when soldasvacant = 'Y' then 'Yes'
	when soldasvacant = 'N'then 'No'
	else soldasvacant
end


--5.  Remove duplicates

with row_num_cte as (
    select
        uniqueid,
        row_number() over (
            partition by  parcelid, propertyaddress, saleprice, saledate, legalreference
            order by  uniqueid
        ) as row_num
    from nh_dataset
)
Delete from nh_dataset
where uniqueid in (
    select uniqueid
    from row_num_cte
    where row_num > 1
);



-- 6. deleting unused columns

select *
from nh_dataset

alter table nh_dataset 
drop column owneraddress,
drop column propertyaddress,
drop column taxdistrict










