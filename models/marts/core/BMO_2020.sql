-- models/eliminate_duplicates.sql

-- Create a model to eliminate duplicate values based on specific columns and keep only one occurrence

-- Step 1: Assign row numbers to each record within its partition
WITH deduplicated AS (
  SELECT
    ROW_NUMBER() OVER (PARTITION BY BE20, "Famille_met", "metier", "Dept","met","xmet","smet" ORDER BY BE20) AS row_num,
    *
  FROM BMO.PUBLIC."main_oeuvre"
),

-- Step 2: Filter out duplicate records and keep only one occurrence
filtered_data AS (
  SELECT *
  FROM deduplicated
  WHERE row_num = 1
),

cleaned_data AS (
  SELECT
    "annee",
    BE20,
    NOMBE20,
    "Famille_met",
    "Lbl_fam_met",
    "metier",
    "nommetier",
    TRY_CAST("Dept" AS NUMBER) AS "Dept",
    "NomDept",
    TRY_CAST("met" AS NUMBER) AS "met",
    TRY_CAST("xmet" AS NUMBER) AS "xmet",
    TRY_CAST("smet" AS NUMBER) AS "smet",
    REG ,
    NOM_REG
  FROM filtered_data
)

SELECT *
FROM cleaned_data