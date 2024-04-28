# CM 2005 - Object Oriented Programing

## Topic 1: Text I/O and functions

**Object Oriented Programing** is a paradigm that uses objects to design applications. Objects are grouped into **classes** which define their properties and behaviors. OOP relies on four principles to organise software:

- Inheritance: A mechanism in which a class acquires the properties and behavior of another class.
- Polymorphism: The ability of methods to do different things based on the object that they are acting upon.
- Encapsultion: Keeping class members/attributes private and providing access to them via public methods.
- Abstraction: Hiding underlying implementation complexity and only exposing what is necessary for users to interact with
  - Achieved using abstract classes and interfaces

### Text I/O in C++

In C++ we use the standard library to interact with the command line using two function cin & cout.

- The main function is the entry point to a C++ program
- C++ is strongly typed and all variables and functions need to be declared using their type (of the type they return)
- The standard library is a **namespace**, a logical grouping of types/functions/varialbes that needs to be imported using the #include statement.

```cpp
#include <iostream>

int main (){
    int user_option;
    std::cin >> user_option; // user input flows into variable user_option  
    std::cout << "You chose option: " << user_option << std::endl; // Send message to be displayed in standard output
    return 0;
}
```

### Flow control

C++ has a curly braces syntax (similar to javascript). If statement and other flow control mechanisme share the same syntax

```cpp
#include <iostream>

int main (){

    while (true) // always true so the app will loop infintly
    {
        int user_option;
        std::cin >> user_option;
        
        if (user_option == 0) // check 1st case
        {
            std::cout << "Choose a valid option. 1 to 6"<< std::endl;
        }
        else if (user_option <= 6 ) // check a specific 2nd case
        {
            std::cout << "You chose option: " << user_option << std::endl;
        } 
        else // executes if neither above options match
        {
            std::cout << "Valid option are 1 to 6, you entered a value that is too large" << user_option << std::endl;
        }
    }
    return 0;
}
```

### Running C++ code

C++ is a low level language which means it has direct access to memory. In order to run the code it needs to be compiled (converted to machine code). The compiling process is a 3 steps process that used the g++ compiler.

1. Compile: Convert C++ code (.cpp files) into assembly code (CPU instructions)
   1. The compiler checks the syntax/semantics of the C++ code against a set of rules and generates instruction that the CPU understands.
2. Assemble: Convert the assembly code from the previous step and generate machine code (binary) in the form of object files (.o or .obj)
   1. The human readable code is thus translated into something the CPU can execute.
3. Link: Combines multiple object files into a single executable file.
   1. The linker allows separate compilations and modularity in your code. References to external code (e.g: iostream) between object files are resolved.

From the CLI this is done using the below commands:

```bash
g++ -c main.cpp -o main.o #compile & assembly step, produces main.o file
g++ main.o util.o -o app # linking step, take multiple objects files and produces app 
```

### Working in the CLI

Using the command terminal allows for more granural control over processes and files. In Linux based systems we mostly use bash  while Windows machines use PowerShell as the scripting/shell language.

The below are a subset of bash commands that would help you in during the course:

```bash
ls -l #list files in the current directory
cd directory_path #navigate to another directory, partial paths are allowed
pwd #short for "print working directory"
g++ main.cpp -o app #compile,assemble & link c++ file and output to app
./app #run the newly compiled app
```

**The Linux Documenation Project** provides a very extensive and in-depth introduction to the bash command line language: [link](https://tldp.org/LDP/Bash-Beginners-Guide/html/index.html)

## Topic 2: Classes & Variable Types

C++ is a strongly typed language. This means that variables need to be assigned a type when defined. C++ provides a large number of variable types, each with its own characteristics and memory requirements.

### Characters & Strings

In C++ characters are defined using the `char` keyword. C++ uses ASCII (American Standar Code for Information Interchange) as the default encoding for characters. It allows for 127 characters & machine use the binary representation of the number from 0 to 127 to map between binary & the characters in ASCII format.

The characters are represented using 1 byte (8 bits) to represent ASCII characters up to 127 characters. The 8th bit can be used to represent extended ASCII characters, up t0 256.

The below table shows some ASCII characters and their binary representations.

| ASCII Character | Decimal Value | Binary Representation |
|-----------------|---------------|-----------------------|
|       )         |       41      |       0101001         |
|       *         |       42      |       0101010         |
|       1         |       49      |       0110001         |
|       2         |       50      |       0110010         |
|       A         |       65      |       1000001         |
|       B         |       66      |       1000010         |
|       a         |       97      |       1100001         |
|       b         |       98      |       1100010         |

Strings can be instanciated as sequence of characters:

```cpp
const char* greeting = "Hello, world!";
```

Alternativly, string can be instances of the **string class** that is part of the standard library.

```cpp
#include <string>
std::string greeting = "Hello, world!";
```

The standard library class implementation is more usefull as it provides us with methods that can manipulate and inspect string such as `append`, `insert`, `erase`, `replace`, `find`, `substr`.

