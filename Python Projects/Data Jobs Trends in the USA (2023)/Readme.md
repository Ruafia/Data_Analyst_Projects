# Analyzing Monthly Job Demand for Data Jobs in the USA (2023)

### Overview:
This project provides a detailed analysis of job postings for data-related roles in the United States throughout 2023. Using a publicly available dataset from the 
Hugging Face Datasets Library, the project visualizes trends in monthly job demand for top data roles such as "Data Scientist," "Data Analyst," and 
"Machine Learning Engineer." The analysis includes filtering, transforming, and visualizing the data to identify patterns in the job market.

By the end of the project, we'll gain insights into how job postings fluctuate across months and which roles are in high demand. This analysis is particularly 
useful for job seekers, recruiters, and market analysts.

### Key Features:
- Data Preprocessing:
    Conversion of job posting dates to a datetime format.
    Filtering for job postings in the United States.
    Creation of new columns for month names and their corresponding numerical values.

- Data Aggregation:
    Grouping job postings by month and job titles using a pivot table.
    Identification of the top 3 job titles based on posting frequency.

- Data Visualization:
    Line graphs illustrating monthly job posting trends for the most in-demand data roles.

### Dataset:
The project utilizes the "lukebarousse/data_jobs" dataset from the Hugging Face Datasets Library. This dataset contains job posting information for various roles 
across multiple countries.
- #### Key Columns:
      job_country: Country of the job posting.
      job_posted_date: Date the job was posted.
      job_title_short: Simplified job title.
      Other metadata about the jobs.

### Results and Insights:
The project generates a graph illustrating monthly job posting trends for the top 3 data-related job titles in the United States. These insights can help:
- Identify periods of high demand for specific roles.
- Understand seasonal patterns in the job market.
- Inform career planning and recruitment strategies.

### Acknowledgments:
Special thanks to Luke Barousse for providing the dataset on Hugging Face. The project heavily relies on pandas and matplotlib for data analysis and visualization.
