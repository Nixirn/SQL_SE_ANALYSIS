/*
Question: As of 2023, what were the most in demand software development skills?
- Identify top skills for a Software Engineer
- Focus on all job postings
- Why? Provides insights into what skills were most valuable to job seekers in 2023
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Software Engineer' AND 
    job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY
    demand_count DESC
LIMIT 5