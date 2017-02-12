```ruby
------------------------UNDO STUFF------------------------
$ rails generate controller StaticPages home help

$ rails destroy  controller StaticPages home help

$ rails generate model User name:string email:string

This can be undone using
$ rails destroy model User

Another technique related to models involves undoing migrations, migrations change the state of the database using the command:
  $ bundle exec rake db:migrate

We can undo a single migration step using
  $ bundle exec rake db:rollback

To go all the way back to the beginning, we can use
  $ bundle exec rake db:migrate VERSION=0

As you might guess, substituting any other number for 0 migrates to that version number, where the version numbers come from listing the migrations sequentially.

--------------------RSPEC---------------------
rails new App --skip-tests

--------------------SEE LIST OF ALL RAKE TASKS---------------------
rake db -T -A

--------------------REGEX EMAIL VALIDATION-------------------------
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

--------------------UPDATE ATTRIBUTES METHOD------------------------
user.update_attributes(name: "The Dude", email: "dude@abides.org")

>> user.update_attribute(:name, "The Dude")

-------------------RAILS ROUTES--------------------------
root_path -> '/'
root_url  -> 'http://www.example.com/'

help_path -> '/help'
help_url  -> 'http://www.example.com/help'

verb "url" => "name_of_controller#name_of_action"

-------------------FORM_FOR METHOD-----------------------
make sure get/delete/create/ matches the path

-------------------SUPPORTED DATABASE COLUMN TYPES------------------
string

text

integer

decimal

float

boolean

binary

date

time

datetime

primary_key

timestamp

-------------------PUSH LOCAL DB TO HEROKU--------------------
heroku pg:push localdb_development DATABASE_URL

------------------START RAILS APP WITH PG DB------------------
rails new appname -d postgresql

-----------------RESOURCE or RESOURCES---------------------
If the object your talking about doesn't happen to have an id, you're talking
about a singleton resource.

-----------------attr_accessible----------------------
Replaced by strong params in Rails 4, so be mindful of which rails version your
app is on.
```
