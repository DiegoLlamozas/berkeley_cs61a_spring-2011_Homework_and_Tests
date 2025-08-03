#lang simply-scheme

(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))

(define (sqr x)
  (* x x))

(define (avg n1 n2)
  (/ (+ n1 n2) 2))

(define (sqrt x)
  (define (improve-guess guess)
    (avg guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs(- x (sqr guess))) 0.00000000001))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
      guess
      (sqrt-iter (improve-guess guess))))
  (sqrt-iter 1.0))

(sqrt 64)
(sqrt 16)
(sqrt 69)
(sqrt 25)
(sqrt 100)

(define (plural wd)
  (if (equal? (last wd) 'y)
      (word (bl wd) 'ies)
      (word wd 's)))

(plural 'book)

(first (first '(El pepe)))

(plural 'boy)

(item 6 'computer)

(define (vowel? letter)
  (member? letter '(a e i o u)))

(define (pl-done? wd)
  (vowel? (first wd)))

(define (pigl wd)
  (if (pl-done? wd)
      (word wd 'ay)
      (pigl (word (bf wd) (first wd)))))

(pigl 'scheme)

(word 'hola 'mundo)

(sentence 'hola 'mundo)

(sentence '(hola mundo) '(soy un navegador))

(define (buzz n)
  (cond ((equal? (remainder n 7) 0) 'buzz)
        ((member? 7 n) 'buzz)
        (else n)))

(buzz 14)
(buzz 15)
(buzz 17)

(random 10)