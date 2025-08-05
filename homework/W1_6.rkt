#lang simply-scheme
;  Most versions of Lisp provide and and or procedures like the ones on page 19. In
; principle there is no reason why these can’t be ordinary procedures, but some versions of
; Lisp make them special forms. Suppose, for example, we evaluate
; (or (= x 0) (= y 0) (= z 0))
; If or is an ordinary procedure, all three argument expressions will be evaluated before or
; is invoked. But if the variable x has the value 0, we know that the entire expression has
; to be true regardless of the values of y and z. A Lisp interpreter in which or is a special
; form can evaluate the arguments one by one until either a true one is found or it runs out
; of arguments.
; Your mission is to devise a test that will tell you whether Scheme’s and and or are special
; forms or ordinary functions. This is a somewhat tricky problem, but it’ll get you thinking
; about the evaluation process more deeply than you otherwise might.
; Why might it be advantageous for an interpreter to treat or as a special form and evaluate
; its arguments one at a time? Can you think of reasons why it might be advantageous to
; treat or as an ordinary function?

; Solución: En uno de los valores tanto de "and" como de "or" incluir un procedimiento recursivo, de tal forma si "and" y "or" nunca dan error es porque dejaron de leer antes de llegar a este procedimiento

(define (resursive-test n)
  (if (< n 0)
      #t
      (resursive-test (+ n 1))))

; las presentes expresiones funcionan ya que "and" y "or" nunca leen el procedimiento recursivo infinito

(and (< 1 2) (< 2 3) (< 420 69) (resursive-test 14) (< 7 8) (< 9 10) (< 11 12))
(or (> 1 2) (> 2 3) (> 420 69) (resursive-test 15) (> 7 8) (> 9 10) (> 11 12))

; Por el contrario estos los leen al inicio, por lo tanto causa error

;(and (resursive-test 14) (< 1 2) (< 2 3) (< 420 69)  (< 7 8) (< 9 10) (< 11 12))
;(or  (resursive-test 15) (> 1 2) (> 2 3) (> 420 69)  (> 7 8) (> 9 10) (> 11 12))