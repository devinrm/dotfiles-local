-------------------------STRING METHODS------------------------
indexOf
Gives you the numeric index of a character or a string of characters within the string. If the search character or string doesn't exist, a value of -1 is returned.

lastIndexOf
Finds the index of the last index of a character or string of characters. Returns -1 if the searched string doesn't exist.

replace
Attempts to find a string within the originating string, and if it does, replaces it with the second string or value provided.

split
This will split the string up into an array of strings based on a separator. If you supply it an empty string, it will split the string up into an array of single character strings. Just like the replace method, often times you will see this written using a regular expression if the string is being split into any format other than single character strings. When the split occurs, the character or string of characters that is passed to split is removed.

substr
This method takes two numbers as its parameters and returns a portion of the original string from the starting index of the first parameter and ending a number of characters beyond that starting point specified by the second parameter. If the second parameter is left out, you will receive a new string starting at the index supplied and ending at the end of the string. You can also specify a negative value for the starting index to get an index from the end of the string rather than from the beginning.

substring
This is often confused with the substr method. This method will obtain a new string that starts at the index provided by the first parameter and ends at the index provided by the second parameter. If the second parameter is less than the first, the characters received will be from the lesser index to the greater index, effectively swapping their places. Note the differences between the two methods below.


Substr starts at the index based on the first argument, and obtains a number of characters based on the second argument. Substring, however, takes a starting index and an ending index and obtains the characters within those two.


toUpperCase and toLowerCase
These two methods quicky allow you to change the letters in a string to the uppercase or lowercase versions. All other characters are left unchanged.


-------------------------IONIC STUFF---------------------------
ionic state restore
$rootscope
$scope
$localStorage
$state.go
