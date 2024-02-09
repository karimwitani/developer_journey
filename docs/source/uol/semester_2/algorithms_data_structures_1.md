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

It consists of taking an initial candidate $x_0$ that may be the square root of $X$ such as:
$$
X=x_0^2
$$

If the above formula doesn't hold for a desired level of precision we take $x_1$ as the average of $X$ and $x_0$. We keep iterating untill we reach a number $x_n$ that satisfies the equation.

$$
x_{n+1}=\frac{1}{2}*(x_n+\frac{X}{x_n})
$$

The intuition behind this is that if $x_n$ is an overestimate of $\sqrt{X}$ then $\frac{X}{x_n}$ will be an underestimate. The average of the two would be closer to the true value of $\sqrt{X}$. As we rerun the steps for $n=1,2,3,4....$ we have the difference between the candidate value and true value getting smaller, untill it id under the threshold.

$$
|\sqrt{X} - x_n | \le \eta
$$

## Topic 2: Pseudocode

Key Concepts:

- Pseudocode
- Iteration

## Topic 3: Vectors, Stacks and Queues

Key Concepts:

- XXXX

## Topic 4: Arrays, Linked Lists and Searching Algorithms (part 1)

## Topic 5: Sorting Algorithms (part 1)

## Topic 6: Evaluating Algorithms

## Topic 7: Searching Algorithms (part 2)

## Topic 8: Recursion

## Topic 9: Sorting Algorithms (part 2)

## Topic 10: Computational Complexity
