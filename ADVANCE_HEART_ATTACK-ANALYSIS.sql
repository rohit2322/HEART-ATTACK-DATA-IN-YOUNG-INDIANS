-- Stage 1: Descriptive Analysis
-- Overall Statistics:

-- 1 What is the average age, BMI, and resting heart rate of the individuals in the dataset?
select 
	avg(age) as avg_age,
    avg(BMI) as avg_bmi,
    avg(Resting_Heart_Rate) as avg_heart_rate
from patient_data;

-- 2 What is the distribution of gender, region, and urban/rural status?
select Gender,Region,Urban_Rural,count(*)
from patient_data
group by Gender,Region,Urban_Rural;

-- 3 What percentage of individuals have a family history of heart disease, diabetes, or hypertension?
SELECT
    (SUM(CASE WHEN Family_History_of_Heart_Disease = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Heart_Disease_Percentage,
    (SUM(CASE WHEN Diabetes = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Diabetes_Percentage,
    (SUM(CASE WHEN Hypertension = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Hypertension_Percentage
FROM
    patient_data;

-- Grouped Analysis:

--  4 What is the average age and BMI for males and females?
select 
	Gender,
	avg(age) as avg_age,
    avg(BMI) as avg_bmi
from patient_data
group by Gender;

-- 5 What is the prevalence of hypertension by region (East, West, North, South)?
SELECT
    Region,
    (SUM(CASE WHEN Hypertension = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Hypertension_Prevalence
FROM patient_data
GROUP BY Region;
                                                                                                                 
-- 6 How does the average sleep duration vary across different SES levels?
SELECT
    SES,
    AVG(Sleep_Duration_hours) AS Avg_Sleep_Duration
FROM patient_data
GROUP BY SES;
																																	
-- 7 What is the distribution of cholesterol levels across different physical activity levels?
SELECT
    Physical_Activity_Level,
    MIN(Cholesterol_Levels) AS Min_Cholesterol,
    MAX(Cholesterol_Levels) AS Max_Cholesterol,
    AVG(Cholesterol_Levels) AS Avg_Cholesterol,
    STDDEV(Cholesterol_Levels) AS StdDev_Cholesterol
FROM patient_data
GROUP BY Physical_Activity_Level;