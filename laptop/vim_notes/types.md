# Types

A type is a collection of possible values.
An integer can have values 0, 1, 2, 3, etc.; a boolean can have values true and false.
We can imagine any type we like: for example, a HighFive type that allows the values "hi" or 5, but nothing else.
It's not a string and it's not an integer; it's its own, separate type.

Statically typed languages constrain variables' types: the programming language might know, for example, that x is an Integer.
In that case, the programmer isn't allowed to say `x = true`; that would be an invalid program.
The compiler will refuse to compile it, so we can't even run it.
Different static type systems have different expressive power, and no popular type system can actually express our HighFive type above (though many can express other, much more subtle ideas).

Dynamically typed languages tag values with types: the language knows that 1 is an integer and that 2 is an integer, but it can't know that the variable x will always hold integers.
The language runtime will check these tags at various points.
If we try to add two values, it might check that they're both numbers, or strings, or arrays.
Then it will add the values, concatenate them, or error, depending on the values' type tags.

## Statically typed languages

Static languages check a program's types at compile time without executing the program.
Any program whose types don't follow the type system's rules is rejected.
For example, most static languages will reject the expression `"a" + 1` (with C being a notable exception that allows it).
The compiler knows that "a" is a string and 1 is an integer, and that `+` only works when the left and right hand sides are of the same type, so it doesn't need to run the program to know that there's a problem.
Every expression in a statically typed language has a definite type that can be determined without executing the code.

Many statically typed languages require type declarations.
The Java function `public int add(int x, int y)` takes two integers and returns a third integer.
Other statically typed languages can infer types automatically.
That same add function is written `add x y = x + y` in Haskell.
We don't tell it the types, but it can infer them because it knows that `+` only works on numbers, so `x` and `y` must be numbers, so the function `add` must take two numbers as arguments.
This doesn't decrease the "staticness" of the type system; Haskell's type system is notoriously static, strict, and powerful, and is more so than Java's on all three fronts.

## Dynamically typed languages

Dynamically typed languages don't require type declarations, but also don't infer types.
The types of variables aren't known at all until they have concrete values at runtime.
For example, the Python function

```
def f(x, y):
    return x + y
```

can add integers, concatenate strings, concatenate lists, etc., and we can't tell which will happen without running the program.
Maybe f will be called with strings at one point and integers at another point, in which case x and y hold values of different types at different times.
This is why we say that values in dynamic languages have types, but variables and functions don't.
The value 1 is definitely an integer, but x and y above might be anything.

## Static and dynamic languages compared

Most dynamic languages will error at runtime when types are used in incorrect ways (JavaScript is a notable exception; it tries to return a value for any expression, even when that value in nonsensical).
When using dynamic languages, even a simple type error like `"a" + 1` can occur in production.
Static languages will prevent many such problems, though the degree of prevention depends on the power of the type system.

Static and dynamic languages have fundamentally different ideas about what it means for programs to be valid.
In a dynamic language, `"a" + 1` is a valid program: it will begin execution, then throw an error at runtime.
However, in most static languages, `"a" + 1` *is not a program*: it won't be compiled and it won't run.
It's invalid code, just as the random string of punctuation `!&%^@*&%^@*` is invalid code.
This extra notion of validity and invalidity has no equivalent in dynamic languages.

## Strong and weak typing

The terms "strong" and "weak" are extremely ambiguous.
Here are some ways that the terms are used:

* Sometimes, "strong" means "static".
  That's easy enough, but it's better to say "static" instead because most of us agree on its definition.

* Sometimes, "strong" means "doesn't convert between data types implicitly".
  For example, JavaScript allows us to say `"a" + 1`, which we might call "weak typing".
  But almost all languages provide some level of implicit conversion, allowing automatic integer-to-float conversion like `1 + 1.1`.
  In practice, most people using "strong" in this way have drawn a line between "acceptable" and "unacceptable" conversions.
  There is no generally accepted line; they're all arbitrary and specific to the person's opinions.

* Sometimes, "strong" means that there's no way to escape the language's type rules.

