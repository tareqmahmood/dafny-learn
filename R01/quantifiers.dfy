method Find(a: array<int>, key: int) returns (index: int)
  ensures 0 <= index ==> index < a.Length && a[index] == key
  ensures index < 0 ==> forall k :: 0 <= k < a.Length ==> a[k] != key
{
  index := 0;
  while index < a.Length
    invariant forall k :: 0 <= k < index && k < a.Length ==> a[k] != key
  {
    if a[index] == key { return; }
    index := index + 1;
  }
  index := -1;
}


// Exercise 12. Write a method that takes an integer array, 
// which it requires to have at least one element, and returns 
// an index to the maximum of the array’s elements. Annotate 
// the method with pre- and postconditions that state the 
// intent of the method, and annotate its body with loop 
// invariant to verify it.

predicate VerifyMax(a: array<int>, i:int)
  requires 0 <= i < a.Length
  reads a
{
  forall k :: 0 <= k < a.Length ==> a[i] >= a[k] 
}

method FindMax(a: array<int>) returns (i: int)
  // Annotate this method with pre- and postconditions
  // that ensure it behaves as described.
  requires a.Length > 0
  ensures 0 <= i < a.Length
  // ensures forall k :: 0 <= k < a.Length ==> a[i] >= a[k] 
  ensures VerifyMax(a, i)
{
  // Fill in the body that calculates the INDEX of the maximum.
  i := 0;
  var j := 1;

  while j < a.Length
    invariant 0 <= i < a.Length
    invariant 1 <= j <= a.Length
    invariant forall k :: 0 <= k < j ==> a[i] >= a[k]
  {
    if a[j] > a[i] 
    {
      i := j;
    }
    j := j + 1;
  }
}

