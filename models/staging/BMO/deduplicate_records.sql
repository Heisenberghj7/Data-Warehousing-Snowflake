-- models/eliminate_duplicates.sql

-- Create a model to eliminate duplicate values based on specific columns and keep only one occurrence

-- Step 1: Assign row numbers to each record within its partition
WITH deduplicated AS (
  SELECT
    ROW_NUMBER() OVER (PARTITION BY BE20, "Famille_met", "metier", "Dept" ORDER BY BE20) AS row_num,
    *
  FROM BMO.PUBLIC."main_oeuvre"
),

-- Step 2: Filter out duplicate records and keep only one occurrence
filtered_data AS (
  SELECT *
  FROM deduplicated
  WHERE row_num = 1
)

-- Step 3: Final output
SELECT *
FROM filtered_data