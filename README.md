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

1. Add student
2. Update students
3. Get All students
4. Delete Student
5. Get Student By Id.
6. Sort students

--> <h4>Additional features I have coded:</h4>
* <b> Redis implementation for Storing token and validation while acessing protected routes.</b>
* <b> JWT token based Authentication.</b>
* <b> Student Login & logout </b>
* <b> Use of serviced objects (uses of service for better code structure)</b>
* <b> Validation of email & mobile with their respective regex</b>

<h3> All Features and associated apis are working fine!!</h3>


##Steps to deploy this Student Registration Application

1. Git clone this repository in your local repository
2. Install Ruby version - 2.5.6 & Rails version - 6.0.3
3. 'bundle install' to install all dependencies
4. Create a postgres database 'Student'
5. 'rails db:migrate' to run all the migration and create a database.
6. It's time to run server 'rails s'
7. Now you can check all APIs working through endpoints mentioned below.


##API Endpoints for Student CRUD & AUthentication(Login & Logout)

* POST -  http://localhost:3000/api/v1/students - Student Create API - Mobile & email are unique and indexed
No Auth Token required

Request body:
{
    "name": "Abhishek",
    "email": "abhishek@gmail.com",
    "password": "12345678",
    "mobile": "9987654893",
    "school_name": "ABC public school",
    "standard": 9,
    "address": "mcksjdnsakdjnk",
    "roll_no": 2
}

Response body:
{
    "status": "SUCCESS",
    "message": "Student registered Successfully with name Abhishek",
    "data": {
        "id": "29614a1d-7711-45cb-964b-8d87239761ba",
        "name": "Abhishek",
        "email": "abhishek@gmail.com",
        "password_digest": "$2a$12$lwVFSrc5a9H7GFxQdbano.H58cTYjUF32.3tEKBwmx9QMSx/vqYZW",
        "mobile": "9987654893",
        "school_name": "ABC public school",
        "standard": 9,
        "address": "mcksjdnsakdjnk",
        "roll_no": 2,
        "created_at": "2021-05-09T05:31:24.153Z",
        "updated_at": "2021-05-09T05:31:24.153Z"
    }
}

* POST - http://localhost:3000/api/v1/authentication - Student Login API
No Auth Token required

Request Body:

{
    "email": "aaditya@gmail.com",
    "password": "12345678"
}

Response Body:
{
    "student": {
        "id": "db43c542-873f-45e9-a329-27a906aa9fad",
        "name": "Aaditya",
        "email": "aaditya@gmail.com",
        "password_digest": "$2a$12$xPPzQxsxHvoP5Pb0h9IEEeO91HHFMNBT/yhUHUZxUrrsnwVKDBW5y",
        "mobile": "9987654891",
        "school_name": "ABC public school",
        "standard": 9,
        "address": "mcksjdnsakdjnk",
        "roll_no": 2,
        "created_at": "2021-05-08T18:13:07.734Z",
        "updated_at": "2021-05-08T18:13:07.734Z"
    },
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJzdHVkZW50X2lkIjoiZGI0M2M1NDItODczZi00NWU5LWEzMjktMjdhOTA2YWE5ZmFkIiwiY3JlYXRlZF9hdCI6MTYyMDUzNjU1MH0.lXQIeqkeA4ml-jOEHxOCDKg0MZ7bpXVwI50awS54MBY"
}

* DELETE - http://localhost:3000/api/v1/authentication/student_id/logout
Auth Token required

Request Body:
Empty

Response Body:
{
    "message": "Student is Logged out successfully"
}

* GET - http://localhost:3000/api/v1/students - All Students List API
No Auth Token required

Request Body:
Empty

