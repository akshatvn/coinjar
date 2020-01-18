# README

## Prerequisites
* ruby 2.4.1
* rails 5.2.4
* mysql 5.7

## Setting up the app on your computer
* `git clone https://github.com/akshatvn/coinjar.git`
* cd into the project directory
* run `bundle install`
* alter config/database.yml as per your mysql credentials
* run `rake db:create`
* run `rake db:migrate`
* run `rake db:seed`

## Running the server
* rails s -p3000
* go to localhost:3000 on your browser

## Running the test suite
* rails test

