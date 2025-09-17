# Types

All objects hold the property or methods of:
* `type` -> `type`: the type of the object,
    e.g. `5.type` -> `int`
* `to string` -> `string`: converts the object to a string representation of itself,
    e.g. `7.6.toString()` -> `'7.6`
* `is`, `any` -> `bool`: checks if any object is the same in memory,
    e.g. `myList = [1, 2, 3, 5]; #myList.last.is(#myList.atPosition(-1))` -> `true`

## String
A string of characters to represent any text, from **"hello world"** to **the works of shakespeare**.

* `length` -> `int`: the length of the string,
    e.g. `'hello world'.length` -> `11`
* `concatenate`, *...*`string` -> `string`: returns the the string with the strings added
    e.g. `'hello'.concatenate(' ', 'world')` -> `'hello world'`,
    could be written `'hello' $ ' ' $ 'world'` 
* `split`, ?`string` -> `list<string>`: returns a list of the string split over a string pattern,
    or on every character if no substring is provided,
    e.g. `'hello world.split()` -> `['h', 'e', 'l', 'l', 'o', ' ', 'w', o', 'r', 'l', 'd']`,
    `'I am an awesome programmer'.split('a')` -> `['I ', 'm ', 'wesome progr', 'mmer']`
* `substring`, `int`, ?`int` -> `string`: returns a string of the length,
    from the starting index,
    to ending index (the end of the string if not supplied),
    if the starting index is goreater than the ending index then the string is sliced in a reversed order,
    the index can be negative and if so the count starts from the end,
    e.g. `'an awesome language'.substring(3)` -> `'awesome language'`,
    `'an awesome language'.substring(3, -10)` -> `'awesome'`,
    `'an awesome language'.substring(-1, 0)` -> `'egaugnal emosewa na'`
* `trim` -> `string`: returns the string with all the white space on either side removed,
    e.g. `'      hello humans      '.trim()` -> `'hello humans'`
* `trim left` -> `string`: returns the string with all the white space on the left side removed,
    e.g. `'      hello humans      '.trimLeft()` -> `'hello humans      '`
* `trim right` -> `string`: returns the string with all the white space on the right side removed,
    e.g. `'      hello humans      '.trimRight()` -> `'      hello humans'`
* `pad`, `int` -> `string`: returns the string with an amount of whitespace on either side,
    e.g. `'hello world'.pad(5)` -> `'     hello world     '`
* `pad left`, `int` -> `string`: returns the string with an amount of whitespace on the left,
    e.g. `'hello world'.padLeft(7)` -> `'       hello world'`
* `pad right`, `int` -> `string`: returns the string with an amount of whitespace on the right,
    e.g. `'hello world'.padRight(3)'` -> `'hello world   '`
* `replace`, `string`, `string`, `int`: returns the string with the old substring replace for the new substring, up to a max times,
    if negative it counts from the end, if positive it counts from the start, if zero it has no limit,
    e.g. `'banana'.replace('a', 'x', 1)` -> `'bxnana'`,
    `'banana'.replace('a', 'x', -1)` -> `'bananx'`,
    `'banana'.replace('a', 'x', 0)` -> `'bxnxnx'`
* `at position`, `int` -> `string`: returns the char at a position,
    negative integers count from the end,
    e.g. `'hello world'.atPosition(2)` -> `'l'`,
    `'hello world'.atPosition(-1)` -> `'d'`
* `reverse` -> `string`: returns the string in reversed order,
    e.g. `'racecar'` -> `'racecar'`
* `count`, `string` -> `int`: returns the number of occurrences of the substring ,
    `'you are beautiful'.count('e')` -> `2`
* `to char codes` -> `list<int>`: a list containing all the chars as their codes,
    e.g. `'greeting'.toCharCodes()` -> `[103, 114, 101, 101, 116, 105, 110, 103]`
