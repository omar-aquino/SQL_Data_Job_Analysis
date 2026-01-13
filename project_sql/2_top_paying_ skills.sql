/*
Question 2: Top Paying Skills for Data Analysts
Why? Helps job seekers prioritize which high-value tools could
provide a significant increase in salary after a few years.
*/

SELECT 
	sd.skills,
	COUNT(*) AS skill_count,
	ROUND(AVG(jpf.salary_year_avg),2) AS avg_salary
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE
	job_title_short = 'Data Analyst' AND
	salary_year_avg IS NOT NULL
GROUP BY
		skills
HAVING
	COUNT(*) > 10
ORDER BY 
	avg_salary DESC
LIMIT 10;

/*
When it comes to higher payment. Skills like 'kafka' and 'pytorch' have higher average salaries. They
certainly are very specific skills for seniors and jobs that may not be necessarily be for Data Analyst
even if they were tagged as roles for 'Data Analyst' in our dataset. They command significantly higher average salaries, with most exceeding $\$115,000$. This highlights a "niche premium" where specialized technical expertise (in Big Data, Machine Learning, and Infrastructure) leads to higher compensation despite lower overall job volume.
'SQL' and 'Python' remain the most critical skills to learn first due to their massive market demand as it
was shown in our first query.
*/

/*
Query results in Json:
[
  {
    "skills": "kafka",
    "skill_count": 40,
    "avg_salary": 129999.16
  },
  {
    "skills": "pytorch",
    "skill_count": 20,
    "avg_salary": 125226.2
  },
  {
    "skills": "perl",
    "skill_count": 20,
    "avg_salary": 124685.75
  },
  {
    "skills": "tensorflow",
    "skill_count": 24,
    "avg_salary": 120646.83
  },
  {
    "skills": "cassandra",
    "skill_count": 11,
    "avg_salary": 118406.68
  },
  {
    "skills": "atlassian",
    "skill_count": 15,
    "avg_salary": 117965.6
  },
  {
    "skills": "airflow",
    "skill_count": 71,
    "avg_salary": 116387.26
  },
  {
    "skills": "scala",
    "skill_count": 59,
    "avg_salary": 115479.53
  },
  {
    "skills": "linux",
    "skill_count": 58,
    "avg_salary": 114883.2
  },
  {
    "skills": "confluence",
    "skill_count": 62,
    "avg_salary": 114153.12
  }
]
*/
