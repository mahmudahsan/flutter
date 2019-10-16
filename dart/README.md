# Dart Language

- [Setup](#setup) | [Official](https://dart.dev/get-dart)
- [Features](#features)
- [Data Types](#data-types)
  - [Types in Function](#types-in-function)
  - [String](#string)
  - [Types Conversion](#types-conversion)
  - [Constant Values](#constant-values)
- [Comments](#comments)
- [null object](#null-object)
- [Operators](#operators)
  - [Null Aware Operator](#null-aware-operator)
  - [Conditional Statement](#conditional-statement)
  - [Ternary Operator](#ternary-operator)
  - [Type Test](#type-test)
  - [Cascade notation (..)](#casecade-notation)
- [Conditional Statement](#conditional-statement)
- [Loop](#loop)
- [Collection](#collection)
  - [List](#list)
  - [Spread Operator ...](#spread-operator)
  - [Null Aware Spread Operator ...?](#null-aware-spread-operator)
  - [Collection if and collection for](#collection-if-and-collection-for)
  - [Set](#set)
  - [Maps](#maps)
- [Function](#function)
  - [Arrow Function](#arrow-function)
  - [Anonymous Function](#anonymous-function)
  - [Parameter](#parameter)
- [Generators](#generators)
- [Class](#class)
  - [Final and Const](#final-and-const)
  - [Class Inheritance](#class-inheritance)
  - [Method Overriding](#method-overriding)
  - [Getters and Setters](#getters-and-setters)
  - [Abstract methods](#abstract-methods)
  - [Abstract classes](#abstract-classes)
  - [Mixins](#mixins)
  - [Class variables](#class-variables)
  - [Static methods](#static-methods)
- [Enum](#enum)
- [Lexical Scope](#lexical-scope)
- [Closure](#lexical-closure)
- [Assert](#assert)
- [Exception Handling](#exception-handling)
- [Generics](#generics)
- [Mixin](#mixin)
- [Asynchronous Programming](#asynchronous-programming)
  - [Futures](#futures)
  - [Streams](#streams)
- [Regular Expression](#regular-expression)
- [File IO](#file-io)


### Setup

Setup in Mac
```shell
brew tap dart-lang/dart
brew install dart
```

Upgrade in Mac
```shell
brew upgrade dart
```

#### Running Dart Code in Terminal

```dart
dart filename.dart
```

###  Features

Dart is a strictly typed programming language. It supports both AOT (Ahead of time) and JIT (Just In Time) compilation. It is a compiled programming language and can also transpile the code into JavaScript.

JIT compilation is used during development, using a compiler that is especially fast. Then, when an app is ready for release, it is compiled AOT. 

Dart can deliver the best of both worlds: extremely fast development cycles, and fast execution and startup times.

- `dart:core` library contains built-in types, collections, and other core functionality for every Dart program.
- `dart:core` library automatically imports to every Dart program.
- `Dart` is a single thread programming language like 'JavaScript'

#### Code Samples

```dart
void main() {
  var firstName = 'Mahmud'; // String type inference
  String lastName = 'Ahsan'; // String type defined
  int number = 100; // integer type
  double cost = 11.40;
  dynamic isOkay = true; // dynamic type can holds any type

  print(firstName + ' ' + lastName);
  print(number);
  print(cost);
  print(isOkay);
}
```

- `main()` is the entry point
- `dart` supports type inference and type defined
- `void` means this function doesn't return any value. And it is optional

#### Importing package and take input from user

```dart
import 'dart:io';

void main() {
  stdout.writeln('What is your name: ?');
  String name = stdin.readLineSync();
  print('My name is: $name');
}
```

#### `Dart` Language Common Features:

- Everything you can place in a variable is an object, and every object is an instance of a class. Even numbers, functions, and null are objects. 
- All objects inherit from the `Object` class.
- Static typed language. Can not assign integer value to String type etc.
- Dart supports generic types, like `List<int>` (a list of integers) or `List<dynamic>` (a list of objects of any type).
- Unlike Java, Dart doesn’t have the keywords `public`, `protected`, and `private`
- ( ; ) Semicolon is mandatory to the end of statements

****Strongly Typed Language:**** The type of a variable is known at ***compile time***. For example: `C++`, `Java`, `Swift`

****Dynamic Typed Language:**** The type of a variable is known at ***run time.*** For example: `Python`, `Ruby`, `JavaScript`.

### Data Types

#### Simple or Primitive Data Types

- `int`
- `double`
- `String`
- `bool`
- `dynamic`

```dart
main() {
  int amount1 = 100;
  var amount2 = 200;

  print('Amount1: $amount1 | Amount2: $amount2 \n');

  double dAmount1 = 100.11;
  var dAmount2    = 200.22;

  print('dAmount1: $dAmount1 | dAmount2: $dAmount2 \n');

  String name1 = 'Mahmud';
  var name2    = 'Ahsan';

  print('My name is: $name1 $name2 \n');

  bool isItTrue1 = true;
  var isItTrue2  = false;
  
  print('isItTrue1: $isItTrue1 | isItTrue2: $isItTrue2 \n');

  dynamic weakVariable = 100;
  print('WeakVariable 1: $weakVariable \n');

  weakVariable = 'Dart Programming';
  print('WeakVariable 2: $weakVariable');
}
```

**Both `int` and `double` are subtypes of `num`. 
The num type includes basic operators such as +, -, /, and * etc.**

**If we declare a variable as `String` we have to put only `String` value within it.**

##### We can not put one type to another static type.

- We can define type when declare something or we can let it to the compiler to decide the type.

- Here names is `String` type by type inference. 

- And ages is `int` type as we defined it.
```dart
void main() {
  var name = 'Jack'; // type inference made this as String
  print(name);

  name = 100; // Will show error here
  print(name);

  int age = 30;
  print(age);
}
```

##### We can put any data on a dynamic type variable

```dart
void main() {
  var weakType; // dynamic

  weakType = 'Jack';
  print(weakType);

  weakType = 100;
  print(weakType);
}
```

#### Tips 
 
- Best to ***avoid*** `var` and `dynamic` type to get advantage of type-safe language. It will create less error.

### Types in Function

Here we first defined a `square` function that take integer and return integer value after multiplication.

`doubleSquare` function takes `double` value and returns a `double` value type.

`dynamicSquare` function is dynamic and in this case best as we can pass both `int` and `double` value. And it returns result based on calculation. So if the result is integer it returns `int` and if result is `double` it returns `double`.

```dart
void main() {
  print(square(5));
  print(doubleSquare(5.5));

  print(dynamicSquare(5));
  print(dynamicSquare(5.5));
}

int square(int n) {
  return n * n;
}

double doubleSquare(double d) {
  return d * d;
}

dynamic dynamicSquare(dynamic val) {
  return val * val;
}
```

#### String

A Dart string is a sequence of UTF-16 code units.

```dart
var s1 = 'Single quotes work well for string literals.';
var s2 = "Double quotes work just as well.";
var s3 = 'It\'s easy to escape the string delimiter.';
var s4 = "It's even easier to use the other delimiter.";
```

You can create a “raw” string by prefixing it with r:

```dart
var s = r'In a raw string, not even \n gets special treatment.';
```

**String interpolation**

```dart
var age = 35;
var str = 'My age is: $age';
print(str);
```

**Multiline String**
```dart
var s1 = '''
You can create
multi-line strings like this one.
''';

var s2 = """This is also a
multi-line string.""";
```

### Types Conversion

Here’s how you turn a string into a number, or vice versa:

```dart
// String -> int
var one = int.parse('1');
assert(one == 1);

// String -> double
var onePointOne = double.parse('1.1');
assert(onePointOne == 1.1);

// int -> String
String oneAsString = 1.toString();
assert(oneAsString == '1');

// double -> String
String piAsString = 3.14159.toStringAsFixed(2);
assert(piAsString == '3.14');
```

### Constant Values

```dart
  const aConstNum = 0; // int constant
  const aConstBool = true; // bool constant 
  const aConstString = 'a constant string'; // string constant

  print(aConstNum);
  print(aConstBool);
  print(aConstString);

  print(aConstNum.runtimeType);
  print(aConstBool.runtimeType);
  print(aConstString.runtimeType);
```


### Comments

```dart
// In-line comment
/*
Block comment
*/

/// Documentation
```

### null object

If a variable is declared but didn't assign with any value, it contains `null` object.

```dart
void main() {
  int num;
  print(num); // output: null
}
```

### Operators

Same like JavaScript language. All the standard operators will work here.

```dart
void main() {
  int num = 10 + 22;
  num = num - 2;

  print(num);

  num = num % 5;
  print(num);

  // relational ==, !=, >=, <=
  if (num == 0) {
    print('Zero');
  }

  num = 100;
  num *= 2;
  print(num);

  // unary operator
  ++num;
  num++;
  num += 1;
  num -= 1;
  print(num);

  // logical && and logical ||
  if (num > 200 && num < 203) {
    print('200 to 202');
  }

  // != Not Equal
  if (num != 100) {
    print('num is not equal to 100');
  }
}
```

### Null Aware Operator

#### `(?.), (??), (??=)`

It is like `Swift` programming language's `optional (?:)` operator. It means, if the object is null then do nothing.

```dart
class Num {
  int num = 10;
}

void main () {
  var n = Num();
  int number;
  
  // we can check null by this
  if (n != null ){
    number = n.num;
  }
  print(number);
}
```

Or, we can use `Null Aware (?.)` operator to skip the `if..else` condition.

So in this case, if n object is `null` it will not crash.

```dart
void main () {
  var n = Num();
  int number;
  
  number = n?.num; // null aware
  print(number);
}
```

#### Code will Crash 

```dart
void main () {
  var n;
  int number;
  
  number = n.num; // no null checking
  print(number);
}
```

#### Safe Code if null comes (?.)

```dart
void main () {
  var n;
  int number;
  
  number = n?.num; // null checking
  print(number); // output: null
}
```
#### null aware variation two (??)

If an object is `null` and we want a `default value` for that we can follow `??` operator.

```dart
class Num {
  int num = 10
}

void main () {
  var n = Num();
  int number;
  
  number = n?.num ?? 18; // default value
  print(number);
}
```

#### null aware variation three (??=)

If the corresponding object is null, then it assigned the value to that object.

```dart
void main() {
  int number;
  number ??= 100;
  print(number);
}
```

#### Ternary Operator

Same like `JavaScript` language `?:` 

```dart
int x = 100;
var result = x % 2 == 0 ? 'Even' :'Odd';
print(result);
```


### Type Test
`as` for type casting
`is` for True if the object has the specified type
`!is` False if the object has the specified type

```dart
if (emp is Person) {
  // Type check
  emp.firstName = 'Bob';
}

(emp as Person).firstName = 'Bob';

```

### Cascade notation
**(..)**
Cascades (..) allow you to make a sequence of operations on the same object.

```dart
querySelector('#confirm') // Get an object.
  ..text = 'Confirm' // Use its members.
  ..classes.add('important')
  ..onClick.listen((e) => window.alert('Confirmed!'));
```

The first method call, `querySelector()`, returns a `selector` object. The code that follows the cascade notation operates on this selector object, ignoring any subsequent values that might be returned.

The previous example is equivalent to:

### Conditional Statement

#### if..else if..else

Same like `JavaScript` language.

```dart
int number = 100;

if (number % 2 == 0) {
  print('Even');
}
else if (number % 3 == 0) {
  print('Odd');
}
else {
  print('Confused');
}
```
#### Switch statement
Same like `JavaScript` language.

```dart
int number = 1;

switch(number) {
  case 0:
    print('Even');
    break;
  case 1:
    print('Odd');
    break;
  default:
    print('Confused');
}
```

### Loop

Same like `JavaScript` language

1. **Standard for loop**
```dart
for (var i = 0; i < 10; ++i) {
  print(i);
}
```

2. **for-in loop**
```dart
var numbers = [1, 2, 3];

for (var n in numbers) {
  print(n);
}
```

3. **forEach loop**

Here inside `forEach` method we provide a function. Thus `forEach` is a higher order function. Also in this first example, within `forEach` we are using `anonymous` function.

```dart
var numbers = [1, 2, 3];
  
numbers.forEach((num) => print(num));
```

we can rewrite this `forEach` by another way:

```dart
void main() {
  var numbers = [1, 2, 3];

  numbers.forEach(printNum);
}

void printNum(num) {
  print(num);
}
```

4. **While loop**

```dart
  int num = 5;

  while (num > 0){ 
    print(num);
    num -= 1;
  }
```

5. **do-while loop**

```dart
  int num = 5;

  do {
    print(num);
    num -= 1;
  } while(num > 0);
```

6. **Break and Continue**

```dart
void main() {
  for (var i = 0; i < 10; ++i) {
    if (i > 5) break;
    print(i);
  }

  for (var i = 0; i < 10; ++i) {
    if (i % 2 == 0) continue;
    print("Odd: $i");
  }
}
```

### Collection

#### List

```dart
void main() {
  List names = ['Jack', 'Jill'];
  print(names.length);
  for (var n in names) {
    print(n);
  }

  List <int> ages = [18, 20, 33];
  for (var a in ages) {
    print(a);
  }
}
```

To create a list that’s a compile-time constant, add const before the list literal:

```dart
var constantList = const [1, 2, 3];
// constantList[1] = 1; // Uncommenting this causes an error.
```

### Spread Operator
Dart 2.3 introduced the spread operator (...). For example, you can use the spread operator (...) to insert all the elements of a list into another list:

```dart
var list = [1, 2, 3];
var list2 = [0, ...list];
assert(list2.length == 4);
```
### Null Aware Spread Operator

Dart 2.3 introduced  null-aware spread operator (...?). 
If the expression to the right of the spread operator might be null, you can avoid exceptions by using a null-aware spread operator (...?):

```dart
var list;
var list2 = [0, ...?list];
assert(list2.length == 1);
```

### Collection if and collection for
Dart 2.3 also introduced collection if and collection for, which you can use to build collections using conditionals (if) and repetition (for).

Here’s an example of using collection if to create a list with three or four items in it:

```dart
var nav = [
  'Home',
  'Furniture',
  'Plants',
  if (promoActive) 'Outlet'
];
```

Here’s an example of using collection for to manipulate the items of a list before adding them to another list:

```dart
var listOfInts = [1, 2, 3];
var listOfStrings = [
  '#0',
  for (var i in listOfInts) '#$i'
];
assert(listOfStrings[1] == '#1');
```

#### Set
A set in Dart is an unordered collection of unique items. Dart support for sets is provided by set literals and the Set type.

```dart
// Here is a simple Dart set, created using a set literal:  
var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
```

To create an empty set, use {} preceded by a type argument, or assign {} to a variable of type Set:

```dart
var names = <String>{};
// Set<String> names = {}; // This works, too.
// var names = {}; // Creates a map, not a set.

```

- Add items to an existing set using the add() or addAll() methods
- Use .length to get the number of items in the set

```dart
var elements = <String>{};
elements.add('fluorine');
elements.addAll(halogens);
```

**As of Dart 2.3, sets support spread operators (... and ...?) and collection ifs and fors, just like lists do.**

### Maps

```dart
// Dart infers that gifts has the type Map<String, String> and nobleGases has the type Map<int, String>.
var gifts = {
  // Key:    Value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 'golden rings'
};

var nobleGases = {
  2: 'helium',
  10: 'neon',
  18: 'argon',
};

// You can create the same objects using a Map constructor:

var gifts = Map();
gifts['first'] = 'partridge';
gifts['second'] = 'turtledoves';
gifts['fifth'] = 'golden rings';

var nobleGases = Map();
nobleGases[2] = 'helium';
nobleGases[10] = 'neon';
nobleGases[18] = 'argon';
```

**If you look for a key that isn’t in a map, you get a null in return:**

```dart
var gifts = {'first': 'partridge'};
assert(gifts['fifth'] == null);
```

***To create a map that’s a compile-time constant, add const before the map literal:***

```dart
final constantMap = const {
  2: 'helium',
  10: 'neon',
  18: 'argon',
};

// constantMap[2] = 'Helium'; // Uncommenting this causes an error.
```

### Function

- Each `function` is an object of class `Function`
- Each `function` if returns something should have a `return type`. Otherwise it will return `void`

Some examples:
```dart
void main() {
  showOutput(square(2));
  showOutput(square(2.5));
}

void showOutput(var msg) {
  print(msg);
}

dynamic square(var num) {
  return num * num;
}
```

### Arrow Function
#### Fat Arrow Expression => or Arrow Function

For one expression within a function we can use the shorthand syntax called **Fat Arrow** `=>`. And it implicitly returns the value after `=>`. It's somewhat similar to `JavaScript Arrow Function`.

we can redefine the above `square` function by this:
```dart
dynamic square(var num) => num * num;
```

#### Anonymous Function

- A nameless function called an anonymous function, or sometimes a lambda or closure. 

The following example defines an anonymous function with an untyped parameter, item. The function, invoked for each item in the list, prints a string that includes the value at the specified index.

```dart
var list = ['apples', 'bananas', 'oranges'];
list.forEach((item) {
  print('${list.indexOf(item)}: $item');
});
```

### Parameter
#### Positional and Named Parameter

Positional arguments works like other language starting from left.

```dart
void main() {
  print(sum(2, 2));
}

dynamic sum(var num1, var num2) => num1 + num2;

```

For Named parameter, whe have to use `{}` outside the named parameter within a function signature.

```dart
void main() {
  print(sumName(num1: 2, num2: 2));
}

dynamic sumName({var num1, var num2}) => num1 + num2;
```

We can also mix positional and named parameter.

By default, `named parameter` is optional. So we can use null aware operator to check this optional argument.

```dart
void main() {
  print(sum(2, num2: 2));
  print(sum(2));
}

dynamic sum(var num1, {var num2}) => num1 + ( num2 ?? 0 );
```

**You can annotate a named parameter in any Dart code (not just Flutter) with `@required` to indicate that it is a required parameter.**

```dart
const Scrollbar({Key key, @required Widget child})
```

Required is defined in the meta package. Either import package:meta/meta.dart directly, or import another package that exports meta, such as Flutter’s package:flutter/material.dart.



**Positional Optional Parameter**

We have to use square bracket around positional optional parameter. That's it.

So we use the above example redefined below:
```dart
void main() {
  print(sum(2, 2));
  print(sum(2));
}

dynamic sum(var num1, [var num2]) => num1 + ( num2 ?? 0 );
```

##### Default parameter value

To provide default value on parameter it has to be declared either `positional optional` or `named optional` and after `=` sign need to provide default value.

```dart
void main() {
  print(isAdult(1));
  print(isAdult());
}

bool isAdult([int age = 18]) => age >= 18;
```

### Generators

To produce a sequence of values lazily we can use generator function.

Dart supports two kinds of generator functions:
1. Synchronous generator - returns an iterable object
2. Asynchronous generator - returns a stream object

* An iterable object is a collection of values can be accessed sequentially.
* A stream object represents an asynchronous data events.


##### Synchronous Generator:

- Mark the function body as `sync*` and use `yield` to deliver value

```dart
import 'dart:io';

Iterable<int> countStream(int max) sync * {
  for (int i = 0; i < max; ++i) {
    yield i;
    sleep(Duration(seconds: 1));
  }
}

void main() {
  print('start');
  countStream(5).forEach((data){
    print(data);
  });
  print('end');
}
```

##### Asynchronous Generator:

- Mark the function body as `async*` and use `yield` to deliver value

```dart
import 'dart:io';

Stream<int> countStream(int max) async * {
  for (int i = 0; i < max; ++i) {
    yield i;
    sleep(Duration(seconds: 1));
  }
}

void main() {
  print('start');
  countStream(5).listen((data){
    print(data);
  },
  onDone: (){
    print("Done");
  });
  print('end');
}
```

> When we have to use function call to produce value in yield we have to use `yield*`

```dart
Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
  }
}
```

### Class

- `Object` class from `dart:core` library is the base class of all object type in dart programming.
- Use `this` when there is a name conflict
- A `default constructor` is the same name of Class name
- A `named constructor` is used to implement multiple constructors for a class or to provide extra clarity

A blank class with Constructor, properties and methods. 

```dart
class Person {
  String name;
  int age;

  // default constructor
  Person(String name, [int age = 18]) {
    this.name = name;
    this.age = age;
  }

  // named constructor
  Person.guest() {
    name = 'Guest';
    age = 18;
  }

  void showOutput() {
    print('Name: ${this.name}');
    print('Age: ${this.age}');
  }
}

void main() {
  var person1 = Person('Jack');
  Person person2 = Person('Jill', 15);

  person1.showOutput();
  person2.showOutput();

  var person3 = Person.guest();
  person3.showOutput();
}
```
**Output**
```
Name: Jack
Age: 18
Name: Jill
Age: 15
```

Using syntactic sugar we can use write a shorter default constructor like this way.

`Dart` automatically assign same named arguments to the same named properties.

If we want, we can use automatically assign with other functionality inside default constructor like example `Vehicle`.

```dart
class Person {
  String name;
  int age;

  Person(this.name, [this.age = 18]);
}

class Vehicle {
  String model;
  int year;

  Vehicle(this.model, this.year) {
    print(this.model);
    print(this.year);
  }
}
```

### Final and Const

`final` and `const` when used before defining any variable can not reassign. 
- But `final` variable if declared in class without value must have to assigned in the `constructor()` method 

```dart
final String person1 = 'Jack';
const String person2 = 'Jill'; // compile time constant

print(person1);
print(person2);

// can not reassign
// person1 = 'aa';
// person2 = 'bb';
```

- Instance variables can be `final` 
- Instance variable can be `static const`

```dart
class X {
  final name; // type will be defined by inferred value
  static const int age = 10;
  
  X(this.name);
}

main() {
  var x = X('Jack');
  print(x.name);
  print(X.age); // use Classname.StaticVariable
}
```

### Class Inheritance

Use `extends` to create a subclass, and `super` to refer to the superclass:

```dart
class Vehicle {
  String model;
  int year;

  Vehicle(this.model, this.year) {
    print(this.model);
    print(this.year);
  }

  void showOutput(){
    print(model);
    print(year);
  }
}

class Car extends Vehicle {
  double price;

  Car(String model, int year, this.price) : super(model, year);

  void showOutput() {
    super.showOutput();
    print(this.price);
  }
}

void main() {
  var car1 = Car('Accord', 2014, 150000);
  car1.showOutput();
}
```

### Method Overriding

#### The annotation `@override` marks an instance member as overriding a superclass member with the same name. But it is optional.

- The intent of the `@override` notation is to catch situations where a superclass renames a member, and an independent subclass which used to override the member, could silently continue working using the superclass implementation.
- Use `@override` when you don't have control of superclass `method` implementation

```dart
class X {
  String name;
  
  X(this.name);
  
  void showOutput() {
    print(this.name);
  }
  
  dynamic square(dynamic val) {
    return val * val;
  }
}

class Y extends X {
  Y(String name) : super(name);
  
  @override
  void showOutput() {
    print(this.name);
    print('Hello');
  }
  
  // not using @override at this time
  dynamic square(dynamic val) {
    return val * val + 2;
  }
}

void main() {
  var obj = Y('Jack');
  obj.showOutput();
  print(obj.square(2));
}
```

### Getters and Setters

 - Getters and setters are special methods that provide read and write access to an object’s properties. 
 - Each instance variable has an `implicit getter`, plus a `setter` if appropriate. 
 - You can create additional properties by implementing getters and setters, using the `get` and `set` keywords

 ```dart
 class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom.
  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}

void main() {
  var rect = Rectangle(3, 4, 20, 15);
  assert(rect.left == 3);
  rect.right = 12;
  assert(rect.left == -8);
}
```
#### Abstract methods
Instance, getter, and setter methods can be abstract, defining an interface but leaving its implementation up to other classes. Abstract methods can only exist in abstract classes.

```dart
abstract class Doer {
  // Define instance variables and methods...

  void doSomething(); // Define an abstract method.
}

class EffectiveDoer extends Doer {
  void doSomething() {
    // Provide an implementation, so the method is not abstract here...
  }
}
```

#### Abstract classes 

Use the abstract modifier to define an abstract class—a class that can’t be instantiated. Abstract classes are useful for defining interfaces

```dart
// This class is declared abstract and thus
// can't be instantiated.
abstract class AbstractContainer {
  // Define constructors, fields, methods...

  void updateChildren(); // Abstract method.
}
```

##### Polymorphism

```dart
// Abstract Class and Abstract Method

abstract class Human {
  String _type;
  
  void showType();
}

class Man extends Human {
  Man(String type){
    _type = type;
  }
  void showType() {
    print(_type);
  }
}

class Woman extends Human {
  Woman(String type){
    _type = type;
  }

  void showType() {
    print(_type);
  }
}

void main() {
  // polymorphism
  Human human;
  Man person1 = Man('man');
  Woman person2 = Woman('woman');

  human = person1;
  human.showType();

  human = person2;
  human.showType();
}
```

#### Mixins

In `Dart` language, there is only **Single Inheritance**. To share functionalities between classes we can use `mixins`. 

> Mixins are a way of reusing a class’s code in multiple class hierarchies.

To use a mixin, use the `with` keyword followed by one or more mixin names.

- Adding features to a class: mixins

```dart
// Mixins

class Robot {
  void perform(){
    print("Performing");
  }
}

mixin Walk {
  void perform(){
    print("Walking");
  }
}

mixin Run {
  void perform(){
    print("Running");
  }
}

class IRobo extends Robot with Walk, Run {
  void showActivity(){
    perform();
  }
}

void main() {
  IRobo robo = IRobo();
  robo.showActivity();
}
```

#### Another Example of Mixins

```dart
mixin CanFly {
  void fly(String name) {
    print('$name flying');
  }
}

mixin CanDrive {
  void drive(String name) {
    print('$name driving');
  }
}

class Car with CanDrive {

}

class Helicopter with CanFly, CanDrive {
  void perform(String name) {
    fly(name);
    drive(name);
  }
}

void main() {
  Car car = Car();
  car.drive('car');

  Helicopter helicopter = Helicopter();
  helicopter.perform('helicopter');
}
```

#### Class variables

- Use the `static` keyword to implement class-wide variables and methods.
- Static variables aren’t initialized until they’re used

```dart
class Queue {
  static const initialCapacity = 16;
  // ···
}

void main() {
  assert(Queue.initialCapacity == 16);
}
```

#### Static methods

- Static methods (class methods) do not operate on an instance, and thus do not have access to this

```dart
import 'dart:math';

class Point {
  num x, y;
  Point(this.x, this.y);

  static num distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
}

void main() {
  var a = Point(2, 2);
  var b = Point(4, 4);
  var distance = Point.distanceBetween(a, b);
  assert(2.8 < distance && distance < 2.9);
  print(distance);
}
```

### Enum

Enum type defines a set of named constants. Each value in an enum has an index getter, which returns the zero-based position of the value in the enum declaration. For example, the first value has index 0, and the second value has index 1.

```dart
enum Color {
  red,
  green,
  blue,
}

void main() {
  var color = Color.red;

  if (color == Color.red) {
    print('Red');
  }
}
```

### Lexical Scope

Dart is a lexically scoped language, which means that the scope of variables is determined statically, simply by the layout of the code. You can “follow the curly braces outwards” to see if a variable is in scope.

Here is an example of nested functions with variables at each scope level:

```dart
bool topLevel = true;

void main() {
  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  }
}
```
Notice how nestedFunction() can use variables from every level, all the way up to the top level

### Lexical Closure

- A closure is a function object that has access to variables in its lexical scope, even when the function is used outside of its original scope.
- Functions can close over variables defined in surrounding scopes.

```dart
// Function type, dynamic also works
Function makeAdder(int initial) {
  int total = initial;

  // nested function
  int addToTotal(int addBy) {
    total += addBy;
    return total;
  }

  return addToTotal;
}

void main() {
  var adder = makeAdder(2);
  var val = adder(5);
  print(val);

  val = adder(3);
  print(val);
}
```
Output:
```
7
10
```

### Assert

`assert` is commonly used to check a condition and if the condition is false it terminates the execution of the program

In `dart` `assert` only works in development mode not in production code. And Flutter enables `assert` only in `debug` mode.

```dart
// Make sure the variable has a non-null value.
assert(text != null);

// Make sure the value is less than 100.
assert(number < 100);

// Make sure this is an https URL.
assert(urlString.startsWith('https'));
```

To enable assert in Dart you have to run the following command
```
dart --enable-asserts FILENAME.dart 
```
Normally in Flutter, `assert` is automatically enabled in the debug mode.

### Exception Handling

- To `throw` error use `throw` or `rethrow` keywords
- To `catch` error follow the example
- `finally` block is optional and runs everytime

```dart
int mustGreaterThanZero(int val) {
  if (val <= 0) {
    throw Exception('Value must be greater than zero');
  }
  return val;
}

void letVerifyTheValue(var val) {
  var valueVerification;

  try {
    valueVerification = mustGreaterThanZero(val);
  }
  catch(e) {
    print(e);
  }
  finally {
    if (valueVerification == null) {
      print('Value is not accepted');
    }
    else {
      print('Value verified: $valueVerification');
    }
  }
}

void main() {
  letVerifyTheValue(10);
  // letVerifyTheValue(0);
}
```

Output:
```
Value verified: 10
Exception: Value must be greater than zero
Value is not accepted
```

- To catch a particular exception type follow this

```dart
try {
  breedMoreLlamas();
} on OutOfLlamasException {
  // A specific exception
  buyMoreLlamas();
} on Exception catch (e) {
  // Anything else that is an exception
  print('Unknown exception: $e');
} catch (e) {
  // No specified type, handles all
  print('Something really unknown: $e');
}
```

### Generics

Generics are often required for type safety, but they have more benefits than just allowing your code to run:

- Properly specifying generic types results in better generated code
- You can use generics to reduce code duplication.

If you intend for a list to contain only strings, you can declare it as List<String> (read that as “list of string”). That way you, your fellow programmers, and your tools can detect that assigning a non-string to the list is probably a mistake. Here’s an example:

```dart
var names = List<String>();
names.addAll(['Seth', 'Kathy', 'Lars']);
names.add(42); // Error
```

### Asynchronous Programming

Asynchronous programming in Dart is characterized by the Future and Stream classes.

#### futures

- `Dart` code is single threaded
- `Future<T>` object represents result of asynchronous operation which produces a result of type `T`. If the result is not usable value, then the future's type is `Future<void>`. 
- A `Future` represents a single value either a data or an error asynchronously


**Two** ways to handle `Future`
1. Using the `Future` API
2. Using the `async` and `await` operations


> `Future` example with `callback` passing in `then`

> Use `catchError` for to catch any error

```dart
Future delayedPrint(int seconds, String msg) {
  final duration = Duration(seconds: seconds);
  return Future.delayed(duration).then((value) => msg);
}

main() {
  print('Life');
  delayedPrint(2, "Is").then((status) {
    print(status);
  }).catchError((err) => print(err));
  print('Good');
}

```

Output
```
Life
Good
Is
```

Asynchronous operation with Synchronous fashion

```dart
Future delayedPrint(int seconds, String msg) {
  final duration = Duration(seconds: seconds);
  return Future.delayed(duration).then((value) => msg);
}

main() async {
  print('Life');
  await delayedPrint(2, "Is").then((status){
    print(status);
  });
  print('Good');
}
```

Output

```
Life
Is
Good
```

> We can also use `try..catch` block to catch error for asynchronous operation.

**Another Example**

When `task3()` depends on `task2()`

```dart
void task1() {
  print('Task 1 Done.');
}

Future <String> task2() async {
  Duration duration = Duration(seconds: 2);
  
  String result;

  await Future.delayed(duration, () {
    print('Task 2 Done.');
    result = ' Task 2 Data';
  });

  return result;
}

void task3(String result) {
  print('Task 3 Done. $result');
}

void main() async {
  task1();
  String result = await task2();
  task3(result);
}
```

#### Streams

A `Stream` is a sequence of asynchronous events. Unlike `future` a stream notify if there is an event is ready.

- `Stream` is similar like `Future`
- `Stream` delivers zero or more than zero values or errors over time
- To create `Stream` use `StreamController` class
- By default, `Stream` are setup for single subscription. So two listen will not work.
- For multiple listeners, use `.asBroadcastStream()` method

Let's create a `Stream` of `RandomNumber`

```dart
import 'dart:async';
import 'dart:math' as Math;

class RandomNumber {
  final StreamController _controller = StreamController<int>();
  int _count = Math.Random().nextInt(100);
  int times = 0;

  RandomNumber() {
    Timer.periodic(Duration(seconds: 1), (timer){
      _controller.sink.add(_count);
      _count = Math.Random().nextInt(100);
      times += 1;

      if (times > 5) {
        timer.cancel();
        _controller.sink.close();
      }
    });
  }

  Stream<int> get stream => _controller.stream;
}
```

To listen the change of stream:
```dart
void main() {
  final randomNumStream = RandomNumber().stream;

  final subscription = randomNumStream.listen(
    (data){
      print('Data: $data');
    },
    onError: (err) {
      print('Error: $err');
    },
    cancelOnError: false,
    onDone: (){
      print('Done');
    }
  );
}
```

For broadcasting:
```dart
void main() {
  final broadCastRandomNumStream = RandomNumber().stream.asBroadcastStream();

  final sub1 = broadCastRandomNumStream.listen(printData);
  final sub2 = broadCastRandomNumStream.listen(printData);
}

void printData(data){
  print('Data: $data');
}
```

##### Another Stream Example

In this case, we are using Generator function and `yield` keyword to put the values in the stream

```dart
import 'dart:io';

Stream<int> countStream(int max) async * {
  for (int i = 0; i < max; ++i) {
    yield i;
    sleep(Duration(seconds: 1));
  }
}

void main() {
  print('start');
  countStream(5).listen((data){
    print(data);
  },
  onDone: (){
    print("Done");
  });
  print('end');
}
```
Output:

```
start
end
0
1
2
3
4
Done
```

### Regular Expression

Dart regular expressions have the same syntax and semantics as JavaScript regular expressions.

```
void main() {
  RegExp exp = RegExp(r"(\w+)");
  String str = "Focus What Matters!";
  Iterable<RegExpMatch> matches = exp.allMatches(str);
  matches.forEach((match) {
    print(str.substring(match.start, match.end));
  });
}
```
Output:
```
Focus
What
Matters
```

### File IO

Reading a file
```dart
// File Reading

import 'dart:io';

void main() async {
  File file = File('data.txt');
  var contents = await file.readAsString();
  print(contents);
}
```

Writing a new file

```dart
import 'dart:io';

void main() async {
  File file = File('hello.txt');
  var contents = await file.writeAsString('Life is Good!\n\nI love programming');
}
```