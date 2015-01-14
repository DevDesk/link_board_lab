#Link Board Lab

We are going to create a clone of [hacker news](https://news.ycombinator.com/). Hacker news is a reddit-style link board that allows users to post links which are upvoted by other users so the best links rise to the top.

For today we're going focus on `Users` and `Posts` only. The goal for tonight is to create an app that allows users to sign up, login, and add posts (no comments or voting yet).


##Models

####User
* email
* password_digest
* name

####Post
* title
* link
* user_id


##Routes


###Auth

| Verb | Route | Action | Purpose |
|------|-------|------------|--------|---|
| GET | /signup | users#new | render user sign up form | 
| POST | /signup | users#create | create user in database (signup) | 
| GET | /login | sessions#new | render user log in form |
| POST | /login | sessions#create | create user session (login) |
| GET / DELETE | /logout | sessions#destroy | destroy user session (logout) |


###Post
Create full CRUD routes.

##Validations

* post.title
    * required
    * should be between 10 and 100 chars
* post.link
    * required
    * should be a valid url
* user.email
    * required
    * valid email
    * unique
* user.name
    * required
    * less than 20 chars



##Getting started

* Fork / clone
* cd to cloned repo
* create new rails app `rails new ./ -T`
* test `rails s` go to localhost:3000 in browser
* Create `User` model (with `has_secure_password`)
rails g model user email password_digest

* enable bcrypt gem in Gemfile
* migrate `rake db:migrate`
* test `rails c` User.create... etc...

* Create authentication routes / views / actions
* Create `Post` model
* migrate `rake db:migrate`
* test `rails c` Post.create... etc...
* Create crud routes / views / actions for `Post`
* Add validations

