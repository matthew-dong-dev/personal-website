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

<center> <h1> See here: <a href='https://askoski.berkeley.edu/'>  AskOski </a> </h1> </center>

## Background

- Web infrastructure in most schools have remained static in a rapidly evolving society; in particular, variety in course enrollment platforms remains lacking in higher education. To provide greater personalized course guidance to individual students, AskOski leverages machine learning models lifted from other domains to the education field to build a recommender system that suggests courses to users based on similar student profiles. [Brochure]({{site.url}}/assets/files/askoski_brochure.pdf)

- (In development) My role included incorporating an intelligent search function in addition to the main features of the site, allowing students to query general subjects or specific concepts before returning the most relevant matches.  <!-- [Proposal summary]({{site.url}}/assets/files/askoski_search_proposal.pdf) -->

- Plans to be deployed elsewhere

### Machine Learning

- What makes this search “intelligent” is that a query will not only be matched against course titles and descriptions, but also to a keyword dictionary produced from an embedded space of courses learned through past enrollment sequences, and we will test our feature to see if we gain a semantic portrayal of courses capturing details beyond surface level course descriptions.
- [Code](https://github.com/CAHLR/search-keywords/) & Tools Used: 

### Web Development

- asdf
- Tools Used: Angular Framework, Travis CI
