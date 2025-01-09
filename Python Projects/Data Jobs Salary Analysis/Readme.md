# Analysis of Skills and Salaries in Data Jobs

### Overview:
This project analyzes skill demands and their corresponding median salaries for data-related roles in the United States, such as Data Scientist, Data Analyst, and 
Data Engineer. Using Python for data processing and visualization, the project provides insights into the most sought-after skills and their financial value. 
By examining skill frequency and salary distribution, the analysis highlights key trends in the data job market.

### Key Features:
1. Skill Demand Analysis
  - Identified the most frequently requested skills in job postings across top data roles.
  - Ranked skills based on their frequency (skill_count) across job postings.
2. Salary Analysis
  - Examined median salaries associated with specific skills.
  - Highlighted skills with the highest salary potential to help prioritize upskilling.
3. Top Job Titles
  - Focused on the top 6 job titles:
      - Data Scientist
      - Data Analyst
      - Data Engineer
      - Senior Data Scientist
      - Senior Data Engineer
      - Senior Data Analyst
4. Data Visualization
  - Visualized the frequency and median salary for top-requested skills.
  - Used horizontal bar charts and tables for better clarity and insight.

### Dataset:
The project utilizes a dataset containing job postings for data roles in the United States. It includes information about job titles, requested skills, and 
salary data.
#### Key Columns:
    job_title_short: Shortened job title (e.g., "Data Scientist").
    job_skills: Skills required for the job posting.
    median: Median salary associated with a specific skill.

### Steps in the Analysis:
1. Data Preprocessing
    - Converted job_skills from a string representation to Python lists using ast.literal_eval().
    - Flattened the job_skills column to allow analysis of individual skills.
    - Grouped and counted occurrences of each skill.
2. Skill-Salary Relationship
    - Aggregated skill data to calculate median salaries associated with each skill.
    - Sorted skills by both frequency (skill_count) and median salary to highlight top trends.
3. Visualization
    - Created bar charts to represent:
    - Frequency of the top-requested skills.
    - Median salaries for the most in-demand skills.

### Findings:
- Top Skills by Frequency:
    - The most in-demand skills include Python, SQL, Tableau, Excel, and Power BI.
    - Python appears in 1,431 job postings, making it the most sought-after skill.
- Skills with the Highest Median Salaries:
    - Skills like Dplyr, Bitbucket, and Gitlab command high median salaries, exceeding $180,000.
    - Emerging or niche technologies like Solidity and Hugging Face also show high salary potential.
- Salary Insights for Popular Skills:
    - Widely used tools like Python, SQL, and Tableau offer competitive median salaries in the range of $90,000–$97,500.

### Visualization Highlights:
- Skill Frequency: Bar charts showing the most requested skills across job postings.
- Skill Salary: Horizontal bar charts illustrating the median salaries for top-requested skills.

### Acknowledgments:
Special thanks to the data providers for making this analysis possible. The project leverages Python and its powerful libraries to extract meaningful 
insights from the dataset.
