#lang simply-scheme
; 1. Do exercise 1.6, page 25. This is an essay question; you needn’t hand in any computer
; printout, unless you think the grader can’t read your handwriting. If you had trouble
; understanding the square root program in the book, explain instead what will happen if
; you use new-if instead of if in the pigl Pig Latin procedure.

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; (new-if (= 2 3) 0 5)

; (new-if (= 1 1) 0 5)

(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))

(define (sqr x)
  (* x x))

(define (avg n1 n2)
  (/ (+ n1 n2) 2))

(define (improve-guess guess x)
    (avg guess (/ x guess)))

(define (good-enough? guess x)
    (< (abs(- x (sqr guess))) 0.0001))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
    guess
    (sqrt-iter (improve-guess guess x) x)))

(define (sqrt x)
  (sqrt-iter 1 x))

(sqrt 64)

; Explicación:
; El procedimiento "(new-if (good-enough? guess x) guess (sqrt-iter (improve-guess guess x) x)))" es una combinación, NO una special form
; Por ende la sub-expresión "(sqrt-iter (improve-guess guess x) x)" se ejecuta ni bien el compilador está leyendo el procedimiento.
; Por ende la función termina en un ciclo recursivo eterno ya que se ejecuta la sub-expresión sin ninguna condición que la detenga.
; En cambio en una forma especial la sub-expresión únicamente se ejecuta si se cumple la condición de la condicional
