// =========================================
// Binary search
// =========================================

ghost predicate IsSorted(s:seq<int>) {
  forall left:nat,right:nat | left < right < |s| :: s[left] <= s[right]
}

method BinarySearch(haystack:seq<int>, needle:int) returns (index:nat)
  requires IsSorted(haystack)
  requires |haystack| >= 1
  ensures 0 <= index <= |haystack|
  ensures forall k :: 0 <= k < |haystack| && haystack[k] >= needle ==> index <= k
  ensures forall k :: 0 <= k < |haystack| && haystack[k] < needle ==> index > k
{
  var left := 0;
  var right := |haystack|;
  index := |haystack|;

  while left < right 
    // decreases right - left
    // invariant 0 <= left < |haystack|
    // invariant 1 <= right <= |haystack|
    // invariant 0 <= mid < |haystack| - 1
    // invariant left <= 1 + (left + right) / 2
    invariant 0 <= left <= |haystack|
    invariant left <= right
    invariant 0 <= (left + right) / 2 < |haystack|
  {
    var mid := (left + right) / 2;
    if haystack[mid] >= needle 
    {
      index := mid;
      right := mid;
    }
    else 
    {
      left := mid + 1;
    }
  }
  
  return index;
}


method UseBinarySearch() {
  var a := [1, 3, 5, 9];
  assert IsSorted(a);
  var x := BinarySearch(a, 4);

  assert a[1] < 4;
  assert a[2] >= 4;
  assert x == 2;
}