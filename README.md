# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Features of this app required in assignment:

1. Create a post.
2. Rate the post
3. Get the top N posts
4. Get a list of IPs
5. Add feedback.

--> <h4>Additional features I have coded:</h4>
* <b> Redis implementation for Storing token and validation while acessing protected routes.</b>
* <b> JWT token based Authentication.</b>
* <b> User Login & logout </b>
* <b> Use of serviced objects (uses of service for better code structure)</b>
* <b> Validation of email & mobile with their respective regex</b>

<h3> All Features and associated apis are working fine!!</h3>


##Steps to deploy this User Social Post based Application

1. Git clone this repository in your local repository
2. Install Ruby version - 2.6.8 & Rails version - 6.0.2
3. 'bundle install' to install all dependencies
4. Create a postgres database 'posts'
5. 'rails db:migrate' to run all the migration and create a database.
6. It's time to run server 'rails s'
7. Now you can check all APIs working through endpoints.


##API Endpoints for Student CRUD & AUthentication(Login & Logout)


* POST - http://localhost:3000/api/v1/authentication - User Login API


* POST - http://localhost:3000/api/v1/posts - Create post & user API


* POST - http://localhost:3000/api/v1/ratings - User Create rating on posts API


* GET - http://localhost:3000/api/v1/posts - Get top N posts API


* GET - http://localhost:3000/api/v1/posts/list_internet_protocols - Listing all IPs and it's users API


* POST - http://localhost:3000/api/v1/feedbacks - Add Feedback API





*All Apis are functioning and error free