Response body:
{
    "status": "SUCCESS",
    "message": "Students list",
    "total_students": 3,
    "data": [
        {
            "id": "29614a1d-7711-45cb-964b-8d87239761ba",
            "name": "Abhishek",
            "email": "abhishek@gmail.com",
            "password_digest": "$2a$12$lwVFSrc5a9H7GFxQdbano.H58cTYjUF32.3tEKBwmx9QMSx/vqYZW",
            "mobile": "9987654893",
            "school_name": "ABC public school",
            "standard": 9,
            "address": "mcksjdnsakdjnk",
            "roll_no": 2,
            "created_at": "2021-05-09T05:31:24.153Z",
            "updated_at": "2021-05-09T05:31:24.153Z"
        },
        {
            "id": "db43c542-873f-45e9-a329-27a906aa9fad",
            "name": "Aaditya",
            "email": "aaditya@gmail.com",
            "password_digest": "$2a$12$xPPzQxsxHvoP5Pb0h9IEEeO91HHFMNBT/yhUHUZxUrrsnwVKDBW5y",
            "mobile": "9987654891",
            "school_name": "ABC public school",
            "standard": 9,
            "address": "mcksjdnsakdjnk",
            "roll_no": 2,
            "created_at": "2021-05-08T18:13:07.734Z",
            "updated_at": "2021-05-08T18:13:07.734Z"
        },
        {
            "id": "58fc860c-d4fe-451d-ab6f-f998ecd0eb9c",
            "name": "Rakesh",
            "email": "rajeev@gmail.com",
            "password_digest": "$2a$12$vKrJpKZx.1CRC2wMJJOX4ukzICDBkzqlHZDG7GmH6eKyQJMEBLMZm",
            "mobile": "9987654892",
            "school_name": "ABC public school",
            "standard": 9,
            "address": "mcksjdnsakdjnk",
            "roll_no": 2,
            "created_at": "2021-05-08T18:11:23.842Z",
            "updated_at": "2021-05-08T18:11:23.842Z"
        }
    ]
}

* GET - http://localhost:3000/api/v1/students/student_id - GET Sudent By Id API
Auth Token Required

Request Body:
Empty

Response Body:
{
    "status": "SUCCESS",
    "message": "Student listed with name Rakesh",
    "data": {
        "id": "58fc860c-d4fe-451d-ab6f-f998ecd0eb9c",
        "name": "Rakesh",
        "email": "rajeev@gmail.com",
        "password_digest": "$2a$12$vKrJpKZx.1CRC2wMJJOX4ukzICDBkzqlHZDG7GmH6eKyQJMEBLMZm",
        "mobile": "9987654892",
        "school_name": "ABC public school",
        "standard": 9,
        "address": "mcksjdnsakdjnk",
        "roll_no": 2,
        "created_at": "2021-05-08T18:11:23.842Z",
        "updated_at": "2021-05-08T18:11:23.842Z"
    }
}

* PUT - http://localhost:3000/api/v1/students/student_id - Update student API
Auth Token Required

Request Body:
{
    "name": "Abhishek Pandey"
}

Response Body:
{
    "status": "SUCCESS",
    "message": "Student updated Successfully with name Abhishek Pandey",
    "data": {
        "id": "b2a686e9-476e-4c45-9092-e9a701c29edb",
        "name": "Abhishek Pandey",
        "password_digest": "$2a$12$igrqcABx3h1hpvlkCEqRtuQcysZZ3GqvmeBw.CaNgXevlpgmTd976",
        "email": "abhishek@gmail.com",
        "mobile": "9987654893",
        "school_name": "ABC public school",
        "standard": 9,
        "address": "mcksjdnsakdjnk",
        "roll_no": 2,
        "created_at": "2021-05-08T19:24:56.618Z",
        "updated_at": "2021-05-08T19:27:57.846Z"
    }
}

* DELETE - http://localhost:3000/api/v1/students/student_id - Delete student API
Auth Token Required

Request Body:
Empty

Response Body:
{
    "status": "SUCCESS",
    "message": "Student deleted Successfully with name Abhishek Pandey"
}

*All Apis are functioning and error free
