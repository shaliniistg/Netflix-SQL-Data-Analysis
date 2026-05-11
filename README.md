# Netflix-SQL-Data-Analysis

</> markdown
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
Dataset Link: https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download

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