* `to uppercase` -> `string`: a string with all chars turned to uppercase counter parts,
    e.g. `'some text'.toUppercase()` -> `'SOME TEXT'`
* `to lowercase` -> `string`: a string with all chars turned to lowercase counter parts,
    e.g. `'Some Text'.toLowercase()` -> `'some text'`
* `to title` -> `string`: a string with all first letters of words in uppercase and the rest in lowercase,
    e.g. `'some text'.toTitle()` -> `'Some Text'`
* `to capitalised` -> `string`: a string with only the first letter capitalised
    e.g. `'some text'.toCapitalised()` -> `'Some text'`
* `is integer` -> `bool`: checks if the string can be an int, 
    e.g. `'1'.isInteger()` -> `true`,
    `'one'.isInteger()` -> `false`
* `is double` -> `bool`: checks if the string can be a double,
    e.g `'1'.isDouble()` -> `true`,
    `'1.3'.isDouble()` -> `true`,
    `'forty two point three four'.isDouble()` -> `false` 
* `is alpha` -> `bool`: checks if the string is all alphabetical chars,
    e.g. `'abc'.isAlpha()` -> `true`,
    `'1234'.isAlpha()` -> `false`,
    `'hello world'.isAlpha()` -> `false`
* `is punctuation` -> `bool`: checks if the string is all punctuation,
    `'.,<>'.isPunctuation()` -> `true`,
    `'abc; hello'.isPunctuation()` -> `false`
* `is whitespace` -> `bool`: checks if the string is all whitespace,
    e.g. `'\t  \t'.isWhitespace()` -> `true`,
    `'hello world'.isWhitespace()` -> `false`
* `ends with`, `string` -> `bool`: checks if the string ends with a substring,
    e.g. `'parrot.png'.endsWith('.png')` -> `true`
* `starts with`, `string` -> `bool`: checks if the string starts with a substring,
    e.g. `'behold'.startsWith('be')` -> `true`
* `contains`, `string` -> `bool`: checks if the string contains a substring,
    e.g. `'find a secret word in this string'.contains(' word ')` -> `true`

## Bool
A `true` or `false` value.

* `to int` -> `int`: returns `1` or `0`,
    e.g. `false.toInt()` -> `0`,
    `true.toInt()` -> `1`

## Int
An integer, a whole number, e.g. `4`

* `to double` -> `double`: returns the double representation of the integer,
    e.g. `7` -> `7.0`
* `to bool` -> `bool`: returns true if it is `1` or goreater,
    else if it is `0` it returns false  
* `is even` -> `bool`: returns true if the number is even,
    e.g. `4.isEven()` -> `true`
* `is odd` -> `bool`: returns the true if the number is odd,
    e.g. `6.isOdd()` -> `false`
* `is positive` -> `bool`: returns true if the number is more than `0`,
    e.g. `-8.isPositive()` -> `false`
* `is zero` -> `bool`: returns true is the number is `0`,
    `6.isZero()` -> `false`
* `is negative` -> `bool`: returns true if the number is less than `0`,
    e.g. `-1.isNegative()` -> `true`
* `absolute` -> `int`: returns the absolute value of the number,
    e.g. `7.absolute()` -> `7`,
    `-6.absolute()` -> `6`
* `to precision`, `int` -> `int`: returns a int to precision,
    with the precision of an absolute int,
    e.g. `1726.round(2)` -> `1700`,
    `12.round(1)` -> `10`,
* `round`, `int` -> `int`: rounds the int to the nearest int of precision,
    e.g. `137.round(1)` -> `140`,
    `1342.round(3)` -> `1000`
* `to radix string`, `int`: returns the string of the number with a base,
    (min: 2, max: 32),
    e.g. `7.toRadixString(2)` -> `'1100'`,
    `24.toRadixString(16)` -> `'18'`
* `power`, `double` -> `double`: returns the number to the power of **x**,
    e.g. `3.power(2)` -> `9.0`,
    `4.power(0.5)` -> `2`

