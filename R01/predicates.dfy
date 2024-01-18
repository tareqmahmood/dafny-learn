predicate sorted(a: array<int>)
  reads a
{
  forall j, k :: 0 <= j < k < a.Length ==> a[j] <= a[k]
}

// Exercise 13. Modify the definition of the sorted 
// predicate so that it returns true exactly when 
// the array is sorted and all its elements are distinct.

predicate sorted1(a: array<int>)
  reads a
{
  forall k :: 1 <= k < a.Length ==> a[k - 1] <= a[k]
}

// Exercise 14. Change the definition of sorted so that 
// it allows its argument to be null (using a nullable 
// array type) but returns false if it is.

predicate sorted2(a: array<int>) // Change the type
  reads a
{
  // Change this definition to treat null arrays as "not sorted".
  // (i.e. return false for null arrays)
  if a.Length == 0 then false
  else forall k :: 1 <= k < a.Length ==> a[k - 1] <= a[k]
}