require 'html-proofer'

# rake test
desc "build and test website"

task :test do
  sh "bundle exec jekyll build"
  sh "bundle exec htmlproofer ./_site"
  # options = { swap_urls: "^/BASEURL/:/" }
  # HTMLProofer.check_directory("./_site", options).run
end
