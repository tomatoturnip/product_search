# README
Product search example using Semantics3 API. Search for any product and get back a list of product results.

## Installation

Requirements are:
* Ruby 2.4
* Rails 5
* Postgres
* Puma server

External service credentials:
For API credentials, create an account with Semantics3.
Set up API keys in .env file for api key and secret.

Example:
```ruby
#.env
SEMANTICS3_API_KEY=foo_key
SEMANTICS3_SECRET_KEY=foo_secret
```

Bundle dependencies:
```git
$ bundle
```

## Run application
Set up database
```git
rake db:setup
```
Run rails server
```git
rails server
```

### Use product search 
To search for a product,
visit http://localhost:3000/search

### Run unit tests
```git
bundle exec rake
```
