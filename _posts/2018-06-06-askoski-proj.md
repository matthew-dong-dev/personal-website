---
layout: post
title:  "AskOski"
date:   2018-06-06
range: "August 2018 - Present" 
excerpt: "UC Berkeley course recommendation system.  Explore personalized course information based on historic enrollments.  [Check it out.](https://askoski.berkeley.edu)"
project: true
reading_time: false
feature: assets/img/featured_images/askoski.png
---

# [Checkout AskOski](https://askoski.berkeley.edu/){: .btn} 

## Background

- Web infrastructure in most schools has remained static in a rapidly evolving society. In particular, variety in course enrollment platforms remains lacking in higher education. To provide greater personalized course guidance to individual students, AskOski leverages machine learning models lifted from other domains to the education field in building a recommender system.  We utilize collaborative filtering & representation learning through past student enrollment sequences to suggest courses to users based on similar student profiles. [Brochure]({{site.url}}/assets/files/askoski_brochure.pdf)

- The pilot version of the system is available to the entire undergraduate & graduate student population at UC Berkeley, and active collaboration is in place to deploy the system to other college campuses including Laney College and UC Irvine.  


### My Involvement - Machine Learning & Web Development

- (Currently under development) My role includes incorporating an "intelligent search" function to improve content discovery and the browsing experience, which allows students to query general subjects or specific concepts before returning the most relevant course matches.  <!-- [Proposal summary]({{site.url}}/assets/files/askoski_search_proposal.pdf) -->
- What makes this search “intelligent” is that a query will not only be matched against course titles and descriptions, but also to an inferred keywords dictionary for each class.  These keywords are produced from a learned embedding of courses mapped to a bag of words space produced using the collective descriptions.  We will test our feature to see if we gain a semantic portrayal of courses capturing details beyond surface level course descriptions & titles.

- **[Code](https://github.com/CAHLR/search-keywords/) & Tools Used:** Angular Framework, IPython, Travis CI
