I reviewed some common Ruby methods and grouped them by behavior.

Hopefully this helps someone else too.

[Please copy paste and fix typos, add/delete, improve from this Gist.](https://gist.github.com/dirkdirk/9209d7ea67ac57543975162713910224)

-

# Array

`map` = `collect`

`select!` = `keep_if` = `find_all`

`reject` = `delete_if`

-

arr.`compact` => Returns an array with all nil values removed.

arr.`count` { |x| x > 1 } => Returns number of elements that are >1.

arr.`sample(n)` => Returns an array containing n random elements from arr.

---

# Enumerable

enum.`find` { |e| e > 1 } => Returns the value of first e for which the block returns true.

enum.`find_index` { |e| e > 1 } => Returns the index of first e for which the block returns true.

enum.`find_all` { |e| e > 1 } => Returns an array with values of e for which the block returns true. (Same as `select` and `keep_if`.)

enum.`take_while` { |e| e > 1 } => Returns an array with values of e for which the block return true;
                                   however if/when false is returned, iteration over the enum halts.

enum.`grep(/abc/)` { |e|  } => Returns an array with elements processed by the optional block for which grep returns true.

enum.`grep_v(/abc/)` { |e|  } => Returns an array with elements processed by the optional block for which grep returns false.

enum.`reject` { |e| e > 1 } => Returns an array with elements for which the block evaluates to false.
                               I.e. elements for which the block evals to true are rejected.

-

enum.`all?` { |e| e > 1 } => Returns true if block returns true for all elements of enum.

enum.`none?` { |e| e > 1 } => Returns true if block returns false for all elements passed to the block.

enum.`one?` { |e| e > 1 } => Returns true if one and only one e evaluates to true in the block.

enum.`any?` { |e| e > 1 } => Returns true if block returns true for any element in enum.

-

enum.`max_by(n)` { |x| x.length } => Returns array with n max elements returned by the block.

enum.`min_by(n)` { |x| x.length } => Returns array with n min elements returned by the block.

enum.`minmax` => Return an array with the min and max of enum. (Optional block can be added.)

-

enum.`drop(3)` - Removes first 3 elements from enum and returns rest of enum.

enum.`drop_while` { |x| x > 1 } - Removes elements as long as block evals to true, then returns rest of enum.

enum.`first(n)` => Returns an arr of first n elements of enum.

enum.`last(n)` => Returns an arr of last n elements of enum.

-

enum.`each_cons(n)` { |x|  } - Executes block on consecutive groups of size n. I.e. n=3, [0, 1, 2], [1, 2, 3], ...

enum.`each_slice(n)` { |x|  } - Executes block on each slice of size n. I.e. n=3, [0, 1, 2], [3, 4, 5], ...

-

enum.`each_with_index` { |obj, index|  }

enum.`each_with_obj([])` { |x, memo_obj| memo_obj << x.methods } => Returns value of memo_obj.

-

enum.`partition` { |x| x.even? } => Returns an array of 2 arrays: first with elements for which block evals to true, second, the rest.

-

enum.`sort_by` { |e| e.length } => Returns an array with elements sorted by block.

---

# Hash

hsh.`each` { |key, value| ... }

---

# Integer

x.`times` { |i| ... } - Iterates from 0 to x-1.

x.`upto(y)` { |i| ... } - Iterates from x to y.

---

# String

str `<<` ' x' => Mutates str by concatenating ' x'.

str.`concat(' x')` => Returns str with ' x' concatennated.

str.`prepend('x ')` => Returns ste with 'x ' prepended.

"#{str} x" - Returns string interpolated str and 'x'.

-

str `=~` /\d/ => Returns start position of match or nil.

-

str[n] => Returns n-th char of str.

str[n] = x  or  str[n..m] = x => Replaces n or n..m with x.

str.`insert(3, 'x')` => Returns str with 'x' inserted at index 3.

-

str.`capitalize` => Returns and capitalizes first char (if it's a letter) and lower cases the remainder of str. capitalize! mutates.

str.`upcase` => Returns entire str lower cased. upcase! mutates.

str.`downcase` => Returns entire str upper cased. downcase! mutates.

str.`swapcase` => Returns str with cases swapped.  swapcase! mutates.

-

str.`center(n)` => Returns str centered on n white spaces.

str.`ljust(n, x)` => Returns str left justified on n white spaces or x.

str.`rjust(n, x)` => Returns str right justified on n white spaces or x.

str.`lstrip` => Returns str with left white spaces removed. lstrip! mutates.

str.`rstrip` => Returns str with right white spaces removed. rstrip! mutates.

str.`strip` => Returns str with left and right white spaces removed. strip! mutates.

-

str.`chomp` => Returns str with ending record separator removed.

str.`chop` => Returns str with last char removed.

-

str.`codepoints` => Returns array of Integer ordinals (ASCII number in dec) for each char in str.

str.`each_codepoint` { |c| ... } - Passes the Integer ordinal of each char to block.

'a'.`ord` => Returns Integer ordinal of 1 char long str.

-

str.`each_line('x')` { |s| ... } - Splits str by line or 'x', if given, and passes to block.

str.`lines('x')` => Splits str by line or 'x', if given, and returns them as elements of an array.

str.`partition(sep)` => Returns an array with elements of str partitioned by sep (can be regex).

str.`scan(x)` => Returns an array with elements of str that x (can be regex) matches.

str.`scan(x)` { |match, ...| ... } => Passes matches to block.

str.`split(' ')` => Returns an array with elements of str split by argument. ' ' is the default. To split by char use str.chars

str.`chars` => Returns an array with each char as an element. Short hand for str.each_char.to_a.

-

str.`delete('x', 'xy')` => Returns str with all chars at intersection of arguments deleted. I.e. 'x's in this case. delete! in place deletion.

-

str.`end_with?('x')` => Returns true if str ends with 'x'.

str.`start_with?('x')` => Returns true if str starts with 'x'.

-

str.`gsub(/([aeiou])/, '</1>')` => Returns str with each aeiou replaced with <> around said vowel. gsub! mutates.

"hello".gsub(/[aeiou]/, '*')                               #=> "h*ll*"

"hello".gsub(/([aeiou])/, '<\1>')                      #=> "h<e>ll<o>"

"hello".gsub(/./) {|s| s.ord.to_s + ' '}              #=> "104 101 108 108 111 "

"hello".gsub(/(?<foo>[aeiou])/, '{\k<foo>}')   #=> "h{e}ll{o}"

'hello'.gsub(/[eo]/, 'e' => 3, 'o' => '*')            #=> "h3ll*"

str.`sub(...)` => Replaces only first occurance of match.

str.`tr(from, to)` => Returns str with from translated to to with duplicates in place and correspondance retained.
                            See http://devdocs.io/ruby~2.3/string#method-i-tr

str.`tr_s(from, to)` => Returns str with from translated to to with duplicates removed.
                                See http://devdocs.io/ruby~2.3/string#method-i-tr_s

-

str.`squeeze('x')` => Returns str with runs of 'x's replaced with one 'x'. ('x') is optional; default is all runs.

-

str.`to_i(n)` => Returns base-10 Integer of leading numbers in str interpreted in base-n (default 10).

str.`to_sym` => Returns str as a Symbol.

-

Is a char a letter, number, or something else?

str.downcase =~ /[a-z]/

str =~ /\d/
