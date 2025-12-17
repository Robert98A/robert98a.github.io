# Data Availability and Sources

Due to file size limitations on GitHub, the **raw and cleaned datasets used in this project are not included directly in the repository**.

This document explains where the data comes from, how it was processed, and how it can be accessed if needed.

---

## Original Data Source

The primary dataset used in this analysis is the **Fitbit Fitness Tracker Data**, a publicly available dataset hosted on Kaggle.

**Source:**  
Fitbit Fitness Tracker Data  
Published by: Mobius  
Platform: Kaggle  

Link:  
[FitBit Fitness Tracker Data](https://www.kaggle.com/datasets/arashnic/fitbit)

---

## Dataset Description

The dataset contains personal fitness tracker data from **30 consenting Fitbit users**, including:

- Daily activity summaries (steps, calories, activity intensity)
- Hourly activity data
- Minute-level activity data
- Sleep tracking data
- Heart rate measurements
- Weight and BMI logs

All personal identifiers have been removed. The data is anonymized and publicly available for educational and analytical purposes.

---

## Why the Data Is Not Included in This Repository

The raw and cleaned datasets consist of **multiple large CSV files**, including minute-level and second-level records, which exceed GitHub’s recommended file size limits.

To keep the repository lightweight and focused on:
- analysis logic
- reproducibility
- documentation
- business insights

the datasets themselves are excluded from version control.

---

## Data Processing Overview

The analysis workflow follows these steps:

1. Download raw data directly from Kaggle  
2. Perform initial inspection and validation  
3. Clean and transform the data using R  
4. Generate cleaned datasets for analysis  
5. Produce summary tables and visualizations  

All **data cleaning, transformation, and analysis logic** is fully documented and reproducible using the scripts available in the `scripts/` directory.

---

## How to Reproduce the Analysis

To reproduce the analysis locally:

1. Download the dataset from Kaggle using the link above  
2. Extract the CSV files to a local directory  
3. Update the data path in the analysis scripts if necessary  
4. Run the scripts in the following order:
   - `01_packages.R`
   - `02_import_inspect.R`
   - `03_clean_transform.R`
   - `04_analysis_summary.R`
   - `05_visualizations.R`

This will regenerate the cleaned data, summaries, and visual outputs used in the case study.

---

## Notes

- The dataset is used as a **proxy** for Bellabeat smart device usage and is not proprietary Bellabeat data.
- Due to the limited sample size and lack of demographic attributes, results should be interpreted as **directional insights**, not definitive population-level conclusions.

---

**Author:** Robert Amartisoaei  
**Project:** Bellabeat Smart Device Usage Analysis  
