# Types

All objects hold the property of `type` and a methods of `to string`, `is`, `copy`.

## Char
Represents a single character.

* `to char code` -> `int`: an int of the unicode for the that char
* `length` -> `int`: returns the length of a char, will always be `1` or `0`

## String
A string of characters to represent any text, from **"hello world"** to **the works of shakespeare**.

* `length` -> `int`: the length of the string
* `concatenate`, *...*`string` -> `sting`: returns the the string with the strings added
* `split`, ?`string` -> `list<string>`: returns a list of the string split over a string pattern, or on every character
* `substring`, `int`, ?`int` -> `string`: returns a string of the length, from the starting index, to ending index (the end of the string if not supplied), if the starting index is greater than the ending index then the string is sliced in a reversed order, the index can be negative and if they are they count from the end
* `trim` -> `string`: returns the string with all the white space on either side removed
* `trim left` -> `string`: returns the string with all the white space on the left side removed
* `trim right` -> `string`: returns the string with all the white space on the right side removed
* `pad`, `int` -> `string`: returns the string with an amount of whitespace on either side
* `pad left`, `int` -> `string`: returns the string with an amount of whitespace on the left
* `pad right`, `int` -> `string`: returns the string with an amount of whitespace on the right
* `replace`, `string`, `string`, `int`: returns the string with the old substring replace for the new substring, up to a max times, if negative it counts from the end, if positive it counts from the start, if zero it has no limit
* `at position`, `int` -> `char`: returns the char at a position, negative integers count from the end
* `reverse` -> `string`: returns the string in reversed order
* `count`, `string` -> `int`: returns the number of occurrences of the substring 
* `to char codes` -> `list<int>`: a list containing all the chars as their codes
* `to uppercase` -> `string`: a string with all chars turned to uppercase counter parts
* `to lowercase` -> `string`: a string with all chars turned to lowercase counter parts
* `to title` -> `string`: a string with all first letters of words in uppercase and the rest in lowercase
* `to capitalised` -> `string`: a string with only the first letter capitalised
* `is integer` -> `bool`: checks if the string can be an int
* `is double` -> `bool`: checks if the string can be a double
* `is alpha` -> `bool`: checks if the string is all alphabetical chars
* `is punctuation` -> `bool`: checks if the string is all punctuation
* `is whitespace` -> `bool`: checks if the string is all whitespace
* `ends with`, `string` -> `bool`: checks if the string ends with a substring
* `starts with`, `string` -> `bool`: checks if the string starts with a substring
* `contains`, `string` -> `bool`: checks if the string contains a substring

## Bool
A `true` or `false` value.

* `to int` -> `int`: returns `1` or `0`

## Int
An integer, a whole number, e.g. `4`

* `to double` -> `double`: returns the double representation of the integer e.g. `7` -> `7.0`
* `to bool` -> `bool`: returns true if it is `1` or greater, else if it is `0` it returns false  
* `is even` -> `bool`: returns true if the number is even
* `is odd` -> `bool`: returns the true if the number is odd
* `is negative` -> `bool`: returns true if the number is less than `0`
* `absolute` -> `int`: returns the absolute value of the number
* `round`, `int` -> `int`: rounds the int to the nearest int of precision
* `to radix string`, `int`: returns the string of the number with a custom base, e.g. 2, for a binary number (min: 2, max: 32)
* `power`, `double` -> `double`: returns the number to the power of **x**

## Double
A real number representation, e.g. my favourite dish `3.14`.

* `to precision`, `int` -> `double`: returns a double to precision, use negative numbers to round above the decimal point e.g. `-2` would round `1726.73` -> `1700.00`, `0` rounds on the decimal point `12.672` -> `12.0`, and positive integers round after the decimal point `2` rounds `3.74382` -> `3.74`
* `round`, `int` -> `double`: rounds the double to the nearest double of precision
* `absolute` -> `double`: returns the absolute value of the number
* `is negative` -> `bool`: returns true if the number is less than `0`
* `absolute` -> `double`: returns the absolute value of the number
* `to radix string`, `double`: returns the string of the number with a custom base, e.g. 2, for a binary number (min: 2, max: 32)
* `power`, `double` -> `double`: returns the number to the power of **x**

## List 
Holds a series of values in a preserved order

