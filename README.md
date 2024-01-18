# Learn Dafny

Here is the list of resources I went over to learn [Dafny](https://dafny.org/) for my CS839 System Verification course. [What is Dafny?](https://en.wikipedia.org/wiki/Dafny)

I will list some keypoints that I learned.

## R01: Getting Started with Dafny: A Guide
http://dafny.org/dafny/OnlineTutorial/guide.html

### Method
* Dafny **will not** discover properties of a method on its own.
* If we call a method `A` from inside another method `B`, the only thing Dafny knows in `B` about the value returned from  `A` is what the **postconditions** say about it, and nothing more.
* `lemma` is a ghost method.

### Functions
* Dafny will discover properties of a function on its own.
* A function body must consist of exactly one expression, with the correct type.
* Unlike methods, functions can appear in expressions.
* `predicate` is a function that returns boolean.

### Loop
* When you specify an invariant, Dafny proves two things: 
    1. the invariant holds _upon entering_ the loop
    2. it is preserved _after every execution_ of the loop.
        * Remind that, iterating variable can change within the loop before termination logic triggers 
* Dafny **will not** discover properties of a loop on its own (Unless told by invariant).

### Quantifiers
* A quantifier introduces a temporary name for each element of the set it is considering. 
* This is called the bound variable.
* _vacuous truth_: `forall k :: p(k) ==> q(k)`
* Sometimes, try to write function `ensures` and loop `invariants` in a similar mananer. 

### Predicates
* Function that returns `bool`.
* Specify a one-liner property, e.g. if an array is sorted.
* The use of predicates makes our code shorter.

### Framing
* If a function parameter is a memory location (e.g. array), use `reads` to allow function to read that.
* Parameters to the function that are not memory locations do not need that to be declared.
* **Does not need `reads`:** Sets, sequences, and multisets are value types, and are treated like integers or local variables. 
* **Needs `reads`:** Arrays and objects are reference types, and they are stored on the heap 
* Methods do not need `reads`, they can read everything.
* Methods need `modifies` to modify a memory location.