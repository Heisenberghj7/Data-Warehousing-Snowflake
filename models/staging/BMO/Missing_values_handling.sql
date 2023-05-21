
WITH source_data AS (
  SELECT *
  FROM BMO.PUBLIC."main_oeuvre"
),

-- Replace missing values with accurate data
cleaned_data AS (
  SELECT
    "annee",BE20,NOMBE20,"Famille_met","Lbl_fam_met","metier","nommetier","Dept","NomDept",
    CASE WHEN "met" = '*' THEN NULL ELSE "met" END AS "met",
    CASE WHEN "xmet" = '*' THEN NULL ELSE "xmet" END AS "xmet",
    CASE WHEN "smet" = '*' THEN NULL ELSE "smet" END AS "smet", 
    REG NUMBER,
    NOM_REG
  FROM source_data
)

SELECT *
FROM cleaned_data




