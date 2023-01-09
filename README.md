# Olist - Brazilian E-commerce Analysis

## Description
- A data analysis project analysing the data from the Brazilian E-commerce website, [Olist](https://olist.com/pt-br/)
- The data is downloaded from [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- The raw data and all SQL queries (for data analysis) are stored in BigQuery, a Google Cloud data warehouse and the pipeline is managed using [dbt](https://docs.getdbt.com/)

## Project Contents
- [seeds/](https://github.com/sagar-0817/brazilian_ecommerce_olist/tree/main/seeds)
    - the directory contains 8 different datasets (csv files) corresponding to the orders
    - the Exploratory Data Analysisc(EDA) of the datasets could be found below
    - these individual datasets have relation with each other (Relational Data) and are loaded in BigQuery
    - the data model indicating the relationship between them could be found below

## Exploratory Data Analysis

- The [colab](https://colab.research.google.com/) notebook below contains the EDA of the main datasets used in the SQL queries
  * **brazilian_ecommerce_olist_EDA.ipynb** : [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1MIKRY4rZSadXoctipYIGkuRp08tGZ7oB?usp=sharing)

## Data model

- The main datasets and the relationship between them could be seen in the following diagram
![brazilian_ecommerce_olist_data_model](https://user-images.githubusercontent.com/74661476/211241530-407b133f-6072-4aae-976b-40dcf7f03b09.jpg)
