/*
    Question: What were the top-paying Software Engineer jobs in 2023?
    1. Identify the top 10 Software Engineering roles available remotely at the time
        a. Focus on postings with listed salaries
    Why? This will give a picture of how different the job market was a few years ago 
*/

SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Software Engineer' AND 
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;