* Sometimes, "strong" means memory-safe.
  C is a notable example of a memory-unsafe language.
  If `xs` is an array of four numbers, C will happily allow code that does `xs[5]` or `xs[1000]`, giving whatever value happens to be in the memory addresses after those used to store `xs`.

Let's stop here in the name of brevity.
Here's where some languages fall on these metrics.
As shown, only Haskell is consistently "strong" by all of these definitions.
Most languages are ambiguous.

| Language   | Static? | Implicit Conversions? | Rules Enforced? | Memory-Safe? |
| ---------- | ------- | --------------------- | --------------- | ------------ |
| C          | Strong  | Depends               | Weak            | Weak         |
| Java       | Strong  | Depends               | Strong          | Strong       |
| Haskell    | Strong  | Strong                | Strong          | Strong       |
| Python     | Weak    | Depends               | Strong          | Strong       |
| JavaScript | Weak    | Weak                  | Weak            | Strong       |

(An entry of "Depends" in the "Implicit Conversions" column means that the strong/weak distinction depends on which conversions we consider acceptable.)

Often, the terms "strong" and "weak" refer to unspecified combinations of the various definitions above, and other definitions not shown here.
All of this confusion renders "strong" and "weak" effectively meaningless.
When tempted to use the terms "strong" or "weak", it's better to simply describe the exact, concrete behavior in question.
For example, we might say "JavaScript returns a value when we try to add a string to an integer, but Python throws an error".
Then, we don't have to spend the effort to carefully agree on one of the many definitions of "strong"; or, worse, end up with an unresolved misunderstanding simply due to terminology.

