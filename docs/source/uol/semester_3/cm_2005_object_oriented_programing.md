# Object Oriented Programing

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
