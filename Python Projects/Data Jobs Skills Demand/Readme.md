# Likelihood of Skills in US Job Postings

### Overview:
This project analyzes the likelihood of skills requested in job postings for data-related roles in the United States. Using the "lukebarousse/data_jobs" 
dataset, the project identifies the most sought-after skills for top job titles like Data Scientist, Data Analyst, and Data Engineer. By flattening skill data, 
grouping it by job titles, and visualizing it, the project provides valuable insights into skill demands in the U.S. job market.

### Features:
- Skill Analysis for Top Job Titles:
    - Extracted and grouped skills for job titles in the U.S.
    - Identified the top 5 skills requested for the top 3 job titles.
- Data Preprocessing:
    - Converted skill data from string to list format for processing.
    - Flattened nested skill lists into individual rows for easier analysis.
- Skill Likelihood Calculation:
    - Calculated the percentage likelihood of each skill being requested for specific job titles based on total postings.
- Visualization:
    - Created horizontal bar charts for the top 5 skills for each job title.
    - Visualized both raw skill counts and percentage likelihoods to understand trends.

### Dataset:
The project utilizes the "lukebarousse/data_jobs" dataset from the Hugging Face Datasets Library, which contains information about job postings for various roles 
across multiple countries.
#### Key Columns:
    job_title_short: Simplified job title (e.g., "Data Scientist").
    job_country: Country of the job posting.
    job_skills: List of skills requested in the job posting.
    job_posted_date: Date the job was posted.

### Steps in the Analysis:
1. Data Preprocessing
    - Conversion: Converted job posting dates to datetime format and transformed job_skills from string to Python lists using ast.literal_eval().
    - Filtering: Filtered job postings for the U.S. only.
2. Flattening and Grouping Skills
    - Flattened the job_skills column to explode list-like data into individual rows.
    - Grouped job skills by job titles to calculate their frequency.
3. Skill Likelihood Calculation
    - Calculated the likelihood of each skill being requested as a percentage of total postings for each job title.
4. Visualization
    - Created bar charts to visualize:
        - Top 5 skills for each job title based on count.
        - Likelihood percentages of top skills for each job title.

### Visualization Highlights:
- Top Skills by Count:
    - Horizontal bar charts showing the top 5 skills for each job title based on frequency.
- Likelihood of Skills:
    - Horizontal bar charts showing the percentage likelihood of skills being requested for each job title.
    - Added annotations to highlight percentages on the charts.

### Results and Insights:
- Top 3 Job Titles Analyzed: Data Scientist, Data Analyst, Data Engineer.
- Most Requested Skills: Key skills identified include Python, SQL, Tableau, and Machine Learning.
- Skill Likelihood: Skills like Python and SQL show the highest percentage likelihood across multiple job titles, indicating their essential role in data-related positions.

### Acknowledgments:
- Dataset: Thanks to Luke Barousse for providing the dataset available on Hugging Face.
- Tools: The project utilizes pandas, matplotlib, and seaborn for data analysis and visualization.