Most uses of "strong" and "weak" on the web are vague and ill-defined value judgements: they're used to say that a language is "good" or "bad", with the judgement dressed up in technical jargon.
As Chris Smith [has written](https://cdsmith.wordpress.com/2011/01/09/an-old-article-i-wrote/):

> Strong typing: A type system that I like and feel comfortable with
>
> Weak typing: A type system that worries me, or makes me feel uncomfortable

## Gradual typing

Can we add static types to a dynamic language?
In some cases, we can; in others, it's difficult or impossible.

The most obvious problem is `eval` and similar dynamic language features.
Evaluating `1 + eval("2")` in Python gives us 3.
But what does `1 + eval(read_from_the_network())` give us?
It depends on what's on the network at runtime.
If we get an integer, that expression is fine; if we get a string, it's not.
We can't know what we'll get until we actually run, so we can't statically analyze the type.

The unsatisfying solution used in practice is to give `eval()` the type Any, which is like Object in some OO languages or `interface {}` in Go: it's the type that can have any value.
Values of type Any aren't constrained in any way, so this effectively removes the type system's ability to help us with code involving eval.
Languages with both `eval` and a type system have to abandon type safety whenever `eval` is used.

Some languages have optional or gradual typing: they're dynamic by default, but allow some static annotations to be added.
Python has added this feature recently; TypeScript is a superscript of JavaScript that adds optional types; Flow does static type analysis on regular old JavaScript code.
These languages provide some benefits of static typing, but they can never provide the absolute guarantees of a truly static language.
Some functions will be statically typed and some will be dynamically typed.
The programmer always needs to be aware of (and wary of) the difference.

## Compiling statically typed code

When compiling statically typed code, syntax is checked first, as in any compiler.
Types are checked second.
This means that a static language will sometimes give us one syntax error, but fixing that error leads to 100 type errors.
Fixing the syntax error didn't create those 100 type errors; the compiler was just unable to check the types until the syntax was fixed.

Static language compilers can often generate faster code than dynamic languages.
For example, if the compiler knows that the add function takes integers, it can use the CPU's native ADD instruction.
A dynamic language would have to check the types at runtime, choosing one of many specific "add" functions depending on the types (is it adding integers, or floats, or is it concatenting strings, or maybe lists?); or, it might have to decide to throw an error if the types don't match.
All of that checking takes time.
Dynamic languages have tricks to speed this up, like just-in-time (JIT) compilers, where the code is recompiled at runtime after gathering information about the actual types used.
However, no dynamic language can match the speed of carefully written static code in a language like Rust.

## Arguments for static and dynamic types

Static type system advocates point out that without a type system, simple typing mistakes may result in failures in production.
This is definitely true; anyone who has used a dynamic language has experienced it.

Dynamic language advocates point out that dynamic languages seem to be easier to program in.
This is definitely true for some kinds of code that we write occasionally, like code that uses `eval`.
It's debatable for everyday code, and depends on the ill-defined term "easy".
Rich Hickey did a [fantastic talk](https://www.infoq.com/presentations/Simple-Made-Easy) about the word "easy" and its relationship to the word "simple".
Watching that will show that it's not easy to use the word "easy" well.
Be wary of "easy".

The trade-offs between static and dynamic type systems are still poorly understood, but they definitely depend heavily on the language in question and the problem being solved.

JavaScript tries to continue executing even if that means doing data conversions that are nonsensical (like `"a" + 1` returning "a1").
Python, on the other hand, tends to be conservative and throw errors often, as it will in the case of `"a" + 1`.
Those are very different approaches with different levels of safety, but Python and JavaScript are both dynamically typed.

C will happily allow the programmer to read from arbitrary locations in memory, or to treat a value of one type as if it had another type, even if that makes no sense at all and leads to a crash.
Haskell, on the other hand, won't even allow an integer and a float to be added together without an explicit conversion step added.
C and Haskell are both statically typed, despite being wildly different.

There are wide variations within dynamic languages and within static languages.
Any blanket statement of the form "static languages are better at x than dynamic languages" is almost certainly nonsense.
It may be true of some particular languages, but in that case it's better to say "Haskell is better at x than Python".

## Diversity of static type systems

Consider two well-known statically typed languages: Go and Haskell.
Go's type system lacks generics: types that are "parameterized" by other types.
For example, we might create our own list type, MyList, that can contain any type of data that we need to store.
We want to be able to create a MyList of integers, a MyList of strings, etc., without making any changes to the source code of MyList.
The compiler should enforce those types: if we have a MyList of integers, but accidentally try to insert a string into it, then the compiler should reject the program.

Go was intentionally designed without the ability to define types like MyList.
The best that we can do is to create a MyList of "empty interfaces": the MyList can hold objects, but the compiler simply doesn't know what their types are.
When we retrieve objects from a MyList, we have to tell the compiler what its type is.
If we say "I'm retrieving a string" but the actual value is an integer, we get a runtime error just like we would in a dynamic language.

Go also lacks many other features present in modern static type systems (or even systems from the 1970s).
Its designers have reasons for those decisions, though outsiders' opinions on them can be strong.

Now, let's compare Haskell, which has a very powerful type system.
If we define a MyList type, then the type of "list of ints" is simply `MyList Integer`.
Haskell will now stop us from accidentally putting strings into our list, and it will ensure that we don't put an element of the list into a variable of type string.

Haskell can also express far more complex ideas directly in types.
For example, `Num a => MyList a` means "a MyList of values that are all the same type of number".
It might be a list of integers, or floats, or fixed-precision decimal numbers, but it will definitely never be a list of strings, as verified at compile time.

We might write an add function that works on any numeric type.
That function will have the type `Num a => (a -> a -> a)`.
This means:

* `a` can be any type that's numeric (written `Num a =>`).
* The function takes two arguments of type `a` and returns type `a` (written `a -> a -> a`).

One final example.
If a function's type is `String -> String`, then it takes a string and returns a string; but if it's `String -> IO String`, then it also does some IO.
That IO can be disk access, network access, reading from the terminal, etc.

If a function *does not* have IO in its type, then we know that it doesn't do any IO.
In a web application, for example, we can tell at a glance whether a function might change the database just by looking at its type.
No dynamic languages and few static languages can do this; it's a particularity of the most powerful static languages.
In most languages, we'd have to dig down into the function, and all of the functions that it calls, and so on, looking for anything that might change the database.
The process would be tedious and error-prone, whereas Haskell's type system can answer this question easily and with certainty.

Compare all of this power with Go, which can't express the simple idea of MyList, let alone "a function that takes two arguments, both of which are numeric and of the same type, and which then does some IO".

Go's approach does make it easier to write tools for programming with Go (most notably, the compiler can be simple), and it also results in fewer concepts to learn.
The weighing of those benefits against Go's significant limitations is subjective.
However, it's unquestionably true that Haskell is more difficult to learn than Go, that Haskell's type system is more powerful, and that Haskell can prevent far more types of bugs at compile time.

Go and Haskell are so different that lumping them together as "static languages" can be deceiving even though it's a correct use of the term.
When comparing on practical safety benefits, Go is closer to dynamic languages than it is to Haskell.
On the other hand, some dynamic languages are safer than some static languages (Python is generally considered to be much safer than C).
When tempted to make generalizations about static languages or dynamic languages as a group, keep the huge variation between languages in mind.

## Concrete examples of type system power differences

With more powerful type systems, we can specify constraints at finer levels of granularity.
Here are some examples, but don't get bogged down if the syntax doesn't make sense.

In Go, we can say "the add function takes two integers and returns an integer":

```go
func add(x int, y int) int {
    return x + y
}
```

In Haskell, we can say "the add function takes *any* type of numbers, and returns a number of that same type":

```haskell
add :: Num a => a -> a -> a
add x y = x + y
```

In Idris, we can say "the add function takes two integers and returns an integer, but its first argument must be smaller than its second argument":

```idris
add : (x : Nat) -> (y : Nat) -> {auto smaller : LT x y} -> Nat
add x y = x + y
```

If we try to call this function as `add 2 1`, where the first argument is larger than the second, then the compiler will reject the program *at compile time*.
It's impossible to write a program where the first argument to add is larger than the second.
Very few languages have this capability.
In most languages, this kind of check is done at runtime: we write something like `if x >= y: raise SomeError()`.

Haskell has no equivalent of the Idris type above, and Go has no equivalent of either the Idris type or the Haskell type.
As a result, Idris can prevent many bugs that Haskell can't, and Haskell can prevent many bugs that Go can't.
In both cases, we need additional type system features, which make the language more complex.

## Some static languages' type systems

Here's a very rough list of some languages' type system power in increasing order.
This is meant to provide a rough sense of type system power and shouldn't be taken as an absolute.
The languages grouped together here can be very different from each other.
Each type system has its own quirks and most of them are very complex.

* **C (1972), Go (2009)**: These aren't very powerful at all, with no support for generic types. We can't define a MyList type that can be used as a "list of ints", "list of strings", etc. Instead, it will be a "list of unspecified values". The programmer must manually say "this is a string" each time one is removed from the list, which may fail at runtime.
* **Java (1995), C# (2000)**: These both have generic types, so we can say `MyList<String>` to get a list of strings, with the compiler being aware of and enforcing that constraint. Items retrieved from the list will have type String, enforced at compile time as usual, so runtime errors are less likely.
* **Haskell (1990), Rust (2010), Swift (2014)**: These all share several advanced features, including generics, algebraic data types (ADTs), and type classes or something similar (respectively: type classes, traits, and protocols). Rust and Swift have more mass appeal than Haskell, with strong organizations pushing them (Mozilla and Apple, respectively).
* **Agda (2007), Idris (2011)**: These support dependent types, allowing types like "a function that takes an integer x, and an integer y, where y is greater than x". Even the "y is greater than x" constraint is enforced at compile time: at runtime, y will never be less than or equal to x, no matter what happens. Very subtle but important properties of systems can be verified statically in these languages. Only a small minority of programmers learn them, but some become very excited about them.

There's a clear trend toward more powerful systems over time, especially when judging by language popularity rather than languages simply existing.
The notable exception is Go, which explains why many static language advocates shun it as a step backwards.
Group two (Java and C#) are mainstream languages that are mature and widely used.
Group three looks poised to enter the mainstream, with big backers like Mozilla (Rust) and Apple (Swift).
Group four (Idris and Agda) are nowhere near mainstream use, but that may change eventually; group three wasn't anywhere near mainstream use just ten years ago.
