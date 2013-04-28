#lang racket
(require "../prime.rkt")


(define (find-prime n)
  (letrec ((lst (gen-prime 100000))
           (begin (+ 1 (last lst)))
           (len (length lst)))
    (define (helper num left base)
      (cond ((<= left 0) (- num 1))
            ((null? base) (helper (+ num 1) (- left 1) lst))
            ((> (car base) (integer-sqrt num)) (helper (+ num 1) (- left 1) lst))
            ((= 0 (modulo num (car base))) (helper (+ num 1) left lst))
            (#t (helper num left (cdr base)))))
    (helper begin (- n len) lst)))