#lang racket
(provide (all-defined-out))

(define (sum_of_digit_square x)
  (if (= x 0) 0
      (letrec ([mod (remainder x 10)])
        (+ (expt mod 2) (sum_of_digit_square (quotient (- x mod) 10))))))

(define (end_eightynine x)
  (cond [(= x 89) #t]
        [(= x 1) #f]
        [#t (end_eightynine (sum_of_digit_square x))]))

(define (q092)
  (define (local_helper limit acc)
    (if (= limit 0) acc
        (if (end_eightynine limit) (local_helper (- limit 1) (+ acc 1))
            (local_helper (- limit 1) acc))))
  (local_helper 10000000 0))