-- models/duplicate_records.sql

-- Create a model to identify duplicate records based on specific columns

-- Step 1: Identify duplicate records
WITH duplicates AS (
  SELECT
    *,
    COUNT(*) OVER (PARTITION BY BE20, "Famille_met", "metier", "Dept","met","xmet","smet" ) AS duplicate_count
  FROM BMO.PUBLIC."main_oeuvre"
),

-- Step 2: Filter out duplicate records
filtered_data AS (
  SELECT *
  FROM duplicates
  WHERE duplicate_count > 1
)

-- Step 3: Final output
SELECT *
FROM filtered_data