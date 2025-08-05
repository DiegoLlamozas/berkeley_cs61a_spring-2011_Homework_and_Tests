#lang simply-scheme
; Write a procedure ends-e that takes a sentence as its argument and returns a sentence
; containing only those words of the argument whose last letter is E:
; > (ends-e ’(please put the salami above the blue elephant))
; (please the above the blue)

(define (ends-e? wd)
  (if (equal? (last wd) 'e)
      wd
      '()))

(define (count-words-in-e sent)
  (if (empty? sent)
      '()
      (sentence (ends-e? (first sent)) (count-words-in-e (bf sent)))))

(count-words-in-e '(please put the salami above the blue elephant))
