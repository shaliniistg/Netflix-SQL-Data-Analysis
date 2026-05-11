   --Netflix Project

create table netflix(show_id varchar(6), 
type varchar(10), 
title varchar(150),
director varchar(208), 
casts varchar(1000), 
country varchar(150), 
date_added varchar(50), 
release_year int, 
rating varchar(10), 
duration varchar(15), 
listed_in varchar(100), 
description varchar(250)
);

select * from netflix;

select count(*) as total_content from netflix;

select distinct type from netflix;

/*Netflix Data Analysis using SQL*/
-- Solutions of 15 business problems

-- 1. Count the number of Movies vs TV Shows

select type,count(*) total_no
from netflix
group by type;

-- 2. Find the most common rating for movies and TV shows

select 
    type, rating
from    
(select type,
   rating,
   count(*),
   rank() over(partition by type order by count(*) desc) ranking
from netflix
group by 1,2) as t1
where ranking=1;

-- 3. List all movies released in a specific year (e.g., 2020)

select title, type, release_year
from netflix
where release_year=2020 and type='Movie';

-- 4. Find the top 5 countries with the most content on Netflix

select 
new_country,
count(*) as total_content
from (select 
trim(unnest(string_to_array(country,','))) as new_country
from netflix
where country is not null
)t1
where new_country is not null and new_country<>''
group by 1
order by 2 desc
limit 5;

-- 5. Identify the longest movie

select title,type,duration
from netflix
where type='Movie' and
 duration=(select max(duration) from netflix);


-- 6. Find content added in the last 5 years

select title,date_added
from netflix
where to_date(date_added,'Month DD, YYYY')>=current_date - interval '5 years';

SELECT 
    title,
    date_added
FROM netflix
WHERE 
    CASE 
        WHEN date_added LIKE '%,%' THEN 
            TO_DATE(TRIM(date_added), 'Month DD, YYYY')
        WHEN date_added LIKE '%-%' THEN 
            TO_DATE(TRIM(date_added), 'DD-Mon-YY')
    END >= CURRENT_DATE - INTERVAL '5 years';

-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

select title, type, director
from netflix
where director ilike '%Rajiv Chilaka%'
;

-- 8. List all TV shows with more than 5 seasons

select title,type,duration
from netflix
where
  type='TV Show' and
  split_part(duration,' ',1)::numeric>5;  

-- 9. Count the number of content items in each genre

select 
unnest(string_to_array(listed_in, ',')) as genre,
count(show_id) as total_content
from netflix
group by 1;

-- 10. Find each year and the average numbers of content release by India on netflix. 
-- return top 5 year with highest avg content release !

with cleaned as( 
select 
  case
     when date_added like '%,%'
        then to_date(date_added,'Month DD, YYYY')
	 when date_added like '__-__'	
	    then to_date(date_added,'MM-YY')
     when date_added like '__-___-__'
	    then to_date(date_added,'DD-Mon-YY')
	 when date_added like '____-__-__'
	    then to_date(date_added,'YYYY-MM-DD')
    
	else null 
	 end as cleaned_date
	 
from netflix
where country='India'
and date_added is not null
)

select 
   extract (year from cleaned_date) as year,
   count(*) as yearly_content,
   round(
      count(*)::numeric/
   (select 
      count(*)
	  from netflix
	  where country='India'
   )::numeric 
   *100,2
   )as avg_content_per_year 

   from cleaned

   where cleaned_date is not null

   group by 1

   order by avg_content_per_year desc

   limit 5;

---to get rows with date format mismatch

SELECT date_added
FROM netflix
WHERE country = 'India'
AND date_added IS NOT NULL
AND NOT (
    date_added LIKE '%,%' OR
    date_added LIKE '__-__' OR
    date_added LIKE '__-___-__'
);

--11. List All Movies that are Documentaries

select type,listed_in from netflix;

select title ,type, listed_in
from netflix
where listed_in ilike '%documentaries%';

--12. Find All Content Without a Director

select *
from netflix
where 
  director is null
  or trim(director)='';

--13. Find How Many Movies Actor 'Salman Khan' Appeared in the Last 10 Years

select * from netflix
where casts ilike '%salman khan%'
and
release_year>extract(year from current_date)-10;

--14. Find the Top 10 Actors Who Have Appeared in the Highest Number of Movies Produced in India


select actor,
       count(*) as total_movies
 
 from( select
  trim(unnest(string_to_array(casts,','))) as actor,
  type
  from netflix
  where country ilike '%india%'
  )as t

where actor <> '' and type='Movie'
group by 1
order by 2 desc
limit 10;
 
 /*Categorize the content based on the presence of the keywords kill and violence in the description field.
   Label content containing these keywords as bad and all other content as good.
   Count how many items fall into each category. */

select category,
       count(*)  
from 
  (select
   title,
    case 
     when description ilike '%kill%' or description ilike '%violence%' then 'bad'
	 else 'good'
	 end as Category
from netflix) as categorized_content
group by 1;