## Double
A real number representation, e.g. my favourite dish `3.14`.

* `to precision`, `int` -> `double`: returns a double to precision,
    use negative numbers to round above the decimal point,
    e.g.`1726.73.toPrecision(-2)` -> `1700.0`,
    `12.672.toPrecision(0)` -> `12.0`,
    `3.74382.toPrecision(2)` -> `3.74`
* `round`, `int` -> `double`: rounds the double to the nearest double of precision,
    use negative numbers to round above the decimal point,
    e.g.`1791.73.round(-2)` -> `1800.0`,
    `12.672.round(0)` -> `13.0`,
    `3.74382.round(2)` -> `3.74`
* `absolute` -> `double`: returns the absolute value of the number,
    e.g. `-7.3232.absolute()` -> `7.3232`,
* `is positive` -> `bool`: returns true if the number is more than `0`,
    e.g. `-8.7376.isPositive()` -> `false`
* `is zero` -> `bool`: returns true is the number is `0`,
    `6.32323232.isZero()` -> `false`
* `is negative` -> `bool`: returns true if the number is less than `0`,
    e.g. `-1.23536.isNegative()` -> `true`
* `power`, `double` -> `double`: returns the number to the power of **x**,
    e.g. `3.5.power(2)` -> `12.25`
* `truncate to int` -> `int`: returns an in of the double truncated,
    e.g `6.9.truncateToInt()` -> `6`,
    `7.2.truncateToInt()` -> `7`
* `round to int` -> `int`: rounds the double to the nearest int,
    e.g. `6.7.roundToInt()` -> `7`,
    `6.4.roundToInt()` -> `6`

## list 
Holds a series of values in a preserved order
> unless stated, no methods change the original object

* `at position`, `int` -> `T`: returns the value at a specific index,
    negative integers are counted from the end
    e.g. `[1, 3, 5, 4].atPosition(-1)` -> `4`,
    `[9, 7, 4, 2].atPosition(2)` -> `4`
* `add`, *...*`T` -> `list<T>`: adds the element to the end of a new list,
    e.g. `[1, 2, 3].add(4)` -> `[1, 2, 3, 4]`
* `add all`, *...*`list<T>` -> `list<T>`: adds a list of the elements to the end of a new list,
    e.g. `[1, 2, 3].addAll([4, 5, 6])` -> `[1, 2, 3, 4, 5, 6]`
* `insert`, `int`, `T` -> `list<T>`: adds an element at a specific index,
    negative integers are counted from the end,
    (`list.insert(-1, x)` is not the same as `list.add(x)`),
    e.g. `[2, 3, 5].insert(0, 1).insert(-1, 4)` -> `[1, 2, 3, 4, 5]`
* `remove`, `T`, ?`int` -> `list<T>`: removes all instances of that element,
    unless a specific number is supplied,
    and returns a new list,
    e.g. `['john', 'james', 'jill'].remove('jill')` -> `['john', 'james']`
* `remove at`, `int` -> `list<T>`: removes the value at a specific index,
    and returns a new list,
    negative integers are counted from the end,
    e.g. `['a', 'b', 'c', 'd'].removeAt(-2)` -> `['a', 'b', 'd']`
* `pop`, ?`int` -> `T`?: returns the value at a specific index or default of 0,
    will also alter the list to remove the item,
    negative integers are counted from the end,
    e.g. `[1, 2, 3, 4].pop()` -> `[1]` and list looks like this `[2, 3, 4]`
* `map`, `function(T)<X>` -> `list<X>`: returns a list with all elements passing through a function,
    e.g. `[1, 2, 3, 4].map(def int (e): e**2)` -> `[1, 4, 9, 16]`
* `where`, `function(T)<bool>` -> `list<T>`: returns a list where all elements passed the function check,
    e.g `[-4, -7, 5, 6, 8].where(def bool (e): e.isPositive)` -> `[5, 6, 8]`
