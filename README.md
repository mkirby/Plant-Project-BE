# PLANT APP README

### Front End: [Repo](https://github.com/mkirby/Plant-Project-FE)
### Back End: [Repo](https://github.com/mkirby/Plant-Project-BE)

## Current Setup Instructions

- Clone Repo
- `bundle install`
- `bundle exec figaro install`
- Add required ENV variables (see below)
- Run `rails db:seed'
- Start the backend server with 'rails s'

Figuro stores ENV variables in config/application.yml. Two ENV variables are required for the app to work. 
- jwt_key: "SECRET"
- trefle_api_key: "KEY"

## Acknowledgements
- [Trefle.io](trefle.io/) - A global plants API
- [Figaro](https://github.com/laserlemon/figaro) - Securely configure Rails applications
- Flatiron School
- Our Instructors: Tashawn Williams, Chase Rabenn, & Annie Zheng
- Our 091420 Software Engineering Immersive Peers

A Brian Feldman and Matthew Kirby app