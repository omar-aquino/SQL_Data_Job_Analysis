/*
Question 1: Top Demanded Skills for Data Analysts
Why? Helps job seekers prioritize which high-value tools to 
learn first to maximize their earning potential.
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
	skill_count DESC
LIMIT 10;

/*
Insights:
- SQL is the Industry Standard: With over 3,083 job postings, SQL is the most demanded skill by a 
  significant margin, establishing itself as the essential foundation for any data analyst role.
- Python Commands the Highest Pay: While third in total demand, Python is the top-earning skill on 
  the list, boasting the highest average salary at $101,512, followed closely by specialized tools like R and Tableau.
- There is a clear "pay gap" between foundational office tools (Excel, Word, PowerPoint) and technical 
  skills; mastering programming and visualization tools is the most effective way to move beyond the 
  $90,000 salary threshold.
*/

/*
Query results in Json Format:
[
  {
    "skills": "sql",
    "skill_count": 3083,
    "avg_salary": 96435.33
  },
  {
    "skills": "excel",
    "skill_count": 2143,
    "avg_salary": 86418.90
  },
  {
    "skills": "python",
    "skill_count": 1840,
    "avg_salary": 101511.85
  },
  {
    "skills": "tableau",
    "skill_count": 1659,
    "avg_salary": 97978.08
  },
  {
    "skills": "r",
    "skill_count": 1073,
    "avg_salary": 98707.80
  },
  {
    "skills": "power bi",
    "skill_count": 1044,
    "avg_salary": 92323.60
  },
  {
    "skills": "sas",
    "skill_count": 1000,
    "avg_salary": 93707.36
  },
  {
    "skills": "word",
    "skill_count": 527,
    "avg_salary": 82940.76
  },
  {
    "skills": "powerpoint",
    "skill_count": 524,
    "avg_salary": 88315.61
  },
  {
    "skills": "sql server",
    "skill_count": 336,
    "avg_salary": 96191.42
  }
]
*/