* `all`, `function(T)<bool>` -> `bool`: checks if all elements in the list pass the function's check,
    e.g. `[1, 2, 4, 8].all(def bool (e) => e.isPositive)` -> `true`
* `any`, `function(T)<bool>` -> `bool`: checks to see if any elements pass the function's check,
    e.g. `['john', 'bill', 'fred'].any(def bool (e) => e.startsWith('b'))` -> `true`
* `none`, `function(T)<bool>` -> `bool`: checks to see if none of the elements pass the function's check,
    e.g. `['jill', 'bob', 'harry'].none(def bool (e) => e == 'jenny')` -> `true`
* `unique`, ?`function(T)<N>`-> `list<T>`: returns a list with all unique elements in them,
    with an optional function to filter on a key,
    e.g. `[11, 3, 4, 2, 5, 3, 7, 3, 10, 11].unique()` -> `[11, 3, 4, 2, 5, 7, 10]`
* `join`, `string` -> `string`: returns a string of all elements in the list,
    e.g. `['hello', 'humans,', 'I', 'am', 'to', 'destroy', 'you'].join(' ')` -> `'hello humans, I am here to destroy you'`
* `sort`, ?`function(T, T)<int>` -> `list<T>`: sorts the list with optional function,
    and returns a new list,
    e.g `[1, 5, 9, -4, 2, 6, 11, 10].sort()` -> `[-4, 1, 2, 5, 6, 10, 11]`
* `shuffle` -> `list<T>`: returns the list in a random order,
    and returns a new list,
    e.g `[1, 2, 3, 5, 8, 12].shuffle()` -> `[8, 12, 3, 1, 2, 5]` (for example)
* `first` -> `T?`: returns the first element or null
    e.g. `['a',  'b', 'c'].first()` -> `a`
* `last` -> `T?`: returns the last element or null,
    e.g. `['x', 'y', 'z'].last()` -> `z`
* `sublist`, `int`, ?`int` -> `list<T>`: returns a list of the length,
    from the starting index,
    to ending index (the end of the list if not supplied),
    if the starting index is greater than the ending index then the list is sliced in a reversed order,
    the index can be negative and if they are they count from the end,
    e.g. `[6, 3, 2, 6, 1].sublist(-4, -1)` -> `[2, 3, 6, 1]`
* `reverse` -> `list<T>`: returns a new list in reversed order,
    e.g. `[1, 2, 3, 4, 5].reverse()` -> `[5, 4, 3, 2, 1]`
* `enumerate`, ?`int` -> `list<list<int, T>>`: returns the list with each element nested in a list with each index and starting value for the index incrementation,
    e.g. `['doe', 'tomato', 'basil', 'cheese'].enumerate()` -> `[[0, 'doe'], [1, 'tomato'], [2, 'basil'], [3, 'cheese']]`
* `toMap`, ?`int` -> `map<int, T>`: returns the list of maps with each index as a key for a value, for the index incrementation,
    e.g. `['doe', 'tomato', 'basil', 'cheese'].toMap(3)` -> `{3: 'doe', 4: 'tomato', 5: 'basil', 6: 'cheese'}`
* `clear` -> `list<T>`: removes all entries the list,
    this effects the list,
    `[1, 2, 4, 6].clear()` the list now looks like this `[]`
* `foreach`, `function(T)<void>` -> `void`: loops over each item in the array and performs a function on them,
    e.g. `[1, 2, 4, 8].foreach(def void (e) => print(e.toString()))` this would print each element
* `count`, `T` -> `int`: returns the number of occurrences of the item 
    `[1, 4, 6, 3, 7, 2, 6, 8, 3, 1, 4, 2].count(2)` -> `2`

## Map
Holds key value pairs, in a non specific order
> methods do not alter the original object

