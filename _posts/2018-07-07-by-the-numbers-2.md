---
layout: post
title: "By The Numbers 2"
date: 2018-07-07
excerpt: "More data, more fun."
comments: true
tag: [biometric, data-analysis]
reading_time: true
---

Welcome to By The Numbers 2!

{% post_url 2018-06-06-askoski-proj %}

Background: This is a continuation of the [first iteration]() of my biometric analysis, with more data and more advanced techniques.  The goal was to predict a new metric representing *happiness* - a value from 1-20 measuring how I felt that day in terms of well-being and contentment.  Although the features in this dataset were not the conventional predictors of happiness, it was still interesting to see if there were any relationships between them.  This project was completed in five main stages and here's a disclaimer that there may be inaccuracies in my analysis.  That being said, onto the project!

--- 

## Phase I: Data Preprocessing

This stage consisted of manipulating the data into a usable format. At the end of this phase the remaining variables in the dataset were:

- Date
- Total Productive Time
    - College Logistics
    - Math Immersion
    - Data Science
    - Core Projects
    - Personal Endeavors
- Total Sleep
    - Bed Time
    - Wake Up
    - Nighttime Sleep
    - Nap Length
- Remaining Time & Efficiency
- Calories
- **Happiness Index**

---

## Phase II: Data Imputation & Hypothesis Testing

Several intermediate steps had to be performed before conducting any statistical analysis.  Out of the 15 numerical columns in the dataset, 9 of them were missing data, ranging from 2% missing to 64%.

<!-- insert table -->

A simple median imputation was completed for the two columns that had <5% missing data (`Total Productive Time` & `Remaining Time`).  This was done as opposed to a mean imputation because of the discrepancy between the mean and medians of these variables, implying a large number of outliers skewing those columns that would have to be addressed later.

Moving onto `Happiness Index`, the response we're trying to predict, a quick visualization of the data revealed the first 30 values are missing since I didn't start measuring this until about a month into the semester.  I removed those rows completely from the primary dataset for now, possibly to be used as a holdout set for testing later.  

<!-- insert figure -->

The downward trend is likely attributed due to the increase in workload & stress as the semester progressed. :( 


Now I considered the column with the greatest proportion of missing data, `Core Projects` at 73.6%.  An important distinction for missing data is if it's _missing completely at random_ (MCAR), _missing at random_ (MAR), _missing not at random_ (MNAR). I conducted a hypothesis test to determine if this column was MCAR or not.  

> Null hypothesis: `Core Projects` information is missing with no relation to the days I didn't record the data (i.e. "missing completely at random").  

> Alternative hypothesis: There is a systematic relationship on to those days that could be related to the observed or missing data that needs to be accounted for when imputing values. 

> P-value cutoff: .05

**Experiment:** 

- I converted the column into a logical vector, where each of the 110 rows was an indicator for whether or not anything was recorded that day.  The statistic used to characterize the variability within this distribution was the frequency of days information was recorded consecutively.  Interpreting this as coin flips, I used the number of runs of tails in 110 tosses.   This was chosen as an alternative to a simple proportion of Falses because such a large proportion of the data was already missing, which made the null too easily rejected under that assumption. 

Before actually running a simulation, a few things were established:

The expected runs of the length k in n flips of a p-coin is given by the following formula, which we will use as the source of ground truth:

\\[ (n-k-1)p^k(1-p)^2+2p^k(1-p) = (n-k)p^k(1-p)^2+p^k(1-p^2) \\]

For us, we want \\( p = \frac{1}{2} \\) and N = the 110 days that existed in the data.

Here's the theoretical frequencies of runs, which decay rapidly with the expected number of runs of length 4 or 5 approaching 0.  So if the data were truly missing at random, we shouldn't see too many intervals 3+ days missing at a time.  

The expected number of runs was calculated for the actual data, and the next bar plot illustrates the difference between this and observed frequency of runs in our sample.

<!-- insert plot -->

Visually our sample doesn't seem to be abnormal, meaning the data could have been missing completely at random, but to quantify the difference between these two distributions, the metric _total variation distance_ (TVD) was used.  The observed test statistic between the collected data and expected values is **4.25**.


The p-value generated was 0.2605, (>.05) so we fail to reject the null and conclude that the data from this column was missing completely at random, so it can be safely imputed.  I believed that the data was MAR because I thought it was probably correlated with either amount of sleep or time of the year (busy around exams so didn't track information), but our hypothesis test has told us otherwise.  However, I still removed this feature since the data was so sparse it would contribute more noise to the overall model.  

## Phase III: Imputation via Linear Regression

5 columns remained that still had absent information.  A simple mean replacement would be insufficient because it could potentially skew the variance of the sample, which would not be preferred since I planned to perform PCA later on.  I decided to try and explicitly predict the time spent on `Math Immersion` using linear regression, and then use a published package to fill in the remaining columns. I examined the correlation matrix below to determine if any variable could be used to predict the missing values in `Math Immersion`.

<!-- insert corr matrix -->

The first option was to use `Total Productive Time`because it had the strongest correlation without having any missing data, but further inspection revealed that the values in this column corresponding to days with missing data in `Math Immersion` were all 0, making any predictions from the linear model redundant and not as desirable.  

The second option was to use `Remaining Time`instead, but the values corresponding to the missing data were all > 6, meaning any linear model would potentially be overfit to the existing data below, which has no values >6.  

<!-- insert plot -->

The last resort was to use `Calories` to predict time spent on math, which seems strange on the surface.  The correlation was a reasonable -0.47 and at least the predictor column was complete and there was less of a chance for overfitting.  So I fit a least squares model to for `Math Immersion` vs `Calories`, and would predict the missing values in the math column using the model.  The plots below shows the best fit line and the residuals.

## Phase IV: Complete the Dataset




    

