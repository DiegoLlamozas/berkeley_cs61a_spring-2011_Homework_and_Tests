#lang simply-scheme
; Write a predicate ordered? that takes a sentence of numbers as its argument and
; returns a true value if the numbers are in ascending order, or a false value otherwise

(define (ordered? n-list)
  (if (empty? (bf n-list))
       #t
       (and (< (first n-list) (first (bf n-list))) (ordered? (bf n-list)))))

(ordered? '(1 2 3 4 5))

(ordered? '(1 2 1 4 5))

(ordered? '(12 21 111 4222 55555))
 
(ordered? '(12 21 111 4222 55555 3))
