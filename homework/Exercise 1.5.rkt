#lang simply-scheme

(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))

; Con los primeros test el procedimiento funciona normalmente

(test 0 5)

;-> 0

(test 0 p)

;-> 0 (esto por más que p no esté definido)

; con el último crea una recursión infinita

(test 0 (p))

;expansion
;->(if (= 0 0) 0 (p))

;normal
;->(test 0 (p))
;->(test 0 (p))
;->(test 0 (p))
;...
