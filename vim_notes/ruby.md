```ruby
bundle check --path=./vendor

-----------------------.EACH and .MAP--------------------------
use .each for iteration and .map for transformation.

---------------------- ||= OPERATOR ---------------------
@foo = @foo || "bar"    ->     @foo ||= "bar"

------------------------NGROK-------------------------
ngrok http 3000

----------------------CURL-----------------------
curl localhost:3000/index
curl -H "Authorization: bearer asdf" -X PUT -i(shows headers) -d(data, how you pass params) "id=1" localhost:3000/update

----------------------HTTPIE---------------------
-p       What to output: H and B for request headers and body, h and b for response headers and body

-a       Authenticate with this username:password combination

--help   View command options and documentation

---------------------GETTERS and SETTERS---------------------
attr_reader :description will define
def description
  @description
end

attr_writer :description gives you
def description=(new_description)
  @description = new_description
end

attr_accessor :description is equivalent to attr_reader :description; attr_writer :description

attr
attr_writer - setter
attr_reader - getter
```

LS
module - class
If it's an "is-a" relationship, choose class inheritance. If it's a "has-a"
relationship, choose modules. Example: a dog "is an" animal; a dog "has an"
ability to swim.

You can only subclass from one class. But you can mix in as many modules as
you'd like.

module
You cannot instantiate modules (i.e., no object can be created from a module)
Modules are used only for namespacing and grouping common methods together.

public method
A public method is a method that is available to anyone who knows either the
class name or the object's name.

These methods are readily available for the rest of the program to use and
comprise the class's interface (that's how other classes and objects will
interact with this class and its objects).

private method
methods that are doing work in the class but don't need to be available to the
rest of the program.

private methods are not accessible outside of the class definition at all, and
are only accessible from inside the class when called without self.

protected method
from outside the class, protected methods act just like private methods.

from inside the class, protected methods are accessible just like public
methods.

polymorphism
Polymorphism, technically, is the ability to redefine methods for derived
classes. Polymorphism is concerned with the application of specific
implementations to an interface or a more generic base class.

Polymorphism means that if class B inherits from class A, it doesn't have to
inherit everything about class A; it can do some of the things that class A does
differently.

ancestors, method lookup path
To see the method lookup path, we can use the .ancestors class method.

object state, instance variable
The object's state is saved in an object's instance variables.

oo, object-oriented programming
The classical approach to object oriented programming is:
1. Write a textual description of the problem or exercise.
2. Extract the major nouns and verbs from the description.
3. Organize and associate the verbs with the nouns.
4. The nouns are the classes and the verbs are the behaviors or methods.

