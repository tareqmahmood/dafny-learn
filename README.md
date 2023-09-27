# Learn Dafny

Here is the list of resources I went over to learn [Dafny](https://dafny.org/) for my CS839 System Verification course. [What is Dafny?](https://en.wikipedia.org/wiki/Dafny)

I will list some keypoints that I learned.

## R01: Getting Started with Dafny: A Guide
http://dafny.org/dafny/OnlineTutorial/guide.html

### Method
* Dafny **will not** discover properties of a method on its own.
* If we call a method `A` from inside another method `B`, the only thing Dafny knows in `B` about the value returned from  `A` is what the **postconditions** say about it, and nothing more.


### Functions
* Dafny will discover properties of a function on its own.
* A function body must consist of exactly one expression, with the correct type.
* Unlike methods, functions can appear in expressions. 

### Loop
* When you specify an invariant, Dafny proves two things: 
    1. the invariant holds upon entering the loop
    2. it is preserved by the loop.
        * Remind that, iterating variable can change within the loop before termination logic triggers 
* Dafny **will not** discover properties of a loop on its own (Unless told by invariant).
