#lang simply-scheme
; Write a procedure squares that takes a sentence of numbers as its argument and
; returns a sentence of the squares of the numbers:
; > (squares ’(2 3 4 5))
; (4 9 16 25)

(define (square n)
  (* n n))

(define (square-list n-list)
  (if (empty? n-list)
      '()
      (sentence (square (first n-list)) (square-list (bf n-list)))))

(square-list '(2 3 4 5))
(square-list '(4 9 16 25))
(square-list '(16 81 256 625))

