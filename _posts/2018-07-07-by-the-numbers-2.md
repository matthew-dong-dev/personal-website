---
layout: post
title: "By The Numbers 2"
date: 2018-07-07
excerpt: "More data, more fun."
comments: true
tag: [biometric, data-analysis]
reading_time: true
---

Hello, and welcome to By The Numbers 2!

Background: This is a continuation of the [first iteration]() of my biometric analysis, with more data and more advanced techniques.  The goal was this time around was to predict a new metric representing "Happiness" - a value from 1-20 measuring overall well-being and contentment.  Although the features in this dataset were not the conventional predictors of happiness, it was still interesting to see if there were any relationships between them.  This project was completed in five main stages, so that being said, here's By The Numbers 2!

--- 

## Phase I: Data Preprocessing

This stage consisted of manipulating the data into a usable format. At the end of this phase the remaining variables in the dataset were:

- Date & Day
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

Several intermediate steps had to be performed before conducting any statistical analysis.  Out of the 15 numerical columns in the dataset, 9 of them were missing data, ranging from 2% missing all the way up to 64%.



A simple median imputation was completed for the two columns that had <5% missing data (Total Productive Time & Remaining Time).  This was done as opposed to a mean imputation because of the discrepancy between the mean and medians of these variables, implying a large number of outliers skewing the mean that would have to be addressed later.

Moving onto `Happiness Index`, the response we're trying to predict, a quick visualization of the data revealed the first 30 values or so are missing since I didn't start keeping track of this until about a month into the semester.  I removed those rows completely from the primary dataset for now, possibly to be used as a holdout set for testing later.  



The downward trend is likely attributed due to the increase in workload & stress as the semester progressed.


Now I considered the column with the greatest proportion of missing data, `Core Projects` at 73.6%.  An important distinction for missing data is if it's _missing completely at random_ (MCAR), _missing at random_ (MAR), _missing not at random_ (MNAR). I conducted a hypothesis test to determine if this column was MCAR or not.  

> Null hypothesis: `Core Projects` information is missing with no relation to the dates the information was chosen to not to be recorded (i.e. "completely at random")

> Alternative hypothesis: There is a systematic relationship on to those days that could be related to the observed data or missing data that needs to be accounted for when performing data imputation. 

> P-value cutoff: 5%.

**Experiment:** 

- I converted the column into a logical vector, where each of the 110 rows was an indicator for whether or not anything was recorded that day.  The statistic used to characterize the variability within this distribution was the frequency of days information was recorded consecutively.  Or interpreting this as coin flips, I used the number of runs of tails in 110 tosses.   This was chosen as an alternative to a simple proportion of Falses because such a large proportion of the data was already missing, which made the null too easily rejected under that assumption. 

Before actually running a simulation, a few things were established:

The expected runs of the length k in n flips of a p-coin is given by the formula:




[MathJax](http://www.mathjax.org/) is a simple way of including Tex/LaTex/MathML based mathematics in HTML webpages. To get up and running you need to include the MathJax script in the header of your github pages page, and then write some maths. For LaTex, there are two delimiters you need to know about, one for block or displayed mathematics `\[ ... \]`, and the other for inline mathematics `\( ... \)`.

## Usage

To enable MathJax support be sure Kramdown is your Markdown flavor of choice and MathJax is set to true in your `_config.yml` file.

~~~
markdown: kramdown
mathjax: true
~~~

~~~
Here is an example MathJax inline rendering \\( 1/x^{2} \\), and here is a block rendering: 
\\[ \frac{1}{n^{2}} \\]
~~~

Here is an example MathJax inline rendering \\( 1/x^{2} \\), and here is a block rendering: 
\\[ \frac{1}{n^{2}} \\]

The only thing to look out for is the escaping of the backslash when using markdown, so the delimiters become `\\[ ... \\]` and `\\( ... \\)` for inline and block maths respectively.
    

$$
\begin{align*}
  & \phi(x,y) = \phi \left(\sum_{i=1}^n x_ie_i, \sum_{j=1}^n y_je_j \right)
  = \sum_{i=1}^n \sum_{j=1}^n x_i y_j \phi(e_i, e_j) = \\
  & (x_1, \ldots, x_n) \left( \begin{array}{ccc}
      \phi(e_1, e_1) & \cdots & \phi(e_1, e_n) \\
      \vdots & \ddots & \vdots \\
      \phi(e_n, e_1) & \cdots & \phi(e_n, e_n)
    \end{array} \right)
  \left( \begin{array}{c}
      y_1 \\
      \vdots \\
      y_n
    \end{array} \right)
\end{align*}
$$
