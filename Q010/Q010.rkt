#lang racket
(require "../prime.rkt")

(define (sum-primes limit)
  (letrec ((lst (gen-prime limit)))
    (foldl + 0 lst)))