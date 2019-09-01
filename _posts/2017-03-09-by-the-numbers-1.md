---
title:  "By The Numbers 1"
layout: post
date:   2017-08-07
description: "<i>\"You can't control what you can't measure.\"</i> - Me (but not really)"  
author: Matthew Dong
category: blog
star: false
tag: [biometric-data, statistical-analyses]

---

Hello, and welcome to __Semester 1 By The Numbers__!

_Background: I began logging data on my life beginning in secondary school, where I had many issues with productivity & procrastination.  I started to correct this by collecting data on study habits and sleeping patterns and have since expanded to monetary expenditures, calories counting, etc..._ 

The simple act of measuring has helped me maintain accountability, but this is my first attempt to actually look back and analyze my life's data in depth and potentially uncover any interesting insights.  This article is written on my first semester in college. 

--- 

Here's how I recorded the data.  

<figure>
	<img src="/assets/images/1_btn_images/f16_data.png" alt="">
	<figcaption class="caption"> Spreadsheet </figcaption>
</figure>

*Data Dictionary found <a href="#data-dic"> below</a>.*

---

## Question 1: How Efficient Was I? 

Efficiency is the percentage of day I managed to be productive.  

<figure>
	<img src="/assets/images/1_btn_images/efficiency_outliers.jpeg" alt="">
	<figcaption class="caption"> Efficiency Over Time. </figcaption> 
</figure>

My efficiency seemed to hover around 87% which was the mean, but there were several days were I was 0% efficient and an anomalous spike in late September.  Upon closer inspection, the 0 hrs of productivity aligned with holidays & school breaks, which makes sense, but the 126% hyper-efficient day where I worked for >24 hrs remains a mystery (likely I was up late the night before).  

Upon substituting these outliers with the mean, I plotted the data again, and the graph below shows the overall trend.

<figure>
	<img src="/assets/images/1_btn_images/overall_efficiency.jpeg" alt="">
	<figcaption class="caption"> Efficiency Over Time. </figcaption> 
</figure>

So, my efficiency increased as the school year went on, peaked around midterms & finals, and then dropped off during winter break.


### <a name="efficiency"> Further Exploration: </a>

Efficiency was a function of the remaining time I had in a day, so if I took an extra nap, it would still register as me being more efficient, even though I wasn't really productive.  Since `Remaining Time` = 18 hrs - `Total Sleep` - `Total Productive Time`, I decided to check if work or sleep contributed more to greater efficiency.  Here is a scatterplot of `Remaining Time` as a function `Total Productive Time` and `Total Sleep` where the 3rd dimension is color; the smaller and darker the points, the less remaining time there was.  

<figure>
	<img src="/assets/images/1_btn_images/scatterplot.png" alt="">
	<figcaption class="caption"> Efficiency vs Sleep vs Productivity. </figcaption>
</figure>

It appears that productive time contributes more to less remaining time than does sleep because there are more darker points towards that axis, but that's likely because the data wasn't normalized and I just worked more absolute hours than I slept.  In hindsight, I should have created the visualization after converting both `Total Productive Time` and `Total Sleep` into standard units.  

--- 

## Question 2: What was my daily life like? 

Time was broken down into several categories and below is a box plot of the 12 different categories I kept track of, providing basic statistics for each category over the semester.

<figure>
	<img src="/assets/images/1_btn_images/faceted_boxplot.png" alt="">
	<figcaption class="caption"> Descriptive Stats </figcaption>
</figure>

### Observations

* Some of the goals I had for the semester included getting the enough sleep while minimizing naps. Looking at the data I hit **exactly 8 hrs** of `Total Sleep`, while also limiting naps to less than 30 minutes per day.
* I took a 6 hour nap at one point during the semester.
* Math based classes took the most time out of my schedule.
* I consumed a little less than 2000 calories/day.

Here's a look into time spent in each category by day: 

<figure>
	<img src="/assets/images/1_btn_images/linegraph.png" alt="">
	<figcaption class="caption"> By Day </figcaption>
</figure>

--- 

## Question 3: Does Correlation Equal Causation? 

Here is a heat map of correlation coefficients between each feature pair.

<figure>
	<img src="/assets/images/1_btn_images/corr_matrix.jpeg" alt="">
	<figcaption class="caption"> Corr Matrix </figcaption>
</figure>


Aside from obvious observations like `Amount of Actual Sleep` and `Total Sleep` are dependent on each other, the matrix didn't reveal anything too surprising, although I might've missed any non-linear relationships not captured by this metric.  Some observations anyways: 

1. Caloric intake seems to be related to sleep, which could interpreted as eating more means sleeping more, or sleeping more means eating more.  The former makes more sense to me (because of food comas), so that would imply that the more I eat, the less productive I should be due to more naps.  The matrix does show this, as "Total Productive Time" and "Calories" are inversely correlated.

1. Going back to the <a href='#efficiency'> first section</a>, `Remaining Time` is more inversely correlated with `Total Productive Time` than `Total Sleep`, which again reaffirms that claim.  


<br>
<center> <h3> This concludes Semester 1 By The Numbers! </h3> </center>

Thank you for reading!  Code used is [here][f16.md] and feel free to contact me with any comments, questions, and suggestions!

--- 

_Here's a preview of an ongoing analysis spanning multiple years (beginning in secondary school)_:

| 		  | Nighttime Sleep | Nap 	| Total Sleep | Total Productive Hrs  | Efficiency | Personal Endeavors
|:-------|------ :|--------:| --------:| --------:| --------:|  ------:|
| Fall '16   | 7.61  | 0.39   | 8.00  | 1011.75  | 94.37  |  2.10 |
|----
| Spring '16 | 6.35  | 1.39   | 7.74  | 842.25 | 93.11 | 1.75  |
|----
| Fall '15  | 6.32   | 1.20   | 7.52  | 680.33 | 92.85  | 1.24 |
{: rules="groups"}
 

### Preliminary Observations

1. Getting more sleep and spending more time on personal endeavors seem to be directly correlated to an increase in productivity & efficiency, as well as grades (not pictured).
1. These findings should not be surprising, but their underpinnings are often overlooked. Greater personal direction and focus should lead to improved study habits and improved grades, but this is often lost in the rush to [maximize the one's courseload and extracurriculars].
1. If 10000 Hours is what it takes to be an expert in a field, it seems I'm about 6% of the way there.  (Although work done here is more about building fundamentals) 

### Possible Continuations

* Extending time series to include 2014-15 data
* Incorporating online efficiency (via RescueTime)
* Including Monetary Expenditures
* Integrating Habit Checkins (Coach.Me)

--- 

**<a name="data-dic"> Data Dict </a>**

Category Labels

1. College/Scholarships/FinAid - College related logistics
1. Math Immersion - Lecture, Discussion, Homework
1. Data Science - Programming, Learning Analytics Research
1. Core Projects -  Mentoring, Reading/Writing, Education Reform Research
1. Personal Endeavors - Routines (Morning/Night), Gym, Mindfulness
1. Total Productive Time - Sum of (1:5)
1. Bed Time
1. Wake Up
1. Amount of Actual Sleep: (8) - (7)
1. Nap Length
1. Total Sleep = (9) + (10)
1. Remaining Time:  18 hrs - (Total Sleep) - (Total Productive Time)
	- Each day fixed 3 Hrs for Socializing/Commuting + 3 Hrs for Meals/General Entropy
1. Efficiency - (24-RT)/24*100
1. Calories

[f16.md]: https://github.com/mdong127/F16_Analysis
<!-- [maximize the one's courseload and extracurriculars]: https://github.com/mdong127/F16_Analysis -->