* `keys` -> `list<K>`: returns all the keys in the map,
    e.g. `{'base': 'tomato', 'cheese': 'mozzarella', 'topping': 'peperoni'}.keys()` -> `['base', 'cheese', 'topping']`
* `values` -> `list<V>`: returns all the values in the map ,
    e.g. `{'base': 'tomato', 'cheese': 'mozzarella', 'topping': 'peperoni'}.values()` -> `['tomato', 'mozzarella', 'peperoni']`
* `key values` -> `list<list<K, V>>`: returns all the key-value pairs in nested lists,
    e.g. `{'base': 'tomato', 'cheese': 'mozzarella', 'topping': 'peperoni'}.keyValues()` -> `[['base', 'tomato'], ['cheese', 'mozzarella'], ['topping', 'peperoni']]`
* `get`, `K`, ?`V` -> `V?`: returns the the value at the key and returns (the value, null, or a default of type `K`),
    .e.g `{'base': 'tomato', 'cheese': 'mozzarella', 'topping': 'peperoni'}.get('topping')` -> `'peperoni`,
    `{'base': 'tomato', 'cheese': 'mozzarella', 'topping': 'peperoni'}.get('gravy')` -> `null`,
    `{'base': 'tomato', 'cheese': 'mozzarella', 'topping': 'peperoni'}.get('jelly', 'no jelly')` -> `'no jelly'`
* `map`, `function(K1, V1)<map<K2, V2>>` -> `map<K2, V2>`: returns all the key-value as mapped from a function,
    e.g. `{'base': 'tomato', 'cheese': 'mozzarella', 'topping': 'peperoni'}.map(def map<string, string> (k, v) => {k.toCapitalised(): v.toUppercase()})` ->
    `{'Base': 'TOMATO', 'Cheese': 'MOZZARELLA', 'Topping': 'PEPERONI'}.keys()`
* `where`, `functions(K, V)<bool>` -> `map<K, V>`: returns all the key-value pairs that parse the function's check,
    e.g. `{'yellow': true, '4': false, '&': true}.where(def bool (k, v) => k.isInt())` -> `{'4': false}`
* `update`, `K`, `V` -> `map<K, V>`: updates a key in the map,
    or adds it if it does not exist,
    and returns a new map,
    e.g. `{'one': 1, 'two': 2, 'three': 3}.update('four', 4)` -> `{'one': 1, 'two': 2, 'three': 3, 'four': 4}`,
    `{'one': 1, 'two': 1, 'three': 3}.update('two', 2)` -> `{'one': 1, 'two': 2, 'three': 3}`
* `remove key`, `K` -> `map<K, V>`: removes a key-value pair by a key,
    and returns a new map,
    e.g. `{'one': 1, 'two': 2, 'three': 3}.removeKey('three')` -> `{'one': 1, 'two': 2}`
* `remove values`, `V` -> `map<K, V>`: removes all key-value pairs where the value is that supplied, and returns a new map
    e.g. `{'one': 1, 'two': 2, 'three': 3}.removeValue(1)` -> `{'two': 2, 'three': 3}`

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

when calling functions, parameters if big or small, will be cloned unless specified to pointers when called

