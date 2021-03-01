# Welcome to Evan's wonderful URL shortener API! 

URL shortener does exactly what is says. It will take in a URL of your deisgnation, of any length (but probably something fairly long, I'd imagine, or else why would you use a shortener?), and either creates a custom short url, or applies a short url that you your specify.

### This application uses:
RVM for ruby version management and uses ruby version 2.7.2
If you don't have RVM your first step would be to install RVM. Docs for installing RVM can be found at https://rvm.io/
once RVM is installed run:
`rvm install "ruby-2.7.2"`

### Instructions
Clone down the application with `git@github.com:thebkbuffalo/url_shortener.git` or however else you clone down a repo.

If you have RVM installed and are using other versions of ruby run:
cd into your newly cloned down `url_shortener` folder and run:
`rvm use ruby-2.7.2`

run `bundle install` to install all necessary gems

run `rake db:create` to create your Postgresql DB

run `rails s` to kick up your server.

Congratulations!! 
you have started up your url_shortener app!



### How to use this API

