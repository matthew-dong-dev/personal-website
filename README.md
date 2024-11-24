<p>
    <h2><a href="https://matthewydong.com ">Personal Website</a> · <img src="https://travis-ci.org/mdong127/mdong127.github.io.svg?branch=master" alt="Build Status" style="max-width:100%;"></a></h2>
</p>


## Build & deployment

`docker build -t personal-website:1.0.0 .`

`docker run -p 4000:4000 personal-website:1.0.0`

## Local development

Run `bundle exec jekyll serve --config _config.yml,_config-dev.yml` for dev environment

Notes: 

- when updating dependencies, may need to delete gemfile.lock before rerunning `bundle install`
- Sometimes you need to clear the browser cache for changes to propogate.  If you change the config file, you need to rebuild the site.  
- If you want to take down pages, just add [maintenance] in front of the md or pdf file, then Jekyll won't be able to find them and will default to the 404 page.  Or set recruiter to false in `config.yml`
- Rm socials by commenting out `include social-links.html` in `header.html` - commenting them in config.yml leaves a random github icon for some reason
- [Website template](https://github.com/sergiokopplin/indigo)

## To do: 

### Build tasks: 

1. add google analytics to github and medium buttons
1. optimize loading time of profile picture + fix image attributes to be compatible for mobile viewing
1. Configure Travis to do deployment
	- https://medium.com/@mcred/supercharge-github-pages-with-jekyll-and-travis-ci-699bc0bde075
	- https://docs.travis-ci.com/user/deployment/pages/
1. Write tests to be run on build
	- e.g. automate basic regression test - make sure all links work
1. Filter out bots from analytics data: https://medium.com/insights-metrics/spotting-bots-in-google-analytics-2cdd3ae3ed9b 
1. regex for all png and jpg files?  `\.(png|jpg)`
1. look into dev settings: https://jekyllrb.com/docs/usage/ 

### Completed Build Tasks

1. [x] do a dummy code review with commenting on files - difference between submit comments & approve vs just submit comments
1. [x] change majority of MD links to anchor tags that open in new tab
1. [x] configure travis CI for dev branches
1. [x] Configure Travis CI on your repo to track failing builds - https://stackoverflow.com/questions/24851824/how-long-does-it-take-for-github-page-to-show-changes-after-changing-index-html
1. [x] enable google tag manager to track pdf views
	- https://youtu.be/r87A-Ql2czg
	- https://www.skylinetechnologies.com/Blog/Skyline-Blog/January_2017/How_to_track_PDF_downloads_using_Google_Tag_Manage
1. [x] enable google analytics
	- How to use analytics code? http://jmcglone.com/guides/github-pages/ Try creating an _include file that inserts Google Analytics tracking code into your <head> so you can get stats on the visitors to your website. 
1. [x] create url alias at `/resume` to resume file 
1. [x] fix security vulnerability - `bundle update nokogiri`
1. [x] disable browser cache in dev tools
1. [x] check DNS changes propogated: "Your DNS changes can take over a full day to update and the wait varies among DNS providers." 
	- `dig +noall +answer matthewydong.com`
1. [x] enable https - SSL certificate
1. [x] transfer other posts; how to add drafts? 
	- Drafts are posts without a date in the filename.  How to exec build with draft? 
1. [x] get rid of "welcome to my website" displaying on every page
1. [x] how to get projects layout to show description
1. [x] create a dev branch for new web template
1. [x] clean unused files & images from assets
1. [x] **Change config url** before pushing / development
	Potential Work-arounds: 
	- https://stackoverflow.com/questions/27386169/change-site-url-to-localhost-during-jekyll-local-development
	- https://jekyllrb.com/docs/variables/
1. [x] sync to custom domain: https://medium.com/@Tnylnc/tnylnc-how-to-set-up-github-pages-with-google-domains-83bd5a4fbc5c
1. [x] customize background (picture or color) & logo (prof pic) & favicon
1. [x] insert markdownify into liquid templating for post list & projects layouts
1. [x] fix permalink issue with extra backslash 
1. [x] insert a basic _by the numbers post_ w/ images, YAML header, etc... 
1. [x] redirect post home button to proper `site.url`
1. [x] choose & change theme & link template to your github pages page 
1. [deprecated] add tags to posts & add option to search by tags (see template version)

--- 

### Useful commands & resources 

- https://dev.to/trentyang/how-to-setup-google-domain-for-github-pages-1p58
- https://medium.com/employbl/launch-a-website-with-a-custom-url-using-github-pages-and-google-domains-3dd8d90cc33b
- https://serverfault.com/a/887218

Jekyll:
- `bundle exec jekyll serve` for local version 
	- vs `jekyll serve --livereload`? 
	- Note that _config.yml changes are loaded at compile time, not runtime. This means that if you’re running jekyll serve locally and you edit _config.yml, then changes to it won’t be detected. You’ll need to kill and rerun jekyll serve.
- pushing changes will automatically update live website (takes a few seconds)
- `jekyll build` ? 
	"jekyll build will wipe everything in /_sites/. The first step of jekyll build is to delete everything in /_sites/ and then build it all again from scratch. So, you can’t store any files in there and expect them to stick around. Everything that goes into /_sites/ should be generated by Jekyll_"

--- 

# FAQ:

- Article: How to Install Jekyll - by [Arti Annaswamy](https://github.com/aannasw). [Part 1](http://artiannaswamy.com/build-a-github-blog-part-1) and [Part 2](http://artiannaswamy.com/build-a-github-blog-part-2)
- [Emojis in the projects list?](https://github.com/sergiokopplin/indigo/issues/72)
- [Nokogiri dependencie problems?](https://github.com/sergiokopplin/indigo/issues/81)
- [Syncing a Fork](https://help.github.com/articles/syncing-a-fork/)
- [Tests with Travis CI - Tutorial](http://www.raywenderlich.com/109418/travis-ci-tutorial)
- [Why Sass?](https://github.com/sergiokopplin/indigo/issues/117)
- [Jekyll Example](https://github.com/barryclark/jekyll-now) - how to clone, run and edit jekyll configs

