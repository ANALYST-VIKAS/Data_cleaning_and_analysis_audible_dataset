# Data_cleaning_and_analysis_audible_dataset

This project involves cleaning and analyzing an Audible audiobook dataset. The dataset was downloaded from **Kaggle**,
and the data was cleaned using **Python** and pandas before being imported into **MySQL** for further analysis.

## Dataset Information

- **Dataset Source:** https://www.kaggle.com/datasets/snehangsude/audible-dataset?select=audible_uncleaned.csv
- **Tables:**
  - `audible_uncleaned`: An ucleaned dataset which has the information of the .

## Dataset Overview

- **audible_uncleaned.csv:**
  - Total Rows: 87489
  - Total Columns: 8
  - Each row corresponds to information about an audiobook


  | Column      | Description |
  |-------------|-------------|
  | name        | Audiobook's name |
  | author      | Name of the author of the audiobook |
  | narrator    | Name of the narrator of the audibook |
  | time        | Length of the audiobook |
  | releasedate | When the audiobook was released|
  | language    | language of the audiobook |
  | stars       | No. of stars the audiobook received |
  | price       | Price of the audiobook in INR |


## Project Overview

The main objectives of this project were to:
- Clean the raw audiobook dataset.
- Perform data analysis to answer key business questions.
- Store and manipulate the cleaned data using MySQL for advanced querying.
- 
### Files

- `audible_uncleaned.csv`: The raw dataset downloaded from Kaggle.
- `cleaned_audiobook_data.csv`: The cleaned dataset after processing in Python.

## Data Cleaning Process

1. **Handled  Data**: 
   - Removed unnecessary strings from the `author` and `narrator` columns
   - Removed the rows whose release_dates were after 31-12-2022
   - Inputed certain missing values where possible.
  

2. **Formatted Columns**:
   - Converted `release_date` from string to `datetime`.
   - Added a new `book_id` colulmn 
   - Standardized the `price` and `duration` columns.
   - Created new columns `rating` and `no_of_ratings` from the `stars` column

4. **Transformed Data**: 
   - Assigned with `null` to the 'Not rated yet' rows in `stars` column.
   - Removed the redundant date values and kept the `release_date` column upto year 2022.

The cleaned data was then exported as `cleaned_audiobook_data.csv` and imported into MySQL for analysis.

## 15 Key Questions Answered

This project involved answering the following key questions using SQL queries in MySQL:

1. **What are the top 5 audiobooks with the highest ratings?**

2. **Which authors have the highest average ratings across all their audiobooks?**

3. **What is the total duration of all unique audiobooks released in the  year 2022?**

4. **What is the most expensive audiobook in the dataset, and who is the author?**

5. **How many unique audiobooks were released each year, and what is the average price for each year?**

6. **Which narrator has narrated the most audiobooks?**

7. **What percent of audiobooks that have a rating of 4.5 or higher?**

8. **Which audiobook has the highest number of ratings but a relatively low star rating (less than 3.0)?**

9. **What are the top 3 most expensive audiobooks that are longer than 8 hours?**

10. **Which authors have produced more than 10 audiobooks, and what is their average rating?**

11. **Which audiobook has the longest duration, and what is its price and rating?**

12. **Find the top 5 narrators who narrated the most audiobooks.**

13. **What percentage of audiobooks have a rating of at least 4 stars?**

14. **Find the percentage breakdown of audiobooks by each language.**

15. **Find the top 3 most expensive audiobooks of each language.**

16. **What is the distribution of audiobook durations.**<br>
  **(e.g., how many fall into categories like less than 0-2 hours, 2-4 hours, 4-6 hours,6+ hours)?**

## Tools Used

- **Python**: Data cleaning and manipulation using pandas.
- **MySQL**: Storing, querying, and analyzing the cleaned data.

## How to Run

1. Download both the `cleaned_audiobook_data.csv` and `uncleaned_audiobook_data.csv`.
2. Follow the Jupyter notebook to see the steps taken for data cleaning.
3. Import the cleaned data into your local MySQL database using the provided SQL schema.
4. Run the SQL queries to explore the dataset further.

## Conclusion

This project demonstrates how raw data can be cleaned, transformed, and used for deeper analysis. By leveraging SQL, I was able to extract valuable insights from the Audible audiobook dataset.

Feel free to explore the dataset and try out the SQL queries to analyze the audiobooks!
