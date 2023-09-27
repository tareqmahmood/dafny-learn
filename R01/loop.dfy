method m1(n: nat)
{
    var i := 0;
    while i < n
        invariant 0 <= i
    {
        i := i + 1;
    }

    // following fails
    // assert i == n;
}


method m2(n: nat)
{
    var i := 0;
    while i < n
        invariant 0 <= i
    {
        i := i + 1;
    }

    assert 0 <= i;
}


method m3(n: nat)
{
    var i := 0;
    while i < n
        invariant i <= n
    {
        i := i + 1;
    }
    // EXPLAIN: why does this hold?
    assert 0 <= i;
}


method m4(n: nat)
{
    var i := 0;
    while i < n
        invariant i <= n
    {
        i := i + 1;
    }
    assert i <= n;
}


// Exercise 7. Change the loop invariant to 0 <= i <= n+2. Does the loop still verify? Does the assertion i == n after the loop still verify?

method m5(n: nat)
{
    var i: int := 0;
    while i < n
        invariant 0 <= i <= (n + 2)
    {
        i := i + 1;
    }
    // ANS: No.
    // assert i == n;
}


// Exercise 8. With the original loop invariant, change the loop guard from i < n to i != n. Do the loop and the assertion after the loop still verify? Why or why not?

method m(n: nat)
{
    var i: int := 0;
    while i != n
        invariant 0 <= i <= n
    {
        i := i + 1;
    }
    assert i == n;
}


function fib(n: nat): nat
{
    if n == 0 then 0
    else if n == 1 then 1
    else fib(n - 1) + fib(n - 2)
}

method computeFib(n: nat) returns (b: nat)
    ensures b == fib(n)
{
    if n == 0
    {
        return 0;
    }

    var i: nat := 1;
    var a: nat := 0;
    b := 1;

    while i < n
        invariant 0 < i <= n
        invariant b == fib(i)
        invariant a == fib(i - 1)
    {
        a, b := b, a + b;
        i := i + 1;
    }
    return b;
}



// Exercise 9. The ComputeFib method above is more complicated than 
// necessary. Write a simpler program by not introducing a as the 
// Fibonacci number that precedes b, but instead introducing a 
// variable c that succeeds b. Verify your program is correct 
// according to the mathematical definition of Fibonacci.

method ComputeFib2(n: nat) returns (b: nat)
  ensures b == fib(n)  // Do not change this postcondition
{
    // Change the method body to instead use c as described.
    // You will need to change both the initialization and the loop.
    if n == 0 { return 0; }
    var i: int := 1;
    b := 1;
    var c := 1;
    while i < n
        invariant 0 < i <= n
        invariant c == fib(i + 1)
        invariant b == fib(i)
    {
        c, b := b + c, c;
        i := i + 1;
    }
}



// TODO:
// Exercise 10. Starting with the completed ComputeFib method above, 
// delete the if statement and initialize i to 0, a to 1, and b to 0. 
// Verify this new program by adjusting the loop invariants to match 
// the new behavior.

method ComputeFib3(n: nat) returns (b: nat)
    ensures b == fib(n)
{
    var i: int := 0;
    var a := 1;
    b := 0;
    while i < n
    {
        a, b := b, a + b;
        i := i + 1;
    }
}