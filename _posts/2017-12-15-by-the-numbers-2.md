---
title: "By The Numbers 2"
layout: post
date: 2017-12-15
# description: "More data, more fun."
category: blog
tag: [biometric, data-analysis]

---

Welcome to **By The Numbers 2**!

*Background*: This is a continuation of the [first iteration]({% post_url 2017-03-09-by-the-numbers-1 %}) of my biometric analysis, with more data and more advanced techniques.  The goal was to predict a new metric representing *happiness* - a value from 1-20 measuring how I felt that day in terms of well-being and contentment.  Although the features in this dataset were not the conventional predictors of happiness, it was still interesting to see if there were any relationships between them.  This project was completed in five main stages and disclaimer that there may be inaccuracies in my analysis.  That being said, onto the project!

--- 

## Phase I: Data Preprocessing

This stage consisted of manipulating the data into a usable format. Skipping those unexciting details, the breakdown of the dataset was:

- Date
- Total Productive Time (Hours)
    - College Logistics
    - Math Immersion
    - Data Science
    - Core Projects
    - Personal Endeavors
- Total Sleep (Hours)
    - Bed Time
    - Wake Up
    - Nighttime Sleep
    - Nap Length
- Remaining Time (hours)
- Efficiency (Percentage)
- Calories
- **Happiness Index** (1-20)

---

## Phase II: Data Imputation & Hypothesis Testing

Several intermediate steps had to be performed before conducting any statistical analysis.  Out of the 15 numerical columns in the dataset, 9 of them were missing data, ranging from 2% missing to 64%.

| Core Projects | Data Science |  College.Logistics| ...  |  Happiness.Index | Total.Productive.Time | Date | Calories
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|  64% |  40% | 38%  | ...  |  21% | 3.6% | 0% | 0% | 


<!-- insert table -->

A simple median imputation was completed for the two columns that had <5% missing data (`Total Productive Time` & `Remaining Time`).  This was done as opposed to a mean imputation because of the discrepancy between the mean and medians of these variables, implying a large number of outliers skewing those columns that would have to be addressed later.

Moving onto `Happiness Index`, the response we're trying to predict, a quick visualization of the data revealed the first 30 values are missing since I didn't start measuring this until about a month into the semester.  I removed those rows completely from the primary dataset for now, possibly to be used as a holdout set for testing later.  

![]({{site.url}}/assets/images/2_btn_images/happiness_index_missing.png)
*Happiness.Index Over Time* 

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

For us, we want \\( p = \frac{1}{2} \\)  and $$N = 110$$ days that existed in the data.

Here's the theoretical frequencies of runs, which decay rapidly with the expected number of runs of length 4 or 5 approaching 0.  So if the data were truly missing at random, we shouldn't see too many intervals 3+ days missing at a time.  

![]({{site.url}}/assets/images/2_btn_images/expected_value_runs.png)
*Distribution of Runs* 

The expected number of runs was calculated for the actual data, and the next bar plot illustrates the difference between this and observed frequency of runs in our sample.

![]({{site.url}}/assets/images/2_btn_images/observed-expected_runs.png)
*Empirical vs Theoretical Distribution* 

Visually our sample doesn't seem to be abnormal, meaning the data could have been missing completely at random, but to better quantify the difference between these two distributions, the metric _total variation distance_ (TVD) was used.  The observed test statistic between the collected data and expected values is **4.25**.

![]({{site.url}}/assets/images/2_btn_images/expected_value_runs.png)
*Empirical Test Statistic Distribution* 

