# NYC Rat Sightings: A Spatial and Socioeconomic Analysis

## Project Summary

This project analyzes over a decade of NYC 311 rat sighting complaint data to better understand the drivers of rodent activity across the city's zip codes. By joining complaint records to Census population and income estimates, the analysis constructs density-adjusted sighting rates and applies linear regression with borough fixed effects to find predictors with impact. The analysis draws on SQL for data aggregation, R for statistical modeling and visualization, and geospatial shapefiles for choropleth mapping.

## Research Question

Which NYC neighborhoods have disproportionately high rat sighting rates, and do population density and income explain the variation?

## Key Findings

- **Population density is the dominant predictor** of rat complaint rates, with each 1,000 person/km² increase associated with approximately 0.062 additional sightings per 1,000 residents per year (p < 0.001). The correlation between density and sightings is R = 0.45.
- **Median household income showed no statistically significant relationship** with rat sighting rates in any model specification — density, not wealth, drives the pattern at the zip code level.
- Brooklyn and Manhattan consistently logged the highest complaint volumes across the study period, with a notable city-wide spike in sightings during 2015–2017.
- A residual map reveals meaningful local variation beyond what density alone predicts, pointing to building stock, sanitation infrastructure, and reporting behavior as likely secondary drivers.
- A borough fixed-effects model explains roughly 31% of zip-code-level variance in sightings (R² = 0.309), up from 23% in the baseline specification.

## Tools & Methods

**Language:** R
**Packages:** tidyverse, ggplot2, sf, DBI/RSQLite, broom, gtsummary, modelsummary, ggrepel, performance, kableExtra
**Methods:** SQL aggregation and table joins, OLS regression, borough fixed effects, robust standard errors (HC3), Pearson correlation analysis, spatial choropleth mapping, residual Z-score mapping
**Data:** NYC 311 Rat Sightings (NYC Open Data), Modified Zip Code Tabulation Areas shapefile (NYC Open Data), ACS 2024 5-Year Estimates (Census Reporter) — median household income (B19013) and total population (B01003)

## Rendered Report

The full analysis, including choropleth maps, borough-level heatmaps, scatterplots comparing density and income effects, residual maps, and regression tables is best viewed in the rendered HTML report:

**[Rat_Analysis.html](Rat_Analysis.html)**
