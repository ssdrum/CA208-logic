/*
 A list is a sequence of any number of items such as:
 [ann, tennis, tom, skiing]
 Prolog represents lists as binary trees with the following recursive definition:
 A list is either empty:
   []
 or is a combination of
   1) the first item, called the head of the list;
   2) the remaining part of the list, called the tail.
 The tail is often treated as a single object:
   L = [a, b, c]
   Tail = [b, c], and L = .(a, Tail) (concatenation)
 Concatenation can also be done with the vertical bar operator:
   L = [a | Tail]
   L = [a, b, ... | Others]
 */
