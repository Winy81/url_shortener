# README

Simple link shortener app

Language: Ruby with RoR
Database: SQlite3
Layout: Bootstrap
Tests: RSpec - Capybara

Usage:

- Clone the repo
- Open a terminal
- Navigate into the app folder
- Run: rails db:create
- Run: rails db:migrate
- Open a browser and navigate for http://localhost:3000
- Thats it.

If you deploy:

- For heroku the database have to be changed for PostgreSQL
- In the shortened_urls_controller, in the "shortened" method the "host" varibale has to be changed for your deplyed app's root link" The tests will be effected in the case" 