The p-value generated was $$0.2605, (>.05)$$ so we fail to reject the null and conclude that the data from this column was missing completely at random, so it can be safely imputed.  I believed that the data was MAR because I thought the missing data was probably correlated with either amount of sleep or time of the year (i.e. I busy around exams so didn't log any data), but our hypothesis test has told us otherwise.  However, I still removed this column since the data was so sparse it would contribute more noise than useful info to the overall model.  

## Phase III: Imputation via Linear Regression

Five columns remained that still had absent information.  A simple mean replacement would be insufficient because it could potentially skew the variance of the sample, which was not be preferred since I planned to perform PCA later on.  I decided to try and explicitly predict the time spent on `Math Immersion` using linear regression, and then use an established package to fill in the remaining columns. I examined the correlation matrix below to determine if any variable could be used to predict the missing values in `Math Immersion`.

![]({{site.url}}/assets/images/2_btn_images/correlation_heatmap.png)
*Correlation Matrix* 

The first option was to use `Total Productive Time`because it had the strongest correlation without having any missing data, but further inspection revealed that the values in this column corresponding to days with missing data in `Math Immersion` were all 0, making any predictions from the linear model redundant.  

The second option was to use `Remaining Time` instead, but the values corresponding to the missing data were all $$>6$$, meaning any linear model would potentially be overfit to the existing data below. 

![]({{site.url}}/assets/images/2_btn_images/math_vs_remaining_time.png)
*Math.Immersion vs Remaining_Time* 

The last resort was to use `Calories` to predict time spent on math, which seems strange on the surface.  But the correlation was a reasonable -0.47 and at least the predictor column was complete and there was less of a chance for overfitting.  So I fit a least squares model to `Math Immersion` against `Calories`, and would predict the missing values in the math column using the model.  The plots below shows the best fit line and several diagnostic plots.

![]({{site.url}}/assets/images/2_btn_images/least_squares.png)
*Linear Regression Model* 

<figure class="third">
    <img src="/assets/images/2_btn_images/linear_model_residuals.png" alt="">
    <img src="/assets/images/2_btn_images/qqplot.png" alt="">
    <img src="/assets/images/2_btn_images/leverage-plot.png" alt="">
    <figcaption class='caption'>Regression Diagnostics</figcaption>
</figure>

The residuals let us know we haven't missed some non-linearity, the qqplot indicates our normal assumption on the response & predictor are reasonable, and the leverage plot shows that there's no outliers messing up our model.  

## Phase IV: Complete the Dataset

The remaining columns: `Personal Endeavors`, `College Logistics`, `Data Science`, and `Efficiency` all ranged from 35% - 45% missing and would be imputed using the MICE package in R through predictive mean matching (PMM). The plots below depict the imputed (magenta points) vs observed values (blue points).  Because the densities of the imputed values and the original distributions are similar, the predicted values are probably plausible.

![]({{site.url}}/assets/images/2_btn_images/pmm_densities.png)
*Imputed Densities* 

`Efficiency` doesn't match, but it will be recalculated from the completely imputed data, through the recalculation of `Total Productive Time` & `Remaining Time`.

With all the columns filled in and recalculations complete, here is a faceted time series of the final dataset.  It looks cool and it's interesting to glance at the periodicities to see if any patterns can be picked out visually.

![]({{site.url}}/assets/images/2_btn_images/complete_df_timeseries.png)
*Time Series of Complete Data* 


## Phase V: Dimensionality Reduction

With a completed dataset, it was now possible to run principal component reduction (PCA) to possibly determine what linear combinations of the features are the best predictors of happiness.  Before doing so, categorical variables were removed and each column was standardized by mean centering & normalization so the algorithm was not skewed towards predictors with greater magnitudes or extreme distributions.

In the scree plot we can see the first 2 principal components (PCs) capture $$>50\%$$ of the variance, and we can extract the feature weights of these top two PCs.  

<figure class="half">
    <img src="/assets/images/2_btn_images/scree_plot.png" alt="">
    <img src="/assets/images/2_btn_images/pcs.png" alt="">
    <figcaption class='caption'>Scree Plot and Principal Components</figcaption>
</figure>

Here's the 11 dimensional dataset projected onto these two components, along with each 2D projected feature vector (observation/row) and the magnitude & direction of each feature.

![]({{site.url}}/assets/images/2_btn_images/pca_biplot.png)
*Biplot* 

The red arrows point to how much weight the features contribute to each principal component and the points can be interpreted as a combination of the red vectors, depending only on direction because it is difficult to say anything in terms of distances since the scale of the circle of correlations and the graph of the variables are different.  

We can then fit a model trying to predict `Happiness.Index` using the principal components as features.  The root mean squared error for the principal component regression is plotted below, where the model was fit using each of 1-10 components.   

![]({{site.url}}/assets/images/2_btn_images/pcr_rmse.png)
*RMSE* 

The range of `Happiness.Index` was discrete values from 1-20 so the discrepancy between using only 1 component vs all 10 components wasn't too bad, considering the range in errors was only about .1, or .5% difference in the actual possible values.  But we know that some of the original features are direct linear combinations of the others (e.g. `Total Sleep` & `Total Productive Time` so less is more in this case to avoid overfitting.  

A multiple regression model was trained using the first 2 components ($$RMSE = 1.477$4) and a scatterplot of fitted values vs measured values is shown below.

![]({{site.url}}/assets/images/2_btn_images/predicted-vs-measured-pcr.png)
*Predicted vs Measured Values* 

In the future we'd like a more scrutable model since we can't explicitly say which variables contributed most to happiness.  The first two iteration of this ongoing project (including this one) primarily focused on exploratory data analysis, so hopefully the next iteration will have an emphasis on drawing more interesting conclusions, armed with more data & possibly additional features.

That concludes *By the Numbers 2*!  Thank you for reading, and feel free to let me know of any corrections or feedback.  

Code used is [here][btn2.md].  

<!-- [btn2.md]: https://github.com/mdong127/biometric_2/blob/master/report/sp17_analysis.md -->

**Possible Continuations:**

- Classification: If described the features of a day, what day of the week is it most likely to come from?  Create an interactive plot. 
- Rerun multiple regression without PCA - verify that PCR should be better.  Results change with every iteration?  where is the randomness coming from? 
- Question: Does time you sleep matter or just amount of sleep?
- Extend time series to include summers, as well as join with past semesters.




    

