> http://matthewydong.com

> Run `bundle exec jekyll serve --config _config.yml,_config-dev.yml` for dev environment

## To do: 
	
### Content

1. link research code (github repo) & change BTN report to reference code code
1. link other BTNs within each post (add as related posts YAML header)
1. add hyperlinks in *why education* & embed videos (look through md syntax post)
1. change email to redirect from generic one

### Build tasks: 

1. check DNS changes propogated: "Your DNS changes can take over a full day to update and the wait varies among DNS providers." 
	- `dig +noall +answer matthewydong.com`
1. enable google analytics
	- How to use analytics code? http://jmcglone.com/guides/github-pages/ Try creating an _include file that inserts Google Analytics tracking code into your <head> so you can get stats on the visitors to your website. Here's an example._
	- https://taylantatli.github.io/Moon/moon-theme/
1. Configuring Travis CI on your repo is a great way to track failing builds as well - https://stackoverflow.com/questions/24851824/how-long-does-it-take-for-github-page-to-show-changes-after-changing-index-html
	- automate basic regression test - make sure all links work
1. regex for all png and jpg files?  `\.(png|jpg)`
1. look into dev settings: https://jekyllrb.com/docs/usage/ 
1. add tags to posts & add option to search by tags (see template version)

### Completed Content Tasks

1. [x] change prof picture, add dates to experience
1. [x] update website to be in parity with resume, change section titles to match
1. [x] add link to paper: list short paper & poster, then full paper - see Zach’s website as a model, add askoski brochure to website 
1. [x] Move “performed general system testing and debugging” to Sabre Internship
1. [x] remove “credit” from website template, remove "Presented work on learning analytics applications at a university research conference”, Replace exploring outdoors with traveling,  I'm a huge fan of Calvin and Hobbes, would like to own a Bernese Mountain Dog and box in my free time.
1. [x] less is more, pare down the excess words in everything e.g. in your about me section + askoski description is too long, remove rose hills scholarship portion
1. [x] replace cal boxing picture & Change productivity blog to biometric  
1. [x] update aboutMe to be in parity with resume
	- change CAHL description to be AI in education
	- Update website to say “recommended reading”
	- link to projects section
	- move cal hacks response to BTNs description 
1. [x] include safeFront project

### Completed Build Tasks

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


### Deprecated 

1. [ ] include Laney course search in askoski file 
	- built a course catalog for Laney college which is a proof of concept that this is scalable and improves their class bc previously was a pdf (scale education infrastructure)
1. [ ] add temporary placeholder project for HA website + include temporary practical applications file
1. [ ] add linkedIn profile + add devpost configuration to home page shortcuts 
1. [ ] add emojis to post titles 

--- 

### Useful commands & resources 

- https://dev.to/trentyang/how-to-setup-google-domain-for-github-pages-1p58
- 

Jekyll:
- `bundle exec jekyll serve` for local version 
	- vs `jekyll serve --livereload`? 
	- Note that _config.yml changes are loaded at compile time, not runtime. This means that if you’re running jekyll serve locally and you edit _config.yml, then changes to it won’t be detected. You’ll need to kill and rerun jekyll serve.
- pushing changes will automatically update live website (takes a few seconds)
- `jekyll build` ? 
	jekyll build will wipe everything in /_sites/. The first step of jekyll build is to delete everything in /_sites/ and then build it all again from scratch. So, you can’t store any files in there and expect them to stick around. Everything that goes into /_sites/ should be generated by Jekyll_

Git:

- `git remote set-url origin git://new.url.here`
- `git pull origin branchname --allow-unrelated-histories`
- `git reset` only changes local repo, cannot push changes if you reset to a specific commit, need to use `git revert` (https://stackoverflow.com/a/22683231/6521206)



