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

