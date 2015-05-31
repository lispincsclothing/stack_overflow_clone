1. rails new -h
2. rails new stack_overflow_clone -T -d=postgresql
3. rails g rspec:install
4. rails g model Question title:string content:text
5. rails g model Answer title:string content:text question:references
6. bin/rails g controller answers && bin/rails g controller questions
7. rake routes
8. rails g migration AddVoteCountToAnswers vote_count:integer
9. rails g migration AddVoteCountToAnswers vote_count:integer
10. Installing & using bower/bower-install/typeahead.js
    1. .bowerrc
        1. {
            "directory": "vendor/assets/components"
            }
    2. npm install -g bower (http://dotwell.io/taking-advantage-of-bower-in-your-rails-4-app/)
        1. bower install --save normalizecss jquery jquery-ujs bootstrap typeahead.js
    3. bower init 
        1. Ignore step 4 (config.assets.paths << Rails.root.join('vendor', 'assets', 'components'), rather use http://westonplatter.com/blog/2013/how-to-setup-bower-within-rails/
            1.   "install": {
                    "path": {
                      "css": "vendor/assets/stylesheets",
                      "less": "vendor/assets/stylesheets",
                      "js": "vendor/assets/javascripts",
                      "eot": "vendor/assets/fonts",
                      "svg": "vendor/assets/fonts",
                      "ttf": "vendor/assets/fonts",
                      "woff": "vendor/assets/fonts",
                      "woff2": "vendor/assets/fonts"
                    }
                  }
    3. npm install --save-dev bower-installer (https://scotch.io/tutorials/only-grab-the-files-you-need-while-using-bower)
        1. bower-installer