```cpp
#include <iostream>
#include <string>

int main() {
    // Create a string
    std::string str = "Hello, world!";
    std::cout << "Original string: " << str << std::endl;

    // Append to the string
    str.append(" Welcome!");
    std::cout << "After append: " << str << std::endl;

    // Insert into the string
    str.insert(7, "C++ ");
    std::cout << "After insert: " << str << std::endl;

    // Erase part of the string
    str.erase(0, 7);
    std::cout << "After erase: " << str << std::endl;

    // Replace part of the string
    str.replace(5, 5, "there");
    std::cout << "After replace: " << str << std::endl;

    // Find a substring in the string
    size_t found = str.find("there");
    if (found != std::string::npos) {
        std::cout << "Substring found at index " << found << std::endl;
    }

    // Get a substring
    std::string sub = str.substr(0, 5);
    std::cout << "Substring: " << sub << std::endl;

    return 0;
}

// Original string: Hello, world!
// After append: Hello, world! Welcome!
// After insert: Hello, C++ world! Welcome!
// After erase: C++ world! Welcome!
// After replace: C++ there! Welcome!
// Substring found at index 4
// Substring: C++ t
```

### Integers

Integers in C++ are data types used to represent whole numbers, with various sizes and signedness options to accommodate different ranges of values and memory constraints.

The int type is represented by 4 bytes (32 bits). They can be unsigned (only postivive numbers) or signed (negative numbers are possible). Unsigned integers can range from $0$ to $2^{32}$. On the other hand signed integers use the leftmost bit for the sign (0 for postive and 1 for negative) and a method called two's complement to represent a number's negative counterpart.

To demonstrate, take the case of the integer 5. In binary, 16 bit form, it would be  0000 0101. the range of values for unsigned integers would thus be 0 to 255 ($2^{8}$) integers

If we want to represent a -5 in binary form, we would use the leftmost bit to represent the negative and then use two's complement method on the remaining bits (flip 0s to 1s and vice versa and then add 1 to the result). We end up with 1111 1011.

Notice that the range of values that can be represented is now $-127$ to $127$, which is still 256 ($2^{8}$) but the absolute values got impacted becuase we are using the 8th bit for signing the integer.

| Integer Type         | Size                                  | Range                 |
|----------------------|---------------------------------------|-----------------------|
| `int`                | 4 bytes (32 bits)                     | -2B to 2B             |
| `short`              | 2 bytes (16 bits)                     | -32,768 to 32,767     |
| `long`               | 4 bytes (32 bits) / 8 bytes (64 bits) | -2B to 2B / -9Q to 9Q |
| `long long`          | 8 bytes (64 bits)                     | -9Q to 9Q             |
| `unsigned int`       | Same as `int`                         | 0 to 4B               |
| `unsigned short`     | Same as `short`                       | 0 to 65,535           |
| `unsigned long`      | Same as `long`                        | 0 to 4B / 0 to 18Q    |
| `unsigned long long` | Same                                  | 0 to 18Q              |

### Floating Point Number

Floating-point numbers are represented in binary using a format defined by the IEEE 754 standard.

Decimal numbers (eg: 2.2312, 65345.31231) are called "floating" because the decimal point can be placed anywhere within the number, for example 1.23 vs 10000.124653 (decimal at second index vs 6th)

In order to understand how they work we need to define their three components:

1. The sign bit: single bit used to denote positive (0) or negative (number)
2. The exponent: 8 bit character used to denote the exponent bias (position of the decimal)
3. the significand: 23 remaining bits quantifying the number.

Let's consider an example, the number 6.75

- 6.75 in binary is 110.11
- We normalize it: 1.1011
  - Normalisation works by shifting the number to the left of right so that the leftmost bit is a 1.
  - Keep track of the number of the number of shifts executed to update the exponent
  - Example: 0000.101 becomes 1.01 and the exponent value is updated by -4
  - Example: 1000.1 becomes 1.0001 and the exponent value is updated by +3
- The expoenent bias is updated by +2 (2 shifts left)
  - The expoenent bias is by default 127 (1111 1111), number under 127 denote negative exponents
- The significand is right padded with zeros untill 23 bits are used

| Sign (1 bit) | Exponent (8 bits) | Significand (23 bits)   |
|--------------|-------------------|-------------------------|
| 0            | 10000001          | 10110000000000000000000 |

There are multiple floating point types available in C++:

| Type          | Size               | Range                                  |
|---------------|--------------------|----------------------------------------|
| `float`       | 4 bytes            | Approximately ±3.4 × 10^38             |
| `double`      | 8 bytes            | Approximately ±1.7 × 10^308            |
| `long double` | Platform-dependent | Varies, typically higher than `double` |

