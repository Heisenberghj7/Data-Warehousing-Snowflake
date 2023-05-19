
WITH source_data AS (
  SELECT *
  FROM BMO.PUBLIC."main_oeuvre"
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
  FROM source_data
)

SELECT *
FROM cleaned_data