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

--------------------SEE LIST OF ALL RAKE TASKS---------------------
rake db -T -A

--------------------REGEX EMAIL VALIDATION-------------------------
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

--------------------UPDATE ATTRIBUTES METHOD------------------------
user.update_attributes(name: "The Dude", email: "dude@abides.org")

>> user.update_attribute(:name, "The Dude")

-------------------RAILS ROUTES--------------------------
When you use product_url , you’ll get the full enchilada with protocol and domain name,
like http://example.com/products/1 . That’s the thing to use when you’re doing
redirect_to , because the HTTP spec requires a fully qualified URL when doing
302 Redirect and friends. You also need the full URL if you’re redirecting from
one domain to another, like product_url(domain: "example2.com", product: product).
The rest of the time, you can happily use product_path . This will generate only
the /products/1 part, and that’s all you need when doing links or pointing forms,
like link_to "My lovely product", product_path(product) . The confusing part is
that oftentimes the two are interchangeable because of lenient browsers. You can
do a redirect_to with a product_path and it’ll probably work, but it won’t be valid
according to spec. And you can link_to a product_url , but then you’re littering
up your HTML with needless characters, which is a bad idea too. -DHH

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

-------------------Active Record-------------------------
The model for the table that contains the foreign key always has the belongs_to
declaration.

Ex:
class Invoice
  belongs_to :order
end

class Order
  has_one :invoice
end

-------------------PUSH LOCAL DB TO HEROKU--------------------
heroku pg:push localdb_development DATABASE_URL

-----------------RESOURCE or RESOURCES---------------------
If the object your talking about doesn't happen to have an id, you're talking
about a singleton resource.

----------------difference between new action and create action-------------
“the new action creates an Order object in memory simply to give the template
code something to work with. Once the response is sent to the browser, that
particular object gets abandoned, and it’ll eventually be reaped by Ruby’s
garbage collector. It never gets close to the database.

The create action also creates an Order object, populating it from the form fields.
This object does get saved in the database. So, model objects perform two roles:
they map data into and out of the database, but they’re also regular objects that
hold business data. They affect the database only when you tell them to, typically
by calling save.”

```
