# Algorithms and Data Structures 1

## Course Topics

1. Problems, Algorithms and Flowchart
2. Pseudocode
3. Vectors, Stacks and Queues
4. Arrays, Linked Lists and Searching Algorithms (part 1)
5. Sorting Algorithms (part 1)
6. Evaluating Algorithms
7. Searching Algorithms (part 2)
8. Recursion
9. Sorting Algorithms (part 2)
10. Computational Complexity

## Topic 1: Problems, Algorithms and Flowchart

Key Concepts:

- Algorithms
- Flowcharts

Key Takeaways:

- Problems in computing need to be defined in logical/mathematical forms (Should I take a holiday? vs How many days of holidays is there?)
- Problems can have multiple solutions
- The solutions are called algorithms. Sets of step-by-step instructions to solve a problem.
- Algorithms can be adapted to solve similar problems.
- Judging which algorithms (solutions) are best for solvig a problems is a central aspect of algorithm design.

An exmaple problem would be: If $x^2 = 2$, is x an integer? We can propose two solutions:

1. Compute $\sqrt{2}$ and verify if its an integer
2. For all integers less that 2, compute $x^2$ and see if it equals 2.

Which solution to choose? Is there a better solution? Is there a solution that would also solve the case $x^2 = 1621$?

### History of algorithms

Algorithms predate computers and can be defined and solved without them.

The word algorithm traces its root to the persian mathematician Al-Khawarizmi (9th century) who discovered a method to solve quadratic equations.

Euclid (300 BCE) created and alogrithm to find the greatest common divisor of two numbers.

### Converting mathematics to digital representations.

Whole and rational numbers (integers and fractions) can be stored in finite numbers of computer memory cells. The later represented as the division of two integers. But how do we represent irrational numbers, such as $\pi$, which extend infinitley after the decimal?

In such cases we use approximation where the difference between the irrational and rational number is less than a small arbitrary threshold $\eta$ which is called the **precision** of calculation. The smaller the value $\eta$ the more precise.

$$
|\pi -\frac{a}{b} \le \eta
$$

### Calculating square roots: Heron's method

One of the earliest know algorithms, created by Heron of Alexandria in order to approximate the square root of a number.

It consists of taking an initial candidate $x_0$ that may be the square root of $X$ such as $X=x_0^2$

If the above formula doesn't hold for a desired level of precision we take $x_1$ as the average of $X$ and $x_0$. We keep iterating untill we reach a number $x_n$ that satisfies the equation.

$$
x_{n+1}=\frac{1}{2}*(x_n+\frac{X}{x_n})
$$

The intuition behind this is that if $x_n$ is an overestimate of $\sqrt{X}$ then $\frac{X}{x_n}$ will be an underestimate. The average of the two would be closer to the true value of $\sqrt{X}$. As we rerun the steps for $n=1,2,3,4....$ we have the difference between the candidate value and true value getting smaller, untill it id under the threshold.

$$
arrow|\sqrt{X} - x_n | \le \eta
$$

### Flowcharts

Flowcharts are graphincal representation of series of events, decisions and computations. They are useful for modeling the flow of execution of an algorithm.

UML (Universal Modelling Language) is a standard way of representing systems designs in many industries, not just software (e.g: manufacturing).

