-- Category 1: Basic Data Retrieval
-- 1 How many individuals are in the dataset?
select count(*)
from patient_data;

-- 2 How many individuals are male?
select count(*)
from patient_data
where Gender="male";

-- 3 How many individuals are from the "East" region?
select count(*)
from patient_data
where Region="East";

-- 4 List the unique values for the Smoking Status column.
select distinct(Smoking_Status)
from patient_data;

-- 5 Display the Region and the number of individuals in each region.
select Region, count(*) as total_patient
from patient_data
group by Region;

-- 6 Find the minimum and maximum Age in the dataset.
select 
min(age) as minimum_age,
max(age) as maximum_age
from patient_data;

-- 7 What is the most common Diet Type among individuals?
select 
	Diet_Type, 
	count(*) as diet_frequency
from patient_data
group by Diet_Type
order by count(*) desc
limit 1;

-- Category 2: Data Filtering and Aggregation

-- 1 What is the average BMI for individuals who are "Never" smokers?
select 
	avg(BMI) as avg_BMI
from patient_data
where Smoking_Status= 'Never';

 -- 2 Find the number of individuals with Cholesterol Levels below 150 mg/dL.
select 
	count(*) as total_number
from  patient_data
where Cholesterol_Levels < 150;

-- 3 Calculate the average Sleep Duration for individuals in the "Urban" category.
select 
	avg(Sleep_Duration_hours) as avg_sleep_duration
from patient_data
where Urban_Rural='Urban';

-- 4 Group individuals by Gender and find the avearge Resting_Heart_Rate for each group.
select 
	gender,avg(Resting_Heart_Rate)as avg_resting_heart_rate_level
from patient_data
group by Gender;

-- 5 Find the number of individuals with Diabetes and a Family History of Heart Disease
SELECT COUNT(*) AS count_individuals
FROM patient_data
WHERE Diabetes = 'Yes' AND Family_History_of_Heart_Disease = 'Yes';

-- 6 What is the average Blood Pressure (diastolic) for individuals who consume alcohol "Occasionally"?
select 
	avg(Blood_Pressure)
from patient_data
where Alcohol_Consumption='Occasionally';

-- 7 Find the percentage of individuals with a Hypertension diagnosis.
select sum;
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM patient_data)) AS hypertension_percentage
FROM patient_data
WHERE Hypertension = 'Yes';

-- 8 What is the average Screen Time for individuals with a BMI greater than 30?
select avg(Screen_Time_hours)
from patient_data
where BMI > 30;