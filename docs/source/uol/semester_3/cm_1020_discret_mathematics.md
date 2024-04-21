# CM 1020 - Discret Mathematics

**Discret Math** (DM) is a branch of mathematics that deal with distinct, separate values rather than continuous ones. It focuses on objects that can be counted/manipulated in a finite/coutable manner.

CM-1020 is organized around 10 DM topics:

1. Sets
2. Functions
3. Propositional Logic
4. Predicate Logic
5. Boolean Algebra
6. Induction & Recursion
7. Graphs
8. Trees
9. Relations
10. Combinatorics

## Topics 1: Sets

### Sets: Topic Objectives

The topic has the following learning objectives:

1. Understand set & powersets
2. Use the listing and rules of inclusion methods to construct sets
3. Manipulate set operations
4. Represent sets as Venn Diagrams
5. Understand and apply De Morgan's Law when negating expressions
6. Undertstand commutative, associative & distributive laws

### Sets: Definition

Sets are collections of distinct objects or elements grouped together based on common characteristics or properties.  
Each element within a set is considered unique, and sets themselves can be finite or infinite in size.

### Sets: Notation

There are three important concepts to define in sets: members, subsets & cardinality

- A set is composed of distinct element, e.g: $A=\{1,2,4,5,7\}$
- A set can be empty, e.g: $A=\emptyset$
- An item can either be a member of a set, or not, e.g: $1 \in A$ & $6 \notin A$
- Cardinality is the number of distinct elements in a set, e.g: $|A| = 5$
- A set can be subset of another set, if all its members are also members of another (bigger set). e.g: $B=\{1,3\}$ thus  
B is a subset of A or $B \subseteq A$

### Sets: Special Cases

Some sets are finite (the students of a class) while some are infinite (all possible integers). There are a few special  
sets that we should keep in mind

- Set of integers : $\mathbb{Z} = \{...,-1,0,1,2,...\}$
- Set of positive integers : $\mathbb{N} = \mathbb{Z^+} = \{1,2,3,4\}$
- Set of whole numbers : $\mathbb{W} = \{0,1,2,...\}$
- Set of rational numbers : $\mathbb{Q} = \{\frac{p}{q} | p,q \in \mathbb{Z} \land q \neq 0\}$
- Set of real numbers : $\mathbb{R}$

### Methods to Build Sets

We can either exasutivly list out the members of a set (listing method) or write an expression that defines the membership  
rules (set builder method). E.g: $A=\{1,2,3,4,5,6,7,8,9\}$ or $A=\{x | 0 < x < 10\}$

### Powersets

A powerset of a set is the set of all possible subsets of that set. For example, if $A = \{1,2,3\}$ then the powerset of A is  
$P(A)=\{\{\emptyset\}, \{1\}, \{2\}, \{3\}, \{1,2\}, \{2,3\},\{1,3\}, \{1,2,3\}\}$

The cardinality of a powerset is described with the formula $|P(A)|=2^{|A|}$ where $|A|$ is the cardinality of the orginal  
set $A$. In this case $|P(A)|=2^3=8$

### Set Operations

There are 4 set operations: Intersection ($\cap$), Union ($\cup$), Difference ($-$), Symetric Difference ($\otimes$)

- Intersection: the set of elements that appears in **BOTH** sets: $A \cap B = \{x | x \in A \land x \in B\}$
- Union: the set of elements that appears in **EITHER** sets: $A \cup B = \{x | x \in A \lor x \in B\}$
- Difference: the set of elements in the first set that **DONT** appear in the second $A - B = \{x | x \in A \land x \notin B\}$
- Symetric Difference: the set of element in **EITHER** sets but **NOT** in both $A \otimes B = \{x | (x \in \{A\cup B\}) \land (x \notin \{A\cap B\})\}$
