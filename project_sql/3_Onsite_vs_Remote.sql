/*
Question 3: Onsite vs Remote Jobs salary Analysis
For the top 5 most common job titles (Data Analyst, Data Scientist, etc.), compare the average salary 
of Remote jobs vs. On-site jobs.
Why? Determines if working from home comes with a "salary sacrifice" or if remote roles actually 
pay more due to intense global competition.

*/
SELECT
	job_title_short,
	COUNT(job_id) AS job_count,
	ROUND(AVG(CASE WHEN job_work_from_home = true THEN salary_year_avg END),2) AS remote_avg_salary,
	ROUND(AVG(CASE WHEN job_work_from_home = false THEN salary_year_avg END),2) AS onsite_avg_salary
FROM
	job_postings_fact
WHERE
	salary_year_avg IS NOT NULL
GROUP BY
	job_title_short
ORDER BY
	job_count DESC
LIMIT 5;

/*
Interestingly, for every role listed, the remote average salary is higher than the onsite average.
The Senior Leap: Moving from a "Data Scientist" to a "Senior Data Scientist" yields a significant 
remote pay bump of roughly $\$19,400$.Data Analyst Ceiling: While Data Analysts have a high job count 
(high demand), the salary ceiling is lower compared to Engineers and Scientists, suggesting a pivot to 
Data Engineering might be more lucrative long-term.
*/

/*
Query results in Json:
[
  {
    "job_title_short": "Data Scientist",
    "job_count": 5926,
    "remote_avg_salary": 144398.25,
    "onsite_avg_salary": 134306.56
  },
  {
    "job_title_short": "Data Analyst",
    "job_count": 5463,
    "remote_avg_salary": 94769.86,
    "onsite_avg_salary": 93764.65
  },
  {
    "job_title_short": "Data Engineer",
    "job_count": 4509,
    "remote_avg_salary": 132363.57,
    "onsite_avg_salary": 129846.53
  },
  {
    "job_title_short": "Senior Data Scientist",
    "job_count": 1686,
    "remote_avg_salary": 163798.16,
    "onsite_avg_salary": 151632.84
  },
  {
    "job_title_short": "Senior Data Engineer",
    "job_count": 1594,
    "remote_avg_salary": 148245.25,
    "onsite_avg_salary": 145364.45
  }
]

*/
	