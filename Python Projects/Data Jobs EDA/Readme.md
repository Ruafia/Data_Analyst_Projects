# Data Jobs EDA: Trends and Insights (2023)

### Overview:
This project explores job trends for data-related roles in the United States, focusing on Data Analysts. Using the "lukebarousse/data_jobs" dataset, we 
conduct exploratory data analysis (EDA) to uncover insights about job demand, locations, work-from-home options, degree requirements, and employer trends.

The analysis leverages Python and visualization tools to present meaningful insights in an intuitive way, making it a valuable resource for job seekers, 
recruiters, and market analysts.

### Features:
- Job Location Analysis:
    - Identified the top 10 locations for Data Analyst job postings in the U.S.
    - Visualized job counts by location using bar charts.
- Workplace and Benefits Insights:
    - Analyzed the ratio of jobs offering:
    - Work-from-home options.
    - Health insurance benefits.
    - Degree requirements.
    - Displayed results using pie charts.
- Employer Trends:
    - Examined companies with the highest number of job postings for Data Analysts.
    - Visualized company-specific job counts with bar charts.
- Interactive and Intuitive Visualizations:
    - Used seaborn and matplotlib to create engaging and professional charts.

### Dataset:
The project uses the "lukebarousse/data_jobs" dataset from the Hugging Face Datasets Library, containing information about job postings across multiple roles 
and countries.
#### Key Columns Used:
      job_title_short: Shortened job title (e.g., "Data Analyst").
      job_country: Country of the job posting.
      job_location: Location of the job posting.
      job_work_from_home: Indicates if the job offers work-from-home options.
      job_no_degree_mention: Indicates if a degree is required.
      job_health_insurance: Indicates if health insurance is offered.
      company_name: Name of the hiring company.
      
### Visualizations:
- Job Count by Location:
    - A bar chart showing the top 10 U.S. locations with the highest number of Data Analyst job postings.
- Workplace and Benefits Ratio:
    - A set of pie charts illustrating:
        - Percentage of jobs offering work-from-home options.
        - Percentage of jobs mentioning degree requirements.
        - Percentage of jobs offering health insurance.
- Top Employers for Data Analysts:
    - A bar chart highlighting the top 10 companies posting the most Data Analyst jobs in the U.S.

### Insights:
- Certain locations have a significantly higher demand for Data Analysts, offering potential relocation opportunities for job seekers.
- A considerable number of jobs offer work-from-home options, reflecting the growing trend of remote work.
- Degree flexibility and health insurance are key factors for many employers, highlighting the evolving job market.

### Acknowledgments:
- Dataset: Thanks to Luke Barousse for the dataset available on Hugging Face.
- Tools: The project uses pandas, matplotlib, and seaborn for data analysis and visualization.