```
const int a = 15
const int b = 20

// this for the function has cloned both a and b
final int result = add(a, b)

// instead, use the `#` to create immutable pointers, as trying to use `&` to create mutable ones wont work on `finals` and `constants`
final int result = add(#a, #b)

print('result is' $ result.toString())
```

### Protected and unprotected functions
protected functions can not be changed, where as unprotected can be.
the default is unprotected, and like objects once a functions has been given protection or not, arguments, and a returns type , it can not be changed.

```
def unprotected int add(int a, int b):
    int total = 0

    for i from 0 to a:
        total++
    
    for i form 0 to b:
        total++
    
    return total

// example
// redefining add to be more efficient and work with negatives
def add(int a, int b):
    return a + b

// make a new method for the string class
def protected void string.print():
    print(this)

var string message = 'hello world'
message.print()
```

## Operators
### Arithmetic (numbers)
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

### Strings
* `$` concatenation

### lists
* `...` spread

### Maps
* `***` key value spread

### Assignment
> on initialisations will require mutability and type

* `=` set equal to,
    e.g. `var int myNumber = 5`
* `.=` set equal to on a function,
    e.g. `raffleTickets .= shuffle()`
* `+=` set equal to an increment by,
    e.g. `myNumber += 3`
* `-=` set equal to and decrement by,
    e.g. `myNumber -= 12`
* `*=` set equal to and multiply by,
    e.g. `myNumber *= 3`
* `**=` set equal to a exponent result of,
    e.g. `myNumber **= 2`
* `/=` set equal to and divide by,
    e.g. `myNumber /= 9`
* `//=` set equal to and integer divide by,
    e.g. `myNumber //= 2`
* `%=` set equal to and modulus by,
    e.g. `myNumber %= 2`
* `?=` set equal to if equals `null`,
    e.g. `possiblyNullString ?= 'default'`
* `!!=` set equal to a not bitwise of,
    e.g. `a !!= b`
* `|=` set equal to an or bitwise of,
    e.g. `a ||= b`
* `^=` set equal to a bitwise xor of,
    e.g. `a ^= b`
* `&=` set equal to an and bitwise of,
    e.g. `a &= b`
* `$=` set equal to a concatenation of,
    e.g. `var string helloWorld = 'hello '; helloWorld $= 'world'`
* `...=` set equals of a spread and join of,
    e.g. `list1 ...= list2` identical result to `list1 .= addAll(list2)`
* `***=` set equals of a key value spread and join of,
    e.g. `map1 ***= map2` 

## Pointers
* `&` mutable pointer
* `#` immutable pointer

if a type starts if a pointer, you have to pass in the correct pointer type.
if the type starts with a `!` it means you can not pass in a pointer.

### Example
```
// the `&` before the first type says that the item must be a mutable pointer
// the lack of a pointer before the second type says you can pass in any matching type
def void addItemToList(&list<T> myList, T item):
    // clones the item
    myList .= add(item)

// the `&` before both types says that the item must be a mutable pointer
def void addPointedItemToList(&list<T> myList, &T item):
    myList .= add(&item)

var list<int> myItem = [1, 2, 3, 4]
var int newItem = 5
addItemToList(&myList, #newItem) 

// 5 -> 6
newItem++
print(myList.join(', '))
// prints: 1, 2, 3, 4, 5

// has to mutable as the function requires a mutable pointer in the body
addPointedItemToList(&myList, &newItem)
print(myList.join(', '))
// prints: 1, 2, 3, 4, 5, 6

// 6 -> 7
newItem++
print(myList.join(', '))
// prints: 1, 2, 3, 4, 5, 7

// '!' in front of the type indicates you must pass in a new object, an object that does not have a pointer to it
def int calculateHash(!string inputString):
    // inputString is guaranteed to be a cloned value,
    // no pointer can be passed in.
    return inputString.toCharCodes().join('').length

print(calculateHash('hello world').toString())
```

## Key words
* `for` the start of a for loop
* `from` the indicator of a starting value in a for loop
* `to` the indicator of an ending value in a for loop
* `step` the indicator of a the stepping value in a for loop
* `foreach` the start of a for each loop
* `in` the indicator of the split for iteration and the iterable
* `while` the start of a while loop

* `if` to start of an if statement
* `else` the end of an if statement

* `any` the any type
* `string` the string type
* `bool` the bool type
* `int` the int type
* `double` the double type
* `list` the list type
* `map` the map type
* `function` the type of a function
* `type` the type type

* `null` the instance of nothing, also is not a type

* `def` the keyword for defining a function
* `void` the keyword for a no returning function

* `true` the value of true
* `false` the value of false

* `import` imports a module
    - pre-fix with `gore:` for a built in

