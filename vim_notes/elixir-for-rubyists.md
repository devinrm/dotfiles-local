# A top-down look into Elixir (for Rubyists)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Phoenix (as "Rails for Elixir")](#phoenix-as-rails-for-elixir)
  - [Rails and Phoenix can get suspiciously similar](#rails-and-phoenix-can-get-suspiciously-similar)
  - [A code sample:](#a-code-sample)
    - [`controller.rb`](#controllerrb)
    - [`controller.ex`](#controllerex)
- [Phoenix (as Phoenix)](#phoenix-as-phoenix)
  - [Live Reload](#live-reload)
- [Elixir (as "Ruby for the Erlang VM")](#elixir-as-ruby-for-the-erlang-vm)
  - [Feature Mapping](#feature-mapping)
  - [Community](#community)
- [Elixir (as a language on top of Erlang)](#elixir-as-a-language-on-top-of-erlang)
  - [What makes it performant?](#what-makes-it-performant)
  - [Processes](#processes)
  - [Fault tolerance](#fault-tolerance)
  - [Features](#features)
- [Elixir (as Elixir)](#elixir-as-elixir)
  - [Erlang VM and OTP integration](#erlang-vm-and-otp-integration)
  - [No State](#no-state)
  - [Pipe Operator](#pipe-operator)
  - [The match operator: `=`](#the-match-operator-)
  - [Pattern Matching](#pattern-matching)
- [When is Elixir better suited than Ruby?](#when-is-elixir-better-suited-than-ruby)
  - [High-traffic Systems](#high-traffic-systems)
  - [Distributed / Clustered Systems](#distributed--clustered-systems)
  - [High-availability Systems](#high-availability-systems)
  - [Large Applications](#large-applications)
- [Links I consulted](#links-i-consulted)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Phoenix (as "Rails for Elixir")

## Rails and Phoenix can get suspiciously similar

* Both are MVC
* Both provide a default directory structure
* Both provide a default stack with relational database
* Both provide a default testing setup
* Both promote security by default
* Both focus on productivity, client to server side

## A code sample:

### `controller.rb`

```ruby
before_action :find_user

def show do
  @post = @user.posts.find(params[:id])
end

def find_user
  @user = User.find(params[:user_id])
end
```

### `controller.ex`

```elixir
plug :find_user

def show(conn, %{"id" => id}) do
  post = conn.assigns.user |> assoc(:posts) |> Repo.get(id)
  render conn, "show.html", post: post
end

defp find_user(conn, _) do
  assign(conn, :user, Repo.get(User, conn.params["user_id"]))
end
```

# Phoenix (as Phoenix)

* Convention over configuration. But not so much.
* Rails controller state: params hash, request object, any instance variables
* Phoenix controller state: `conn` (comparable to [rack's `env` and `response`][rack]) passed as parameter
* Phoenix controller actions are... functions! Easy to unit test

[rack]: http://www.rubydoc.info/github/rack/rack/master/file/SPEC#The_Environment

## Live Reload

* When you save any file in your application (whether it's SASS, Elixir or
  ES2015 JavaScript), appropriate files are recompiled and the browser is
  refreshed in a blink.
* Brunch for asset pipeline
* A feature I missed from Ember.

# Elixir (as "Ruby for the Erlang VM")

* Elixir's syntax feels familiar to rubyists
* Both languages are high-level, readable, and fun

## Feature Mapping

| Ruby                   | Elixir               |
|------------------------|----------------------|
| `irb`                  | `iex`                |
| `rake` tasks           | [`mix`] \(built in)  |
| `bundler` dependencies | [`mix`] \(built in)  |
| `binding.pry`          | `IEx.pry` (built in) |
| Polymorphism           | [Protocols]          |
| Lazy Enumerables       | [Streams]            |
| Metaprogramming        | [Macros] \(used sparingly) |
| Rails                  | [Phoenix]            |

[Protocols]: http://elixir-lang.org/getting-started/protocols.html
[Streams]: http://elixir-lang.org/docs/stable/elixir/Stream.html
[`mix`]: http://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html
[Phoenix]: http://www.phoenixframework.org/

The [Macros] documentation explicitly discourages its use, and then explains how
they can extend the language.

[Macros]: http://elixir-lang.org/getting-started/meta/macros.html

## Community

The fast growing supportive community is reminiscent of Ruby during the
early days of Rails.

# Elixir (as a language on top of Erlang)

* Elixir runs on the Erlang virtual machine (BEAM)
* Erlang was born three decades ago (at Ericsson in 1986)
* Erlang has been Open Source for almost two decades (since 1998)
* Erlang is now maintained by the Open Telecom Platform (OTP) unit at Ericsson

## What makes it performant?

WhatsApp got [two million TCP connection in a single box][whatsapp]. What role
does Erlang play in this?

[whatsapp]: https://blog.whatsapp.com/196/1-million-is-so-2011

## Processes

Is Erlang uniquely performant? Do we lose anything to seize those benefits?
TL;DR: We don't get mutability, and shared memory (almost always).

* The Erlang VM runs as one OS process
* It runs one OS thread per core by default (Elixir apps use all CPU cores)
* Erlang processes are implemented by the VM and have no connection to OS
  processes or threads
* An Erlang system running over one million (Erlang) processes may run one OS
  processes, and one thread per core
* Cooperative threading: threads switch at controlled execution points instead of preemptively, and
  don’t have the CPU context switch penalty
* Thread memory footprint starts very small compared to OS ones
* Processes share no state with each other
* Processes communicate through asynchronous messages
* Erlang enforces immutable data, helping with thread safety and lock avoidance
* GC is fast: Every variable is immutable, so a variable can never point to a
  value created after it
* GC is fast: Values are copied between processes, so memory referenced in a
  process is isolated (almost always)
* GC is fast: it runs per (small) process

## Fault tolerance

* Erlang’s architecture is share nothing: each node is independent and
self-sufficient
* No single point of failure
* Allows self-healing and non-disruptive upgrades

Fault-tolerance in Erlang means “keep system running”:

* it's **ok** to maybe drop a user’s phone call
* it’s **not ok** to drop everyone’s phone call

Paraphrasing José Valim at The Changelog podcast:

> Unlike the web, telecommunication companies can't call everyone and say there
> will be an outage between 6 and 6:30am. They have to keep the lights always
> on.

In terms of the [CAP Theorem], you will typically get Availability, Partition
Tolerance, and (only Eventual) Consistency.

[CAP Theorem]: https://en.wikipedia.org/wiki/CAP_theorem

## Software runs concurrently by default

Horizontal vs. Vertical scaling

## Features

* Distributed
* Fault-tolerant
* Soft real-time (think telecommunications’ quality of service)
* Highly available
* Hot code swapping
* Share nothing concurrency (the first popular Actor-based concurrency implementation)


# Elixir (as Elixir)

While Elixir resembles Ruby, there are notable differences.

## Erlang VM and OTP integration

* Distributed, fault tolerant, concurrent, highly available foundations
* A functional paradigm (if that's your thing)

## No State

* Functions are pure, with no side effects
* Values are immutable

## More explicit

Explicit > implicit

But not so much. It's a nice balance between:

> “Go is cool because we spell out all da things!”

and

> “Ruby is cool because a call to `acts_as_concurrent` makes everything ok”

It’s The Perfect Balance (disclaimer: opinion, not a fact)

## Pipe Operator

Took this from Fabio Akita's blog post (and his talk in Goruco):
http://www.akitaonrails.com/2016/02/18/elixir-pipe-operator-for-ruby-chainable-methods.

In Ruby we can write code like the following:

```ruby
text.split(“\n”).map(&:strip).reject(&:empty?)
```

Each call returns an `Enumerable` object, and so we can chain `Enumerable`
methods on each result. But what if we wanted to give names to each call?

```ruby
(1..500).to_a.
  multiply_elements_by_three.
  keep_only_odd_elements.
  sum_elements
```

To make this work we'd need to monkey patch Ruby to define these methods on
`Array`.

In a functional fashion, an Elixir version of that code is:

```elixir
Enum.sum(Enum.filter(Enum.map(1..500, &(&1 * 3)), &Integer.is_odd/1)) # => 187_500
```

This could be more readable if we used local variables:

```elixir
multiplied_by_three = Enum.map(1..500, &(&1 * 3))
only_odd_elements = Enum.filter(multiplied_by_three, &Integer.is_odd/1)
Enum.sum(only_odd_elements) # => 187_500
```

The pipe operator introduces the expression on the left-hand side as the first
argument to the function call on the right-hand side. It allow us to refactor
code like:

```elixir
1..500
|> Enum.map(&(&1 * 3))
|> Enum.filter(&Integer.is_odd/1)
|> Enum.sum # => 187_500
```

Each step can be extracted into an intention revealing function:

```elixir
1..500
|> multiply_elements_by_three
|> keep_odd_elements_only
|> sum_elements
```


## The match operator: `=`

There will be no more assignments!

```elixir
iex> {a, b, 42} = {:hello, “world”, 42}
{:hello, “world”, 42}
iex> a
:hello
iex> b
“world”
```

## Pattern Matching

Example:

```eex
<%= for document <- documents do %>
  <li class="<%= active_class(@conn.assigns, document.id) %>">
    <%= document.title %>
  </li>
<% end% >
```

`active_class` implementation:

```elixir
def active_class(%{document: %{id: id}}, id), do: “active”
def active_class(_, _), do: “”
```

* Conventional control-flow statements not common
* Many small functions, with guard clauses or pattern matching
* Code results more declarative than imperative

# When is Elixir better suited than Ruby?

I believe Elixir and Ruby are interchangeable for simple web applications with
no high-traffic or very low response time demands.

For some applications, Elixir makes better technical sense:

## High-traffic Systems

* Elixir is faster by an order of magnitude
* Erlang and Elxir, are great fit for multi-core hardware. Elixir’s programs are built in distributed manner even if they run on a single machine.

## Distributed / Clustered Systems

* Scale horizontally rather than vertically whenever possible
* This can be done in any architecture with a proxy sitting in front of a “cluster”, and then sharing state gets tricky (Redis, single point of failure)

## High-availability Systems

* Fault tolerance
* Code hot-swapping

## Large Applications

* Built-in tools to split the code base into chunks (Umbrella Projects)
* Code is loosely coupled by design, enforced by the language itself

# Links I consulted

* http://elixir-lang.org/
* http://programmingzen.com/2016/06/14/next-programming-language/
* http://www.akitaonrails.com/2016/02/18/elixir-pipe-operator-for-ruby-chainable-methods
* http://www.evanmiller.org/elixir-ram-and-the-template-of-doom.html
* http://www.phoenixframework.org/
* https://www.amberbit.com/blog/2015/12/22/when-choose-elixir-over-ruby-for-2016-projects/
* https://berb.github.io/diploma-thesis/original/054_actors.html
* https://dockyard.com/blog/2015/11/18/phoenix-is-not-rails
* https://stackoverflow.com/questions/2708033/technically-why-are-processes-in-erlang-more-efficient-than-os-threads
* https://stackoverflow.com/questions/3172542/are-erlang-otp-messages-reliable-can-messages-be-duplicated/3176864
* https://www.fastcompany.com/3026758/inside-erlang-the-rare-programming-language-behind-whatsapps-success
* https://www.youtube.com/watch?v=OxhTQdcieQE
