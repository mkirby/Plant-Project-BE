# PLANT APP README

## Current Setup Instructions

- Clone Repo
- `bundle install`
- `bundle exec figaro install`
- Add required ENV variables (see below)
- Run `rails db:seed'
- Start the backend server with 'rails s'

Figuro stores ENV variables in config/application.yml. Two ENV variables are required for the app to work. 
- jwt_secret_key: "SECRET"
- trefle_api_key: "KEY"
