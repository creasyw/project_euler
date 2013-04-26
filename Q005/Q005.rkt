#lang racket

;; Just a byproduct...
(define (factorial n)
  (if (= n 2) n (* n (factorial (- n 1)))))

;; The basic idea of "filter-lst" is to deduct the common factor from the list of candidates
;; everytime, the smallest number in the list is multiplied into result and eliminated from list.
;; Via this procedure, the latter numbers will be divided enough times for common factors.
(define (smallest-multiple num)
  (define (filter-lst lst acc)
    (if (null? lst) acc
        (filter-lst (map (lambda (x) (if (= 0 (modulo x (car lst))) (/ x (car lst)) x))(cdr lst))
                    (* acc (car lst)))))
  (filter-lst (range 2 num ) 1))