You can find a reference to the C++ floating literal here: [link](https://en.cppreference.com/w/cpp/language/floating_literal)

### Enums

In C++, enums (short for enumerations) provide a way to define a set of named constants, where each constant represents an integer value. Enums are useful for improving code readability and maintainability by giving meaningful names to integral values. Here's how you define enums in C++:

```cpp
// Define an enum named Color with constants Red, Green, and Blue
enum Color {
    Red,
    Green,
    Blue
};

// Define an enum named Direction with constants North, South, East, and West
enum Direction {
    North,
    South,
    East,
    West
};
```

### Vectors

Vectors are a dynamic array-like data structure that offer dynamic resizing, allowing you to add and remove elements efficiently.

```cpp
#include <vector> // Include the vector header

int main() {
    // Declare an empty vector of integers
    std::vector<int> myVector;

    // Add elements to the vector using push_back
    myVector.push_back(10);
    myVector.push_back(20);
    myVector.push_back(30);

    // Access elements using the [] operator or the at() function
    std::cout << "First element: " << myVector[0] << std::endl;
    std::cout << "Second element: " << myVector.at(1) << std::endl;

    // Iterate over the vector
    for (int i = 0; i < myVector.size(); ++i) {
        std::cout << "Element " << i << ": " << myVector[i] << std::endl;
    }

    // Modify elements
    myVector[1] = 25;

    // Remove elements using erase
    myVector.erase(myVector.begin() + 1); // Remove the second element

    // Size of the vector
    std::cout << "Size of the vector: " << myVector.size() << std::endl;

    // Clear the vector
    myVector.clear();

    // Check if the vector is empty
    if (myVector.empty()) {
        std::cout << "Vector is empty." << std::endl;
    }

    return 0;
}
```

### Classes

Classes act as blueprint for creating gobjects in object oriented programing. They define the data that comes into those objects as well as the methods/functions that they can execute.

- They can define public or private members
  - private attributes/methods can only be accessed within the object itself
  - public method can be called outside of the object
- Constructor functions define how objects are created
  - They are function within classes that have the same name as the class that i initialises.
  - Can make use of `initializer lists` to assign arguments to class attributes
  - The opposite are desctructor classes and define how they are disposed.
- The `this` keyword is used to reference the object itself from within it
- Classes can be derived from other classes, this is called `inheritance`

```cpp
#include <iostream>
#include <string>
#include <vector>

// Enum to represent the type of order book entry
enum class OrderBookType { Bid, Ask };

class OrderBookEntry {
    public:
        // Constructor with initializer list to initialize member variables
        OrderBookEntry(
            double _price,
            double _amount,
            std::string _timestamp,
            std::string _product,
            OrderBookType _orderType)
            : price(_price),
            amount(_amount),
            timestamp(_timestamp),
            product(_product),
            orderType(_orderType) {}
    
    // Getter functions
    double getPrice() const { return price; }
    double getAmount() const { return amount; }
    std::string getTimestamp() const { return timestamp; }
    std::string getProduct() const { return product; }
    OrderBookType getOrderType() const { return orderType; }


    // private attribute cannot be access from outside the class itself
    // for example: order1.price would lead to an error
    private:
        double price;
        double amount;
        std::string timestamp;
        std::string product;
        OrderBookType orderType;
};

// Derived class representing a trade entry, inheriting from OrderBookEntry
class TradeEntry : public OrderBookEntry {
    public:
        // Constructor with initializer list, calling base class constructor
        TradeEntry(
            double _price,
            double _amount,
            std::string _timestamp,
            std::string _product,
            OrderBookType _orderType,
            std::string _tradeId,
            std::string _buyer,
            std::string _seller)
            : OrderBookEntry(_price, _amount, _timestamp, _product, _orderType),
            tradeId(_tradeId),
            buyer(_buyer),
            seller(_seller) {}

        // Getter functions specific to TradeEntry
        std::string getTradeId() const { return tradeId; }
        std::string getBuyer() const { return buyer; }
        std::string getSeller() const { return seller; }

    private:
        std::string tradeId;
        std::string buyer;
        std::string seller;
};

int main() {
    // Create an OrderBookEntry object using the constructor
    OrderBookEntry entry1(100.0, 10.0, "2024-04-28 09:00:00", "BTC/USD", OrderBookType::Bid);

    // Create another OrderBookEntry object
    OrderBookEntry entry2(150.0, 8.0, "2024-04-28 09:05:00", "ETH/USD", OrderBookType::Ask);

    // Create a vector to store OrderBookEntry objects
    std::vector<OrderBookEntry> orderBook;

    // Add the entries to the vector
    orderBook.push_back(entry1);
    orderBook.push_back(entry2);

    // Create a TradeEntry object using the constructor
    TradeEntry trade1(150.0, 8.0, "2024-04-28 09:05:00", "ETH/USD", OrderBookType::Ask, "123456", "Alice", "Bob");

    return 0;
}
```

Additional references:

- W3CSchools [C++ constructors](https://www.w3schools.com/cpp/cpp_constructors.asp)
- CPP Reference [Default Constructors](https://en.cppreference.com/w/cpp/language/default_constructor)
- CPP Reference [Initializer Lists](https://en.cppreference.com/w/cpp/language/constructor)
- GeeksForGeeks [Initializer Lists](https://www.geeksforgeeks.org/when-do-we-use-initializer-list-in-c/)
- TutorialsPoint [C++ Class Objects](https://www.tutorialspoint.com/cplusplus/cpp_classes_objects.htm)
