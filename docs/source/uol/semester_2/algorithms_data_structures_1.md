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
|\sqrt{X} - x_n | \le \eta
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

### Challenge: Euclid's algorithm

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

## Topic 3: Vectors, Stacks and Queues

## Topic 4: Arrays, Linked Lists and Searching Algorithms (part 1)

## Topic 5: Sorting Algorithms (part 1)

## Topic 6: Evaluating Algorithms

## Topic 7: Searching Algorithms (part 2)

## Topic 8: Recursion

## Topic 9: Sorting Algorithms (part 2)

## Topic 10: Computational Complexity
