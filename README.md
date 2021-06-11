# URL-Shortener README

URL-shortener is a Rails web app that generates shortened urls and tracks usage of the links. It uses the Devise gem for authentication.

## Run Locally

To run this application locally, you'll need Ruby 2.6.6 and Rails 6.1.3 versions or later.

```bash
# Clone this repository
git clone git@github.com:ersie93/url-shortener.git
cd url-shortener

#Install dependencies
bundle && yarn

#Setup database
rails db:Setup

#Serve
rails s

```