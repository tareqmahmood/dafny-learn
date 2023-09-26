# Learn Dafny

Here is the list of resources I went over to learn [Dafny](https://dafny.org/) for my CS839 System Verification course. [What is Dafny?](https://en.wikipedia.org/wiki/Dafny)

I will list some keypoints that I learned.

## R01: Getting Started with Dafny: A Guide
http://dafny.org/dafny/OnlineTutorial/guide.html

### Invoking Method inside a Method
If we call a method `A` from inside another method `B`, the only thing Dafny knows in `B` about the value returned from  `A` is what the **postconditions** say about it, and nothing more.

### Functions
A function body must consist of exactly one expression, with the correct type.