/*
Question 5: Hiring Patterns by Month
Why? Reveals "Hiring Seasons." Knowing which months see the most postings for specific 
roles helps candidates timing their job hunt.
*/

WITH monthly_jobs AS(
	SELECT
		job_id,
		job_title_short,
		EXTRACT(MONTH FROM job_posted_date) AS month_,
		TO_CHAR(job_posted_date, 'Month') AS month_name
	FROM job_postings_fact
	WHERE job_title_short IN ('Data Analyst', 'Data Scientist')	
)

SELECT
	month_,
	month_name,
	COUNT(CASE WHEN job_title_short = 'Data Analyst' THEN 1 END) AS data_analysts_jobs,
	COUNT(CASE WHEN job_title_short = 'Data Scientist' THEN 1 END) AS data_Scientist_jobs
FROM monthly_jobs mj
GROUP BY
	mj.month_,
	mj.month_name
ORDER BY
	month_

/*
Query results in Json:
Insights:
- Peak Demand: Both roles saw a massive surge in January, which is typical as companies refresh budgets for the new year.
- Analyst Lead: Data Analyst postings consistently outnumbered Data Scientist postings every month throughout the year.
- Summer Rally: There was a notable secondary peak in August before dipping in September.
*/

/*
[
  {
    "month_": 1,
    "month_name": "January",
    "data_analysts_jobs": 23697,
    "data_scientist_jobs": 20875
  },
  {
    "month_": 2,
    "month_name": "February",
    "data_analysts_jobs": 16479,
    "data_scientist_jobs": 13952
  },
  {
    "month_": 3,
    "month_name": "March",
    "data_analysts_jobs": 16342,
    "data_scientist_jobs": 13603
  },
  {
    "month_": 4,
    "month_name": "April",
    "data_analysts_jobs": 15499,
    "data_scientist_jobs": 13489
  },
  {
    "month_": 5,
    "month_name": "May",
    "data_analysts_jobs": 13457,
    "data_scientist_jobs": 11752
  },
  {
    "month_": 6,
    "month_name": "June",
    "data_analysts_jobs": 15932,
    "data_scientist_jobs": 13606
  },
  {
    "month_": 7,
    "month_name": "July",
    "data_analysts_jobs": 16150,
    "data_scientist_jobs": 14126
  },
  {
    "month_": 8,
    "month_name": "August",
    "data_analysts_jobs": 18602,
    "data_scientist_jobs": 16977
  },
  {
    "month_": 9,
    "month_name": "September",
    "data_analysts_jobs": 14997,
    "data_scientist_jobs": 13630
  },
  {
    "month_": 10,
    "month_name": "October",
    "data_analysts_jobs": 16260,
    "data_scientist_jobs": 14202
  },
  {
    "month_": 11,
    "month_name": "November",
    "data_analysts_jobs": 15133,
    "data_scientist_jobs": 14158
  },
  {
    "month_": 12,
    "month_name": "December",
    "data_analysts_jobs": 14045,
    "data_scientist_jobs": 12356
  }
]
*/