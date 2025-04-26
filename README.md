# HR_DATA-ANALYSIS

I HAVE ANALYSED THE HR DATA. THE PROBLEM STATEMENT WAS TO DISCUSS THE KPIs FOR EMPLOYEE DATA. 
fIRST  I HAVE UPLODED DATA TO PYTHON THEN TRANSFERED IT TO THE MYSQL.

I HAVE USED PYTHON, MYSQL FOR THE PROJECT.

PYTHON:

import pandas as pd
import numpy as np

hr = pd.read_csv("C:/Users/ADM/Desktop/HRDATA.csv")

hr.info()

hr.isnull().sum()

from sqlalchemy import create_engine 

db_user = 'root'
db_password = '0000'
db_host = 'localhost'
db_port = '3306'
db_name = 'pop'

connection = f"mysql+mysqlconnector://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}"

engine = create_engine(connection)

engine

hr.to_sql("hr_data",engine, if_exists = "replace",index =False)

MYSQL:

#Total Employees

SELECT 
    COUNT(DISTINCT emp_no) AS Total_Employee
FROM
    pop.hr_data;

# Attrition Count

SELECT 
    COUNT(DISTINCT emp_no) AS Total_Attrition
FROM
    pop.hr_data
WHERE
    attrition = 'Yes';

# ATTRITION RATION

SELECT 
    ROUND(((SELECT 
                    COUNT(*)
                FROM
                    pop.hr_data
                WHERE
                    attrition = 'Yes') * 100) / COUNT(*),
            2) AS Total_Emp
FROM
    pop.hr_data;

# KPI- Active Employee

SELECT 
    COUNT(*) AS Active_Emp
FROM
    pop.hr_data
WHERE
    attrition = 'No';
    
    
    # Average Age
    
SELECT 
    AVG(Age) AS avg_age
FROM
    pop.hr_data;
    
    # Attrition by Gender
    
   SELECT 
    gender, COUNT(attrition) AS Attr_cn
FROM
    pop.hr_data
GROUP BY gender;
    
	SELECT 
    gender, COUNT(attrition) AS Attr_cn
FROM
    pop.hr_data
WHERE
    attrition = 'Yes'
GROUP BY gender;
    
	SELECT 
    gender, COUNT(attrition) AS Attr_cn
FROM
    pop.hr_data
WHERE
    attrition = 'No'
GROUP BY gender;
    
    # Department Wise Attrition
    
    select department, count(*) as Total_Attr
    from pop.hr_data
    group by department;
    
    # No of Employee by Age Group

	SELECT 
    age_band, COUNT(*) AS Total_Employee
FROM
    pop.hr_data
GROUP BY age_band;
     
     # Education Field wise Attrition

       SELECT 
    education_field, COUNT(*) AS Total_Emp
FROM
    pop.hr_data
GROUP BY education_field;
        
        # Attrition Rate by Gender for different Age group
        
         SELECT 
    gender,
    age_band,
    ROUND(((SELECT 
                    COUNT(*)
                FROM
                    pop.hr_data
                WHERE
                    attrition = 'Yes') * 100 / COUNT(*)),
            2) AS Attrition_Rate
FROM
    pop.hr_data
GROUP BY gender , age_band
ORDER BY gender; 


# Job Satisfaction Rating

SELECT 
    department, AVG(job_satisfaction) AS rating
FROM
    pop.hr_data
GROUP BY department;

