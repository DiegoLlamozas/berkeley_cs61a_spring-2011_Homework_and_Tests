#lang simply-scheme

(define (cube n)
  (* n n n))

(define (square n)
  (* n n))

(define (abs n)
  (if (< n 0) (- n) n))


(define (cube-root n)
  (define (good-enough? guess)
    (< (abs (- (cube guess) n)) 0.00001))
  (define (improve-guess guess)
    (/ (+ (/ n (square guess)) (* 2 guess)) 3))
  (define (cube-root-iter guess)
    (if (good-enough? guess)
        guess
        (cube-root-iter (improve-guess guess))))
  (cube-root-iter 1.0))

(cube-root 64)
(cube-root 27)
(cube-root 8)
(cube-root 125)
(cube-root 328509)
(cube-root 74088000)