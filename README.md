[![CircleCI](https://circleci.com/gh/chibuezeayogu/File-Transfer-App.svg?style=svg)](https://circleci.com/gh/chibuezeayogu/File-Transfer-App) [![Maintainability](https://api.codeclimate.com/v1/badges/47aefe082e844f78fadc/maintainability)](https://codeclimate.com/github/chibuezeayogu/File-Transfer-App/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/47aefe082e844f78fadc/test_coverage)](https://codeclimate.com/github/chibuezeayogu/File-Transfer-App/test_coverage)


# File-Transfer-App
 File-Transfer-Application is an application that allows user transfer files back and forth from a remote web server. Users get to see their download progress with the help of a progress bar.
* `Note`: A User must be registered and authenticated before he/she can upload or download file(s).

# Framwork Used
* `Rails`: Rails is a web-application framework that includes everything needed to create database-backed web applications according to the Model-View-Controller (MVC) pattern.

## Gem used to handle file upload
* `Active Storage`: Active Storage facilitates uploading files to a cloud storage service like Amazon S3, Google Cloud Storage, or Microsoft Azure Storage and attaching those files to Active Record objects. It comes with a local disk-based service for development and testing and supports mirroring files to subordinate services for backups and migrations.

# External Dependencies
This web application is written with Ruby using the Ruby on Rails framework and a PostgreSQL database. You need Ruby version 2.4.1 for the application to work
* To install rvm , visit [RVM](https://rvm.io/rvm/install)
* To install this ruby version, you can run the command below but you can use other channels to install it as well e.g. rbenv. 
* To install PostgreSQL, run 
```bash
brew install postgres
```
# Installation
Please make sure you have **Ruby(v 2.4.1) and PostgreSQL** installed. Take the following steps to setup the application on your local machine:

1. Run `git clone https://github.com/chibuezeayogu/File-Transfer-App.git` to clone this repository

2. Run the command `cd File-Transfer-App` to checkout into `File-Transfer-App`.

2. Run `bundle install` to install all required gems

*Note* Update the postgres username and password if you have one

# Configuring the database
* To create application database, run:
    ```bash
    rails db:create
    ```
* Next run the code below to migrate database schemas

    ```bash
    rails db:schema:load
    ```
# Tests
* Run test with `rspec`

# Limitations
* File-Transfer-App is still in development.