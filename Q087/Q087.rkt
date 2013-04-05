#lang racket
(require "../prime.rkt")

(define (prime-power limit)
  (let ((primes (gen-prime (integer-sqrt limit))))
    (define (looper a b c acc)
      (cond ((null? a) acc)
            ((null? b) (looper (cdr a) primes primes acc))
            ((null? c) (looper a (cdr b) primes acc))
            (#t (letrec ((i (car a))
                         (j (car b))
                         (k (car c))
                         (sum (+ (* i i) (* j j j)))
                         (sum2 (+ sum (* k k k k))))
                  (cond ((>= sum limit) (looper (cdr a) primes primes acc))
                        ((>= sum2 limit) (looper a (cdr b) primes acc))
                        (#t (looper a b (cdr c) (set-add acc sum2))))))))
    (set-count (looper primes primes primes (set)))))

