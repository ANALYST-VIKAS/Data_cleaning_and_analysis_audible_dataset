# Data_cleaning_and_analysis_audible_dataset

 I cleaned an Audible audiobook dataset using Python's  **pandas** library and performed data analysis in **MySQL** to derive insights. 
The dataset includes a uncleaned csv file: `audible_uncleaned`.

## Dataset Information

- **Dataset Source:** https://www.kaggle.com/datasets/snehangsude/audible-dataset?select=audible_uncleaned.csv
- **Tables:**
  - `audible_uncleaned`: An ucleaned dataset which has the information of the audiobooks relesase from .

## Dataset Overview

- **audible_uncleaned.csv:**
  - Total Rows: 87469
  - Total Columns: 9
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
  | rating      | No of reviews received by the audiobook |


## 20 Questions Explored

From the dataset, I explored the following 15 questions utilizing MYSQL:

1)What are the top 5 audiobooks with the highest ratings?
2)Which 5 audiobooks have received the most ratings? 
3)Which authors have the highest average ratings across all their audiobooks?
4)What is the total duration of all audiobooks released in the last year?
5)What is the most expensive audiobook in the dataset, and who is the author?
6)How many audiobooks were released each year, and what is the average price for each year?
7)Which narrator has narrated the most audiobooks?
8)What is the total number of audiobooks that have a rating of 4.5 or higher?
9)Which audiobook has the highest number of ratings but a relatively low star rating (less than 3.0)?
10)What are the top 3 most expensive audiobooks that are longer than 8 hours?
11)Which authors have produced more than 5 audiobooks, and what is their average rating?
12)How many audiobooks were released after a certain date (e.g., January 1, 2020)?
13)Which audiobook has the longest duration, and what is its price and rating?
14)Find the  top 5 narrators who narrated the most number of audiobooks.
15)What percentage of audiobooks have a rating of at least 4 stars?
16)Find the percentage breakdown of audiobooks by each language?
17)Find the top 3 most expensive audiobooks of each language?