* `at position`, `int` -> `T`: returns the value at a specific index, negative integers are counted from the end e.g. and index of `-1` would add it at the last index
* `add`, `<T>` -> `void`: adds the element to the end of the list
* `add all`, `list<T>` -> `void`: adds a list of elements to the end
* `insert`, `int`, `T` -> `void`: adds an element at a specific index, negative integers are counted from the end e.g. and index of `-1` would add it at the last index
* `remove`, `T`, ?`int` -> `list<T>`: removes all instances of that element, unless a specific number is supplied, and returns a copy of the list
* `remove at`, `int` -> `T`: removes the value at a specific index, negative integers are counted from the end e.g. and index of `-1` would add it at the last index
* `pop`, ?`int` -> `T`?: returns and removes the value at a specific index or default of 0, negative integers are counted from the end e.g. and index of `-1` would add it at the last index
* `map`, `function(T)<X>` -> `list<X>`: returns a list with all elements passing through a function
* `where`, `function(T)<bool>` -> `list<T>`: returns a copy of the list where all elements passed the function check
* `all`, `function(T)<bool>` -> `bool`: checks if all elements in the list pass the function's check
* `any`, `function(T)<bool>` -> `bool`: checks to see if any elements pass the function's check
* `none`, `function(T)<bool>` -> `bool`: checks to see if none of the elements pass the function's check
* `unique`, ?`function(T)<N>`-> `list<T>`: returns a list with all unique elements in them, with an optional function to filter on a key
* `join`, `string` -> `string`: returns a string of all elements in the list 
* `sort`, ?`function(T, T)<int>` -> `list<T>`: returns a sorted list with optional function
* `shuffle` -> `list<T>`: returns the list in a random order
* `first` -> `T?`: returns the first element or null
* `last` -> `T?`: returns the last element or null
* `sublist`, `int`, ?`int` -> `list<T>`: returns a list of the length, from the starting index, to ending index (the end of the list if not supplied), if the starting index is greater than the ending index then the list is sliced in a reversed order, the index can be negative and if they are they count from the end
* `reversed` -> `list<T>`: returns the list in reversed order
* `enumerate`, ?`int` -> `list<list<int, T>>`: returns the list with each element nested in a list with each index and starting value for the index incrementation
* `clear` -> `void`: removes all entries from the list
* `foreach`, `function(T)<void>` -> `void`: loops over each item in the array and performs a function on them
* `count`, `T` -> `int`: returns the number of occurrences of the item 

## Map
Holds key value pairs, in a non specific order

* `keys` -> `list<K>`: returns all the keys in the map
* `values` -> `list<V>`: returns all the values in the map 
* `key values` -> `list<List<K, V>>`: returns all the key-value pairs in nested lists
* `map`, `function(K, V)<List<K, V>>` -> `map<K, V>`: returns all the key-value pairs in their list form and the returned list
* `where`, `functions(K, V)<bool>` -> `map<K, V>`: returns all the key-value pairs that parse the function's check
* `add`, `K`, `V` -> `void`: adds a key value pair to the map, errors if they key already exists
* `remove key`, `K` -> `void`: removes a key-value pair by a key
* `remove values`, `V` -> `void`: removes all key-value pairs where the value is that supplied

# Syntax
## Assignment
### states of mutability
* var: can change, and determined at run time
* final: can not change and determined at run time
* const: can not be changed and determined at compile time

```
// mutability type namespace = value

var int numberOfSausages = 6
```

### reassignment
```
// namespace = value

numberOfSausages = 12
```

## If statements
```
// if condition:
    // code

if x > 5:
    print('x is bigger than 5')
else if x < 5:
    print('x is smaller than 5')
else:
    print('x is five')
```

## Iteration

### Foreach
loops over each element of an iterable

```
// foreach iteration in iterable:
    // code

foreach crumbleTopping in ['apple', 'pear', 'rhubarb']:
    print('* '.concatenate(crumbleTopping))
```

### For
has an iteration from a number to a second number, if the first number if higher than the second number the step runs in reverse.
step must be an abs value and increments the number by x amount.
for is not inclusive of the second number

```
// for iteration from lowerBound to upperBound:
    // code

for i from 0 to 101:
    print('loading '.concatenate(i.toString()).concatenate('%'))

for i from 10 to -2 step 2:
    print('count down '.concatenate(i.toString()))
```

### While
runs an unknown number of times

```
// while condition:
    // code

x = 10
while x > 0:
    x--

while true:
    if randomInt(0, 10) == 10:
        break
```

## Try Except
```
try:
    // code
except as e:
    // code
finally:
    // code
```

## Functions
```
// def returnType functionName(argumentType argumentName):
    // code

def int add(int a, int b):
    return a + b
```

## Operators
### Arithmetic
* `+` addition
* `++` increment
* `-` subtraction
* `--` decrement
* `*` multiplication
* `**` exponent
* `/` division
* `//` integer division
* `%` modulus

### Boolean
* `!` not
* `&&` and
* `||` or
* `^^` xor
* `==` equals too
* `!=` not equals too
* `>` greater than
* `>=` greater than or equal too
* `<` less than
* `<=` less than or equal too

### Bitwise
* `!!` not
* `&` and
* `|` or
* `^` xor

### Iterables
* `...` spread
* `***` key value spread
* `$` concatenation

## Pointers
* `@` mutable pointer
* `#` immutable pointer

## Key words
* `for` the start of a for loop
* `from` the indicator of a starting value in a for loop
* `to` the indicator of an ending value in a for loop
* `step` the indicator of a the stepping value in a for loop
* `for each` the start of a for each loop
* `in` the indicator of the split for iteration and the iterable
* `while` the start of a while loop

* `if` to start of an if statement
* `else` the end of an if statement

* `char` the char type
* `string` the string type
* `bool` the bool type
* `int` the int type
* `double` the double type
* `list` the list type
* `map` the map type
* `type` the type type
* `null` the instance of nothing

* `def` the keyword for defining a function
* `void` the keyword for a no returning function

* `true` the value of true
* `false` the value of false
