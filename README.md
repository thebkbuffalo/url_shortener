# URL Shortener API
URL Shortener does exactly what is says. It will take in a URL of your deisgnation, of any length (but probably something fairly long, I'd imagine, or else why would you use a shortener?), and either creates a custom short url, or applies a short url that you specify.

**A short note on the building of this app**

I kept this app pretty slim. The ultimate point is to make a shortened URL that redirects to it's specified destination. Accomplishing this didn't really require too many third party tools, hence why I kept it slim. My general rule of thumb is if you don't need to rely on dependencies or third party libraries, than best not to.

### This application uses:
RVM for ruby version management and uses ruby version 2.7.2
If you don't have RVM your first step would be to install RVM. Docs for installing RVM can be found at https://rvm.io/
once RVM is installed run:
`rvm install "ruby-2.7.2"`

Rails version for this app is 6.1.3

DATABASE:
This app uses Postgresql for it's Database. If you don't have you can install via Homebrew for Mac and via apt-get for linux. Check https://www.postgresql.org/ for more details.

Bundler gem for installing necessary gems. If you don't have bundler run `gem install bundler` to get bundler.

## Instructions
Clone down the application with `git clone git@github.com:thebkbuffalo/url_shortener.git` or however else you clone down a repo.

If you have RVM installed and are using other versions of ruby:

cd into your newly cloned down `url_shortener` folder and run:

`rvm use ruby-2.7.2`

run `bundle install` to install all necessary gems

run `rake db:create` to create your Postgresql DB

run `rake db:seed` to add some test data, if you would like and are a fan of LOTR.

run `rails s` to kick up your server.

Congratulations!! 
you have started up your url_shortener app!

## How to use this API

Considering this app is an API, I would use Postman (downloaded so you can test with localhost, https://www.postman.com/) or something similar used for testing API endpoints.

### Available API urls
-- be sure to prepend `localhost:3000` or wherever this ends up getting deployed

--USERS--
- GET `/api/v1/users.json` -- Users index endpoint (also includes links associated with each user)
- GET `/api/v1/users/:id.json` -- Users show endpoint (also includes associated links)
- POST `/api/v1/users?name=<your_name>&email=<your_email>` -- Users create endpoint. needs name and email as params

--LINKS--
- GET `/api/v1/links.json` -- Links index endpoint
- GET JSON `/api/v1/links/:id.json` -- Links show endpoint (returns a JSON object of the link)
- GET HTML `/:slug` -- this redirects to the url you assigned to your link. IE `localhost:3000/google` will go to google.com.
- POST `/api/v1/links?user_id=<user_id>&url=<your_url>&slug=<your_optional_slug>` -- Create link endpoint
- DELETE `/api/v1/links/:id.json` -- Delete link endpoint

**To use this application:** 
- create a user with the `/api/v1/users` POST endpoint. Params are name and email. IE: `{name: <your name>, email: <your email>}`
- create a link with `/api/v1/links` POST endoing. Params are user_id, url, and slug. user_id and url and required. Slug is optional. IE:
  - with slug: `{user_id: <user_id>, url: '<any url>, slug: <your_slug>}`
  - without slug: `{user_id: <user_id>, url: <any url>}` - with this method, a slug with be automatically generated.
- visit `localhost:3000/:<your_slug>` to get redirected to the URL you used when creating your link.

## TESTING
To run the test suite simply drop the follwing into your terminal:

`rspec --format=d` -- this will give a more verbose output. if you're not interested in a more verbose output just run `rspec`

