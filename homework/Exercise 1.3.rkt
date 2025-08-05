#lang simply-scheme

; Exercise 1.3: Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

(define (sum-two-largest n1 n2 n3)
  (cond ((and (< n1 n2) (< n1 n3)) (+ n2 n3))
        ((and (< n2 n1) (< n2 n3)) (+ n1 n3))
        ((and (< n3 n1) (< n3 n2)) (+ n1 n2))))

;(sum-two-largest 1 2 3)
;(sum-two-largest 10 2 13)
;(sum-two-largest 10 22 3)

; Extra: Do it with any list of arguments

(define (comp-two-nums n1 n2)
  (if (< n1 n2)
      n2
      n1))

(define (sum-two-largest-enhanced-iter n-list n1 n2)
  (cond ((empty? n-list) (+ n1 n2))
        ((< n1 n2) (sum-two-largest-enhanced-iter (bf n-list) (comp-two-nums n1 (first n-list)) n2))
        (else (sum-two-largest-enhanced-iter (bf n-list) n1 (comp-two-nums n2 (first n-list))))))

(define (sum-two-largest-enhanced n-list)
  (sum-two-largest-enhanced-iter n-list 0 0))


(define num-list '(100 2 12 6 4 5 3))

num-list

(sum-two-largest-enhanced num-list)