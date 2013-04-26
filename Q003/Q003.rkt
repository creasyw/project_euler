#lang racket
(require "../prime.rkt")

(define (largest-prime num)
  (define (helper lst)
    (cond ((null? lst) 1)
          ((= 0 (modulo num (car lst))) (car lst))
          (#t (helper (cdr lst)))))
  (helper (reverse (gen-prime (integer-sqrt num)))))