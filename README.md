# Netflix-SQL-Data-Analysis
SQL-based Netflix data analysis project solving 15 real-world business problems using PostgreSQL.

## Project Overview

This project analyzes Netflix content data using SQL to solve real-world business problems and extract meaningful insights from the dataset.

The analysis includes:
- Movies vs TV Shows distribution
- Ratings analysis
- Country-wise content analysis
- Genre analysis
- Actor and director insights
- Content categorization

This project demonstrates SQL skills including:
- Data cleaning
- Aggregations
- Window functions
- CTEs
- String manipulation
- Date conversion

## Tools & Technologies Used

- PostgreSQL
- SQL
- CSV Dataset
- GitHub

- ## Dataset

The dataset contains Netflix titles information such as:

- Show ID
- Type
- Title
- Director
- Cast
- Country
- Date Added
- Release Year
- Rating
- Duration
- Genre
- Description

- ## Database Schema

```sql
create table netflix(
    show_id varchar(6),
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
```

## Business Problems Solved

1. Count the number of Movies vs TV Shows

2. Find the most common rating for Movies and TV Shows

3. List all movies released in a specific year

4. Find the top 5 countries with the most content on Netflix

5. Identify the longest movie

6. Find content added in the last 5 years

7. Find all movies/TV shows by director Rajiv Chilaka

8. List all TV shows with more than 5 seasons

9. Count the number of content items in each genre

10. Find yearly average content released by India on Netflix

11. List all Documentary movies

12. Find all content without a director

13. Find how many movies Salman Khan appeared in during the last 10 years

14. Find the top 10 actors appearing in Indian movies

15. Categorize content as Good or Bad based on keywords in description

16. ## Key SQL Concepts Used

- GROUP BY
- ORDER BY
- CTEs
- CASE WHEN
- Window Functions
- RANK()
- STRING_TO_ARRAY()
- UNNEST()
- TO_DATE()
- EXTRACT()
- Subqueries

- ## Key Insights

- Movies dominate Netflix content compared to TV Shows.
- India is among the top contributors of Netflix content.
- Drama and International genres are highly popular.
- Several records required date cleaning due to inconsistent formats.
- SQL can effectively solve real-world business analysis problems.

- ## Author

**Shalini Majumder**
