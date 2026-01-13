/*
Question 4: Optimal Skill "Bundles"
In the real world, you rarely get hired for knowing just one skill. You get hired for a "stack." 
We want to see which skills are most commonly paired with Python for Data Analyst roles.
*/

WITH python_jobs AS(
	SELECT 
	jpf.job_id
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE
	job_title_short = 'Data Analyst' AND
	LOWER(skills) = 'python'
)

SELECT 
	sd.skills,
	COUNT(*) AS skill_count
FROM skills_job_dim sjd
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE sjd.job_id IN (
	SELECT job_id
	FROM python_jobs
) AND LOWER(sd.skills) <> 'python'
GROUP BY
	sd.skills
ORDER BY
	skill_count DESC
LIMIT 10;

/*
Insights:
- SQL paired with Python in over 44,000 postings. This confirms that knowing how to extract data (SQL) 
  is just as important as knowing how to process it (Python).
- The high count for R suggests a heavy overlap in roles where both languages are often expected or 
  interchangeable for statistical modeling.
- For Data Visualization Tableau is paired with Python significantly more often than Power BI. 

/*
Query results in Json:
[
  {
    "skills": "sql",
    "skill_count": 44630
  },
  {
    "skills": "r",
    "skill_count": 25588
  },
  {
    "skills": "tableau",
    "skill_count": 23233
  },
  {
    "skills": "excel",
    "skill_count": 17492
  },
  {
    "skills": "power bi",
    "skill_count": 15644
  },
  {
    "skills": "sas",
    "skill_count": 13844
  },
  {
    "skills": "azure",
    "skill_count": 5712
  },
  {
    "skills": "aws",
    "skill_count": 5690
  },
  {
    "skills": "java",
    "skill_count": 4123
  },
  {
    "skills": "spark",
    "skill_count": 3795
  }
]
*/