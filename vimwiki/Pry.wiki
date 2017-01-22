-m, --methods             Show public methods defined on the Object (default)

-M, --instance-methods    Show methods defined in a Module or Class

-p, --ppp                 Show public, protected (in yellow) and private (in green) methods

-q, --quiet               Show only methods defined on object.singleton_class and object.class

-v, --verbose             Show methods and constants on all super-classes (ignores Pry.config.ls.ceiling)

-g, --globals             Show global variables, including those builtin to Ruby (in cyan)

-l, --locals              Show locals, including those provided by Pry (in red)

-c, --constants           Show constants, highlighting classes (in blue), and exceptions (in purple)

-i, --ivars               Show instance variables (in blue) and class variables (in bright blue)

-G, --grep                Filter output by regular expression

-h, --help                Show this message.

? - show-doc (? Array#map!)

$ - show-source ($ Array#map!)

edit <method name> - opens vim from pry to allow for editing.

play -l <line number> (check if a line works)

.git diff - see what changes you have made

wtf? - see a detailed stack trace when the program crashes

cat --ex - directs you to the actual line that threw the exception (analyzing stack traces)

pry-byebug
Adds next ,step, finish and continue commands to Pry for stepping through your program's code and up, down and frame commands for callstack navigation.

pry-rails
recognize-path     See which route matches a url.

show-middleware    Show all middleware (that rails knows about).

show-model         Show the given model.

show-models        Show all models.

show-routes        Show all routes in match order.