[UML Wikipedia Page](https://en.wikipedia.org/wiki/Unified_Modeling_Language)

#### Flowchart component types

- Start & end states (terminals)
  - oval shapes
- I/O actions
  - paralelogram shapes
  - represents gathering or displaying data
- Control flows
  - Arrows between states/actions
- Decisions
  - diamond shapes
  - Multiple branches lead out in different directions, depending on choice. Typically YES/NO choices.
- Basic actions
  - Runs computation, send request

:::{mermaid}
    flowchart TD
    id1(Start - enter room) --> id2[/Action - check light/]
    id2 --> id3{Decision - Is it dark?}
    id3 -- Yes --> id4[Action - Turn on light]
    id3 -- CHOICE 1 --> id5[Action - Sit down]
    id5 --> id2
:::

#### Heron's method as a flowchart

Compute square root of integer X up to n.d.p

:::{mermaid}
    flowchart TD
    id1(Start) --> id2[/Get X,n/]
    id2 --> id3["Make guess g of sqrt(X)"]
    id3 --> id4[Calculate X/g]
    id4 --> id5{Does X/g differ from g up to n.d.p?}
    id5 -- NO --> id6[Output g]
    id6 --> id7(Stop)
    id5 -- YES --> id8["Calculate average(X/g, g)"]
    id8 --> id9["set g=average(X/g, g)"]
    id9 --> id4
:::

### Euclid's algorithm as a flowchart

You have 48 toys and 42 sweets to distribute to guests at a child birthday party. The goal is to equaly distribute all the sweets and toys to the maximum number of people. How would you go about solving this problem.

This is a case of looking for the greatest common divisor for both sweets and toys. This number would be the solution to how many people you can invite and how many sweets/toys each will get.

This is a generalisable problem for ressource allocation. Euclid proposed an algotihm to find the GCD over 2000 years ago. It goes like this:

:::{mermaid}
  flowchart TD
  t1(Start) --> s1{Is A=B}
  s1 -- YES --> s2[Output A]
  s2 --> t2
  s3 --> YES --> s4[Set A = A-B]
  s1 -- NO --> s3{Is A>B}
  s3 --> NO --> s5[Set B = B-A]
  s4 & s5 --> s1
  t2(End)
:::

Intuitivly, if the larger number divided by the second has no remainder then the division result is a common divisor.

Untill the two number are not equal, repplace larger number with  remainder and repeat untill both numbers are equal in wich case that is the GCD.

Mathmatically it can be explained as such. If $A = B+C$, then $A \mod  N \equiv (B \mod N )+ (C \mod N)$.

We know that $A = B * quotient + R$ and thus a common divisor G for A & B is also divides A & R.

We use this logic to keep repeating untill we find a division that has no remainder which is the GCD.

## Topic 2: Pseudocode

Key Concepts:

- Pseudocode
- Iteration

Flowchart are limited because they are continuous processes while algorithms operate in discrete steps. Flowchart provide a usefull starting point but we need a tool that take this into account. This is where pseudocode comes into the picture.

Pseudocode is a way to write algorithm in plain language that is independent of which programing language or machine you are using.

### Pseudocode Notation

There are common standards to notation:

- Assignment operator: $\leftarrow$
  - e.: assign the value 2 to the variable x : $x  \leftarrow 2$
- Variable name contain have spaces
  - e.g: VariableName (correct), varible_3 (correct), Variable Name(incorrect)
- Written from left to right, top to bottom
- Variables can be self referencial
- Arithmetic: $+ - * /$
- Comaprison: $= \ne \le \ge > <$
- Flow control blocks are indented.
- Logic under If, While & For loop blocks are indented
  - If statement start with "If condition then" and end with "end if"

### Functions

A general concept but in computer science its am encolsed set of logic that takes input and returns output.

#### Example Function

The below function would check if a number is even or odd.

```bash
function Even(n)
  if n mode 2 = 0
    return TRUE
  else
    return FALSE
  end if
end function
```

### Iteration

Iteration is the process of repeating a set of steps multiple times untill a condition is met. When the condition is met you "break" out of the repeating loop and move on to the subsequent set of intructions.

They are also called "loops" and in flowchart representation you can see that by following the arrows forming a loops such as the below chart:

:::{mermaid}
  flowchart LR
  t1(Start) --> s1 --> s2 --> s3 -- LOOP --> t1
:::

There are two type of loops, "For Loops" and "While Loops".

- "For loops" iterate over specific number of steps, predefined at the top.

```bash
x <-- 1
for 2 < i < 10 do
  x <-- x + 1
end for
```

- "While Loops" iterate untill a condition is met. The execution of the code in the loop will modify values that the "While loop" will examin at the start of each iteration.

```bash
x <-- 1
while x < 10 do
  x <-- x + 1
end while
```

#### Extended loop behaviors: break & continue

During execution we can stop iterating early, if a certain condition has been met, using break statements. In the below example we return y = 5 and not y = 10 because we **break out** of the loop when i = 5, which stop us from iterating further up to 10.

```bash
function TestBreak()
  for i <= 10 do
    y <-- i
    if i = 5 then
      break
    end if
  end for
  return y

TestBreak()
5
```

We can also skip some iterations of the loop and restart at the next iteration using **continue**. In the below example we skip over the execution of a loop if i is even, thus only printing out the odd numbers in the array.

```bash
function TestContinue()
  for i <= 10 do
    if i mod 2 = 0 then
      continue
    else
      print(i)
    end if
  end for

TestContinue()
1,3,5,7,9
```

#### Challenge: Solving a problem with iteration

Problem: If $x^2 = n$, is x an integer?

Our solution would be to start with the first integer, 1, and iterate untill n. If any of the integers x from 1 to n satisfy $x^2 = n$, output true, otherwise output false.

```bash
function IsXInteger(n)
  y <-- FALSE
  for 1 <= i <=n do
    if i*i = n then
      y <-- TRUE
      break
    end if
  end for
  return y
end function
```

#### Euclid's algorithm as pseudocode

```bash
function GreatestCommonDivisor(A,B)
  while A != B do
    if A > B then
      A <-- A - B
    else
      B <-- B - A
    end if
  end while
  return A
```

## Topic 3: Vectors, Stacks and Queues

Key Concepts:

- Data structures
- Abstraction

Data structures are abstractions of how computer memory is used to store data and run operations on it.

In this section we will present three datastructures that are used to store collections of data items, define relations among them and operate on them (read, write).

These data structures :

1. Vectors
2. Stacks
3. Queues

### Vectors

A finite, fixed sized, data collection.

- Data is stored sequentially: contiguous set of memory cells
- Fixed sized: The number of elements in the vector is set at the moment it is instanciated and cannot be modified subsequently.

The position of an element in the vector is called the **index**.

:::{mermaid}
  flowchart LR
    subgraph "Vector"
      direction LR
      v1 ---v2--- v3
    end
:::

#### Vector Operations

| OPERATION  | PSEUDOCODE          |
|------------|---------------------|
| length     | LENGTH              |
| select[k]  | V[k]                |
| store[o,k] | V[k] $\leftarrow$ o |

### Queues

Intuitivly a queue in computing is similar to a queue at the airport. People join the queue a the end (the tail) and are processed for onboarding the airplane at the beggining (the head).

Queues are often used when a ressource is needed but cannot be immediatly accessed. As such the elements in the queue await to be processed in a first come first served basis (formally FIFO: First In, Firt Out).

Queue differ from vectors:

1. Not fixed size and can extend.
2. Not all element are accessible. You can add elements at the tail and remove them from the head.

:::{mermaid}
  flowchart LR
    Tail <--> q1
    q4 <--> Head
    subgraph "Queue"
      q1["Q[1]"] <--> q2["Q[2]"] <--> q3["Q[3]"] <--> q4["Q[4]"]
    end
:::

#### Queue Operations

| OPERATION  | PSEUDOCODE   |
|------------|--------------|
| head       | HEAD[Q]      |
| dequeue    | DEQUEUE[Q]   |
| enqueue[x] | ENQUEUE[x,Q] |
| empty      | EMPTY[Q]     |

### Stacks

Stacks are similar to queue but only one element is accessible, the top (equivalent to the tail in queues).

Stacks operate in a last-in first-out models (LIFO). The most recent element added to the stack can be accessed.

:::{mermaid}
  flowchart LR
    Top <--> s1
    subgraph "Stack"
      s1 <--> s2 <--> s3
    end
:::

#### Stack Operations

| OPERATION | PSEUDOCODE |
|-----------|------------|
| push[x]   | PUSH(x,S)  |
| top       | TOP(S)     |
| pop       | POP(S)     |
| empty     | EMPTY(S)   |

#### Challenge: Stacks

Given integer $n$ in decimal form, give a binary representation as a stack.

Solution intuition: We know that to convert decimal (base 10) to binary (base 2) we divide the decimal number by two and keep track of the quotient and remainder. The remainder at each step will be either 0 or 1 (the modulo of any number with 2 return either 0, or 1). The sequence of 0s and 1s from those divisions untill the quotiet is 0 is the binary representation if that number.

Example: Convert $13_{10}$ to binary.

| Division by 2 | Quotient | Remainder | Bit # |
|---------------|----------|-----------|-------|
| 13/2          | 6        | 1         | 0     |
| 6/2           | 3        | 0         | 1     |
| 3/2           | 1        | 1         | 2     |
| 1/2           | 0        | 1         | 3     |

The solution is: $13_{10} = 1101_{2}$

In algorithmic form, using a stack and floor division/modulo operator ( // & % respectivly)

```bash
function ConvertDecimalToBinary(n)
  s <-- new Stack

  while TRUE do # Start while loop that will iterate untill we hit break
    remainder <-- n % 2
    ENQUEUE[remainder, s]    

    quotient <-- n // 2

    if quotient = 0 then # Check quotient is zero to control break from 
      break
    else
      n <-- quotient # Reassign n to be the quotient for next loop
  return s
```

```{note}
Additional Reading: Section 3 introduction & Chapter 10.1 - Introduction to algorithms, Cormen, T.H., (Cambridge, MA: MIT Press, 2009) 3rd edition.
[PDF link](https://pd.daffodilvarsity.edu.bd/course/material/book-430/pdf_content)
```

## Topic 4: Arrays, Linked Lists and Searching Algorithms (part 1)

Key Concepts:

- Search Algorithms
- Abstract Data Types vs Data Structures

An important distinction is the difference between **Data Types** and **Data Strucutres**. The former consists of the data that we have and the operation we can execute. The later is the concrete implementation, taking into account how computer memory works.

A computer needs to allocate memory cells to data that it uses takign into account how much memory is needed. For example, storing the number 4000 will take more memory bits to stores compared to the number 8 (111110100000 vs 1000 in binary).

Keeping track of the location of the memory cells that contain this data is also important. This is done using pointers, bits of data that correspond to specific memory cells in RAM.

The above two points are crucial in building collection of data such as Stacks, Queues and Vectors.

These data structures can be constrcted using Arrays or Linked List.

### Arrays

An array is method of storing collections of data in contiguous memory adresses. We assume the size of an array is immutable but we can always create new arrays (bigger/smaller).

:::{mermaid}
  flowchart LR
  001 --> 002 --> 003 --> 004 --> 005 --> 006
    subgraph "001"
      e1["01010100"]
    end
    subgraph "002"
      e2["01010100"]
    end
    subgraph "003"
      e3["01010100"]
    end
    subgraph "004"
      e4["01010100"]
    end
    subgraph "005"
      e5["01010100"]
    end
    subgraph "006"
      e6["01010100"]
    end
:::

### Implementing Vector Data Strucutres Using Arrays

We'll build the concret implementation of vector operations using arrays.

1. LENGTH:
   1. The first element (index 0) will contain the number of elements in the vector.
   2. You avoid counting the number of elements each time you call the funtion
   3. The vectore can only store N-1 elements
2. SELECT: Find element at index k
3. STORE: Assign value to vector element at index k

:::{mermaid}
flowchart LR
l[length] --> 0
0 --> 1 --> 2 --> 3 --> 4 --> 5 --> 6 
subgraph "0"
  e1["6"]
end
subgraph "1"
  e2["Element 1"]
end
subgraph "2"
  e3["Element 2"]
end
subgraph "3"
  e4["Element 3"]
end
subgraph "4"
  e5["Element 4"]
end
subgraph "5"
  e6["Element 5"]
end
subgraph "6"
  e7["Element 6"]
end
:::

### Implementing Stack Data Strucutres Using Arrays

Unlike the abstract stack, the data structure is created using an array of fixed size. The stack can only grow as large as the array that was used to instanciate it. If you attempt to push more elements that there is space to accomodate, you will be face with a **Stack Overflow** error

In the same manner as the vector, important values will be stored in dedicated memory cells. In this case **S.TOP** which will keep track of the index of the latest item that was added to the stack.

:::{mermaid}
flowchart LR
l[S.TOP = 3] --> 3
0 --> 1 --> 2 --> 3 --> 4 --> 5 --> 6
subgraph "Stack"
  subgraph "0"
    s1["Element 0"]
  end
  subgraph "1"
    s2["Element 1"]
  end
  subgraph "2"
    s3["Element 2"]
  end
  subgraph "3"
    s4["Element 3"]
  end
  subgraph "4"
    s5["-"]
  end
  subgraph "5"
    s6["-"]
  end
  subgraph "6"
    s7["-"]
  end
end
:::

#### Stack Operations (revisited)

The concrete implementation of a stack depends on operations to its only accessible value, S.TOP.

```bash
PUSH(x,S)
  if S.TOP + 1 > S.LENGTH
    error "overflow"
  else
    S.TOP = S.TOP + 1
    S[S.TOP] = x

POP(S)
  if EMPTY(S)
    error "underflow"
  else
    S.TOP = S.TOP - 1
      return S[S.TOP + 1]


EMPTY(S)
  # We decrement the top at every pop, if you pop the first element (index 0) S.top become negative
  if S.TOP = -1     
    return TRUE
  else
    return FALSE

```

### Implementing Queueu Data Strucutre Using Arrays

Queues have to keep track of two additional memory addresses to run operation, the **HEAD** & **TAIL**. The **HEAD** keeps track of the element at the "front of the line", the next element to be dequeued. The **TAIL** keep track of the address that will receive the next element to be enqueued.

:::{mermaid}
flowchart LR
h[Q.HEAD = 3] --> 3
t[Q.TAIL = 9] --> 9
0 --> 1 --> 2 --> 3 --> 4 --> 5 --> 6 --> 7 --> 8 --> 9 --> 10
subgraph "Queue"
  subgraph "0"
    s1["-"]
  end
  subgraph "1"
    s2["-"]
  end
  subgraph "2"
    s3["-"]
  end
  subgraph "3"
    s4["3"]
  end
  subgraph "4"
    s5["6"]
  end
  subgraph "5"
    s6["12"]
  end
  subgraph "6"
    s7["3"]
  end
  subgraph "7"
    s8["12"]
  end
  subgraph "8"
    s9["1"]
  end
  subgraph "9"
    s10["-"]
  end
  subgraph "10"
    s11["-"]
  end
end
:::

#### Queue Operations Implementation In Code

```bash
EMPTY(Q)
  if Q.TAIL = Q.HEAD
    return TRUE
  else
    return FALSE

FULL(Q)
  if Q.TAIL = Q.LENGTH
    NEXT_TAIL_POSITION <- 1
  else
    NEXT_TAIL_POSITION <- Q.TAIL + 1

  if Q.HEAD = NEXT_TAIL_POSITION
    return TRUE
  else:
    return FALSE

ENQUEUE(x,Q)
  if FULL(Q)
    error "overflow"
  else
    Q.TAIL <- x
    if Q.TAIL = Q.LENGTH
      Q.TAIL <- 1
    else
      Q.TAIL <- Q.TAIL + 1

DEQUEUE(Q)
  if EMPTY(Q)
    error "underflow"
  else
    x <-  Q[Q.HEAD]
    if Q.HEAD = Q.LENGTH
      Q.HEAD <- 1
    else
      Q.HEAD <- Q.HEAD + 1
    return x
```

#### Queue Operations Visualy Representation

We start with an empty queue

:::{mermaid}
flowchart LR
h[Q.HEAD = 0] --> 0
t[Q.TAIL = 0] --> 0
0 --> 1 --> 2 --> 3 --> 4 --> 5
subgraph "Queue"
  subgraph "0"
    s1["-"]
  end
  subgraph "1"
    s2["-"]
  end
  subgraph "2"
    s3["-"]
  end
  subgraph "3"
    s4["-"]
  end
  subgraph "4"
    s5["-"]
  end
  subgraph "5"
    s6["-"]
  end

end
:::

The queueu is empty, Q.HEAD and Q.TAIL have the same index.

```bash
EMPTY(Q)

TRUE
```

We enqueue a number of values.

```bash
ENQUEUE(65,Q)
ENQUEUE(3,Q)
ENQUEUE(21,Q)
ENQUEUE(15,Q)
ENQUEUE(999,Q)
ENQUEUE(76,Q)
overflow
```

The queue now looks as such.

```{warning}
Notice that we couldn't ENQUEUE the last elements and it raised an overflow error. That is because the queue is circular and if we enqueued an additional item which would lead to the TAIL and HEAD to be at the same index. Since empty queues have the same index for TAIL and HEAD, we can't use the same condition to test if the queueu is full. This is why we use this convention
```

:::{mermaid}
flowchart LR
h[Q.HEAD = 0] --> 0
t[Q.TAIL = 5] --> 5
0 --> 1 --> 2 --> 3 --> 4 --> 5
subgraph "Queue"
  subgraph "0"
    s1["65"]
  end
  subgraph "1"
    s2["3"]
  end
  subgraph "2"
    s3["21"]
  end
  subgraph "3"
    s4["15"]
  end
  subgraph "4"
    s5["999"]
  end
  subgraph "5"
    s6["-"]
  end
end
:::

We verify that it's not longer empty.

```bash
EMPTY(Q)

FALSE
```

We dequeue all existing values.

```bash
DEQUEUE(Q)
65

DEQUEUE(Q)
3

DEQUEUE(Q)
21

DEQUEUE(Q)
15

DEQUEUE(Q)
999
```

The queue is now empty again.

:::{mermaid}
flowchart LR
h[Q.HEAD = 5] --> 5
t[Q.TAIL = 5] --> 5
0 --> 1 --> 2 --> 3 --> 4 --> 5
subgraph "Queue"
  subgraph "0"
    s1["-"]
  end
  subgraph "1"
    s2["-"]
  end
  subgraph "2"
    s3["-"]
  end
  subgraph "3"
    s4["-"]
  end
  subgraph "4"
    s5["-"]
  end
  subgraph "5"
    s6["-"]
  end
end
:::

We enqueu a few more elements to demontrate the circular nature of the queue.

:::{mermaid}
flowchart LR
h[Q.HEAD = 5] --> 5
t[Q.TAIL = 2] --> 2
0 --> 1 --> 2 --> 3 --> 4 --> 5
subgraph "Queue"
  subgraph "0"
    s1["4"]
  end
  subgraph "1"
    s2["7"]
  end
  subgraph "2"
    s3["-"]
  end
  subgraph "3"
    s4["-"]
  end
  subgraph "4"
    s5["-"]
  end
  subgraph "5"
    s6["32"]
  end
end
:::

We dequeueu another time

:::{mermaid}
flowchart LR
h[Q.HEAD = 0] --> 0
t[Q.TAIL = 2] --> 2
0 --> 1 --> 2 --> 3 --> 4 --> 5
subgraph "Queue"
  subgraph "0"
    s1["4"]
  end
  subgraph "1"
    s2["7"]
  end
  subgraph "2"
    s3["-"]
  end
  subgraph "3"
    s4["-"]
  end
  subgraph "4"
    s5["-"]
  end
  subgraph "5"
    s6["-"]
  end
end
:::

## Topic 5: Sorting Algorithms (part 1)

## Topic 6: Evaluating Algorithms

## Topic 7: Searching Algorithms (part 2)

## Topic 8: Recursion

## Topic 9: Sorting Algorithms (part 2)

## Topic 10: Computational Complexity
