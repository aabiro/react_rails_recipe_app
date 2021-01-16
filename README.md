# Recipe Finder Application

A checklist of ingredients to render recipes that are associated with all selected ingredients.

## Requirements:

- yarn
- bundler
- postgres
- ruby '2.7.2'

## Steps to get started:

- Clone this repository
- Install ruby dependencies `bundle install`
- Install JS dependencies `yarn`
- Specify your DB credentials in `.env` if necessary for your postgres setup
- Create and seed the DB with `bundle exec rails db:setup`
- Run rails server `bundle exec rails s`
- Navigate to `http://localhost:3000/` to see the application.

## Tests:

- Run ruby test suite with `bundle exec rspec ./spec -f d`
