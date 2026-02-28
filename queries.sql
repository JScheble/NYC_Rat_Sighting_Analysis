-- ============================================================
-- NYC Rat Sightings Analysis – SQL Queries
-- Database: In-memory SQLite (created via R/DBI)
-- Tables:   rat_sightings, income, population
-- ============================================================


-- 1. Borough-level sightings by year (for heatmap and line chart)
SELECT
    borough,
    sighting_year                        AS Year,
    COUNT(*)                             AS Sightings
FROM rat_sightings
WHERE borough != 'Unspecified'
GROUP BY borough, sighting_year;


-- 2. ZIP-level sightings by year and borough
SELECT
    SUBSTR("Incident Zip", 1, 5)         AS ZIP,
    sighting_year                        AS Year,
    borough,
    COUNT(*)                             AS Sightings
FROM rat_sightings
WHERE "Incident Zip" IS NOT NULL
    AND "Incident Zip" != '00000'
    AND borough != 'Unspecified'
GROUP BY ZIP, sighting_year, borough;


-- 3. ZIP-level summary joined with income and population
SELECT
    r.ZIP,
    r.borough,
    AVG(r.Sightings)                     AS Avg_Sightings_per_Year,
    i.Median_Income,
    p.Population,
    AVG(r.Sightings) / p.Population * 1000  AS Sightings_per_1000_per_Year
FROM (
    SELECT
        SUBSTR("Incident Zip", 1, 5)     AS ZIP,
        sighting_year,
        borough,
        COUNT(*)                         AS Sightings
    FROM rat_sightings
    WHERE "Incident Zip" IS NOT NULL
        AND "Incident Zip" != '00000'
        AND borough != 'Unspecified'
    GROUP BY ZIP, sighting_year, borough
) r
INNER JOIN income     i ON r.ZIP = SUBSTR(i.ZIP, -5)
INNER JOIN population p ON r.ZIP = SUBSTR(p.ZIP, -5)
WHERE p.Population > 10000
    AND i.Median_Income IS NOT NULL
    AND i.ZIP != '16000US3651000'
GROUP BY r.ZIP, r.borough, i.Median_Income, p.Population;
