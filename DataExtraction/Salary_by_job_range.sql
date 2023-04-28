-- Salary by Job Range Table is a single table titled: salary_range_by_job_classification. This table contains the
-- following columns:

--     SetID

--     Job_Code 

--     Eff_Date 

--     Sal_End_Date 

--     Salary_setID 

--     Sal_Plan 

--     Grade 

--     Step 

--     Biweekly_High_Rate 

--     Biweekly_Low_Rate 

--     Union_Code 

--     Extended_Step 

--     Pay_Type
    


-- 01. Question 1: Find the distinct values for the extended step. 

SELECT 
distinct Extended_step
From salary_range_by_job_classification



-- 02. Question 2: Excluding $0.00, what is the minimum bi-weekly high rate of pay (please include the dollar sign and decimal point in your answer)? 
-- Answer: $100.00

Select 
min(Biweekly_high_Rate)
From salary_range_by_job_classification
where biweekly_high_rate <> '$0.00'



-- 03. Question 3: What is the maximum biweekly high rate of pay (please include the dollar sign and decimal point in your answer)? 

-- Answer: $9726.38

SELECT job_code, 
Max(Biweekly_high_Rate) as max_rate
From salary_range_by_job_classification
group by job_code
order by max_rate desc




-- 04. Question 4: What is the pay type for all the job codes that start with '03'? 
-- Answer: B

Select
job_code,
pay_type
From salary_range_by_job_classification
where job_code LIKE "03%"



-- 05. Question 5: Run a query to find the Effective Date (eff_date) or Salary End Date (sal_end_date) for grade Q90H0?  What is the Effective Date (eff_date) for grade Q90H0? (include date and time)

-- Answer: 12/26/2009 12:00:00 AM

Select
grade,
eff_date,
sal_end_date
From salary_range_by_job_classification
where grade = 'Q90H0'



-- 06. Question 6: Sort the Biweekly low rate in ascending order. Are these values properly sorted? 

Select
biweekly_low_rate
From salary_range_by_job_classification
order by biweekly_low_rate asc



-- 07. Question 7: Write and run a query, with no starter code to answer this question: What Step are Job Codes 0110-0400? 
-- Answer: 1

SELECT 
Job_Code,
Salary_setID,
Step
FROM salary_range_by_job_classification
where Job_Code between "0110" and "0400"




-- 08. Question 8: Write and run a query, with no starter code or hints to answer this question: What is the Biweekly High Rate minus the
-- Biweekly Low Rate for job Code 0170?
-- Answer: 0

SELECT (Biweekly_high_Rate - Biweekly_low_rate) as rate_difference
From salary_range_by_job_classification
where job_code = "0170"




-- 09. Question 9: Write and run a query, with no starter code or hints to answer this question: What is the Extended Step for Pay Types M, H, and D? 
-- Answer: 0

SELECT Extended_Step
FROM Salary_range_by_job_classification
where Pay_Type IN ("M", "H", "D")




-- 10. Question 10: Write and run a query, with no starter code or hints to answer this question: What is the step for Union Code 990 and a Set ID of SFMTA or COMMN?
-- Answer: 1 

SELECT 
Union_code,
SetID,
Step
from salary_range_by_job_classification
where Union_code = 990 and (SetID = 'SFMTA' or SetID = 'COMMN')